import 'package:flutter/cupertino.dart';
import 'package:news_test_app/constants/strings/common.dart';
import 'package:news_test_app/constants/strings/home_screen/news_details.dart';

class OkSimpleDialog {
  const OkSimpleDialog._();
  static Future<void> show(BuildContext context, {
    String? title,
    String? text,
  }) async {
    await showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) =>  CupertinoAlertDialog(
        title: title == null ? null : Text(title),
        content: text == null ? null : Text(text),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}

class InDevelopmentSimpleDialog {
  const InDevelopmentSimpleDialog._();
  static Future<void> show(BuildContext context, {String? title, String? text}) {
    return OkSimpleDialog.show(context,
      title: title,
      text: text ?? CommonStrings.onDevelopment,
    );
  }
}