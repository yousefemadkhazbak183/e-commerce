import 'package:flutter/material.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext buildContext, required String message}) {
    showDialog(
        barrierDismissible: false,
        context: buildContext,
        builder: (buildContext) {
          return AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(message),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }
}
