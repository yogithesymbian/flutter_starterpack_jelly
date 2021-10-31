import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandlerScreen extends StatefulWidget {
  static const String id = '/permission_handler_screen';
  const PermissionHandlerScreen({Key? key}) : super(key: key);

  @override
  _PermissionHandlerScreenState createState() =>
      _PermissionHandlerScreenState();
}

class _PermissionHandlerScreenState extends State<PermissionHandlerScreen> {
  Future<void> requestCameraPermission() async {
    final serviceStatus = await Permission.camera.isGranted;

    bool isCameraOn = serviceStatus == ServiceStatus.enabled;

    final status = await Permission.camera.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permission Granted'),
          action: SnackBarAction(
            // textColor: ,
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        ),
      );
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permission denied'),
          action: SnackBarAction(
            // textColor: ,
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        ),
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permission Permanently Denied'),
          action: SnackBarAction(
            // textColor: ,
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        ),
      );
      await openAppSettings();
    }
  }

  Future<void> requestLocationPermission() async {
    final serviceStatusLocation = await Permission.locationWhenInUse.isGranted;

    bool isLocation = serviceStatusLocation == ServiceStatus.enabled;

    final status = await Permission.locationWhenInUse.request();

    if (status == PermissionStatus.granted) {
      print('Permission Granted');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permission Granted'),
          action: SnackBarAction(
            // textColor: ,
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        ),
      );
    } else if (status == PermissionStatus.denied) {
      print('Permission denied');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permission denied'),
          action: SnackBarAction(
            // textColor: ,
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        ),
      );
    } else if (status == PermissionStatus.permanentlyDenied) {
      print('Permission Permanently Denied');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permission Permanently Denied'),
          action: SnackBarAction(
            // textColor: ,
            label: '',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        ),
      );
      await openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permission Handler'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  requestCameraPermission();
                },
                child: Text(
                  'request camera',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  requestLocationPermission();
                },
                child: Text(
                  'request location',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
