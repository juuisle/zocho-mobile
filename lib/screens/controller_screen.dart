import 'package:flutter/material.dart';
import 'package:zocho_ten_mobile/data/mqtt_service.dart';

class ControllerScreen extends StatefulWidget {
  static const routeName = '/controler';

  ControllerScreen({Key key}) : super(key: key);

  @override
  _ControllerScreenState createState() => _ControllerScreenState();
}

class _ControllerScreenState extends State<ControllerScreen> {
  double _temp = 20;
  MqttService mqtt = MqttService();

  void turnOn() {
    mqtt.publish("device/solenoid/control", "ON");
  }

  void turnOff() {
    mqtt.publish("device/solenoid/control", "OFF");
  }

  @override
  Widget build(BuildContext context) {
    //mqtt.subscribe("device/sensor/status");

    return Scaffold(
        body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
//          FutureBuilder<List<Moisture>>(
//            future: mqtt.onData(),
//            builder: (context, snapshot) {
//              if (snapshot.hasData) {
//                print(snapshot);
//                return ListView(
//                  children: <Widget>[],
//                );
//              }
//              return Center(
//                child: CircularProgressIndicator(),
//              );
//            },
//          ),
          RaisedButton(
            elevation: 4,
            padding: const EdgeInsets.all(20.0),
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
            child: Container(
              width: 200,
              child: Text(
                'TURN ON THE DEMO',
                textAlign: TextAlign.center,
              ),
            ),
            onPressed: () {
              turnOn();
            },
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            textColor: Colors.black,
            padding: const EdgeInsets.all(20.0),
            elevation: 4,
            color: Theme.of(context).accentColor,
            child: Container(
              width: 200,
              child: Text(
                'TURN OFF THE DEMO',
                textAlign: TextAlign.center,
              ),
            ),
            onPressed: () {
              turnOff();
            },
          ),
        ],
      ),
    ));
  }
}
