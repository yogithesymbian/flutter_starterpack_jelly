import 'package:flutter/material.dart';
import 'package:flutter_starterpack_jelly/utils/constanta.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class JellyAlert {
  // void alertErr() async {
  //   Alert(
  //     context: context,
  //     style: alertStyle,
  //     type: AlertType.error,
  //     title: title,
  //     desc: desc,
  //     buttons: [
  //       DialogButton(
  //         child: Text(
  //           "COOL",
  //           style: TextStyle(color: Colors.white, fontSize: 20),
  //         ),
  //         onPressed: () => Navigator.pop(context),
  //         color: Color.fromRGBO(0, 179, 134, 1.0),
  //         radius: BorderRadius.circular(0.0),
  //       ),
  //     ],
  //   ).show();
  // }

  static void alertSuccess(
    BuildContext context,
    String? title,
    String? desc,
    Function()? onOk,
    Function()? onCancel,
  ) async {
    Alert(
      context: context,
      // style: alertStyle,
      type: AlertType.success,
      title: title,
      desc: desc,
      buttons: [
        DialogButton(
          child: Text(
            "COOL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => onOk,
          color: Color.fromRGBO(0, 179, 134, 1.0),
          radius: BorderRadius.circular(0.0),
        ),
      ],
    ).show();
  }
}
