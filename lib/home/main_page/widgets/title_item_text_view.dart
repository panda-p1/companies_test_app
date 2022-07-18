import 'package:flutter/material.dart';

class HomeScreenMainTitleTextView extends StatelessWidget {
  final String text;
  const HomeScreenMainTitleTextView(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}
