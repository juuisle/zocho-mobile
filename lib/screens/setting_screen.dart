import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  static const routeName = '/setting';

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool _isAutomation = false;
  bool _powerSaver = false;
  bool _receiveNotify = false;
  bool _autoUpdate = false;
  bool _storeData = false;
  bool _experimentalMode = true;

  @override
  initState() {
    _isAutomation = true;
    _autoUpdate = true;
    _powerSaver = false;
    _receiveNotify = true;
    _storeData = false;
    _experimentalMode = true;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
//      appBar: AppBar(
//        title: Text('Zocho Setting'),
//      ),
        //drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Devices Usage',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    'Power Saver Mode',
                    'Save energy, by reducing performance',
                    _powerSaver,
                    (newValue) {
                      setState(
                        () {
                          _powerSaver = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Reveice push notification',
                    'Immediately update the status of the garden',
                    _receiveNotify,
                    (newValue) {
                      setState(
                        () {
                          _receiveNotify = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Store all data on phone',
                    'All data will be store in the phone',
                    _storeData,
                    (newValue) {
                      setState(
                        () {
                          _storeData = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Experimental Mode',
                    'Some feature may not work properly',
                    _experimentalMode,
                    (newValue) {
                      setState(
                        () {
                          _experimentalMode = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Automation Setting',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                    'Automatically',
                    'Allow the system to run automatically',
                    _isAutomation,
                    (newValue) {
                      setState(
                        () {
                          _isAutomation = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    'Auto Update',
                    'Auto update sytem firmware and software',
                    _autoUpdate,
                    (newValue) {
                      setState(
                        () {
                          _autoUpdate = newValue;
                        },
                      );
                    },
                  ),
                  Card(
                    color: Theme.of(context).primaryColor,
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        'SIGN IN',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.title,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
