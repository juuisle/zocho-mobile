import 'package:mqtt_client/mqtt_client.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  MqttClient client;
  String previousTopic;
  bool bAlreadySubscribed = false;

  Future<bool> subscribe(String topic) async {
    if (await _connectToClient() == true) {
      client.onDisconnected = _onDisconnected;
      client.onConnected = _onConnected;
      client.onSubscribed = _onSubscribed;
      _subscribe(topic);
    }
    return true;
  }

  Future<bool> _connectToClient() async {
    if (client != null &&
        client.connectionStatus.state == MqttConnectionState.connected) {
      print('already logged in');
    } else {
      client = await _login();
      if (client == null) {
        return false;
      }
    }
    return true;
  }

  /// The subscribed callback
  void _onSubscribed(String topic) {
    print('Subscription confirmed for topic $topic');
    this.bAlreadySubscribed = true;
    this.previousTopic = topic;
  }

  /// The unsolicited disconnect callback
  void _onDisconnected() {
    print('OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus.returnCode ==
        MqttConnectReturnCode.connectionAccepted) {
      print(':OnDisconnected callback is solicited, this is correct');
    }
    client.disconnect();
  }

  /// The successful connect callback
  void _onConnected() {
    print('OnConnected client callback - Client connection was sucessful');
  }

  Future<Map> _getBrokerAndKey() async {
    String connect = await rootBundle.loadString('assets/config.json');
    return (json.decode(connect));
  }

  Future<MqttClient> _login() async {
    // With await, we are assured of getting a string back and not a
    // Future<String> placeholder instance.

    Map connectJson = await _getBrokerAndKey();

    client = MqttServerClient(connectJson["broker"], '');
    client.port = 8883;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier('myClientID')
        .keepAliveFor(30) // Must agree with the keep alive set above or not set
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atMostOnce);
    client.connectionMessage = connMess;

    /// Connect the client, any errors here are communicated by raising of the appropriate exception. Note
    /// in some circumstances the broker will just disconnect us, see the spec about this, we however eill
    /// never send malformed messages.
    try {
      await client.connect();
    } on Exception catch (e) {
      print('EXCEPTION::client exception - $e');
      client.disconnect();
      client = null;
      return client;
    }

    /// Check we are connected
    if (client.connectionStatus.state == MqttConnectionState.connected) {
      print('Client Connected');
    } else {
      /// Use status here rather than state if you also want the broker return code.
      print(
          'Connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      client = null;
    }
    return client;
  }
//
//  // ignore: missing_return
//  Future<List<Sensor>> onData(List<MqttReceivedMessage<MqttMessage>> event) {
//      final MqttPublishMessage recMess = event[0].payload;
//      final String payload =
//      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
//
//      List<Sensor> sensor =
//
//      body.map((dynamic item) => Plant.fromJson(item)).toList();
//
//      /// The payload is a byte buffer, this will be specific to the topic
//      print(
//          'Change notification:: topic is <${event[0].topic}>, payload is <-- $payload -->');
//      return sensor;
//  }

  Future _subscribe(String topic) async {
    // for now hardcoding the topic
    if (this.bAlreadySubscribed == true) {
      client.unsubscribe(this.previousTopic);
    }
    print('Subscribing to the topic $topic');
    client.subscribe(topic, MqttQos.atMostOnce);

    /// The client has a change notifier object(see the Observable class) which we then listen to to get
    /// notifications of published updates to each subscribed topic.
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      /// The payload is a byte buffer, this will be specific to the topic
      print(
          'Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      return pt;
    });
  }

  Future<void> publish(String topic, String value) async {
    // Connect to the client if we haven't already
    if (await _connectToClient() == true) {
      final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
      builder.addString(value);
      client.publishMessage(topic, MqttQos.atMostOnce, builder.payload);
    }
  }
}
