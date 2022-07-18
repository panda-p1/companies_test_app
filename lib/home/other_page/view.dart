import 'package:flutter/material.dart';
import 'package:news_test_app/constants/image_path.dart';
import 'package:news_test_app/constants/strings/home_screen/other_page.dart';

class OtherPageView extends StatelessWidget {
  final String functionality;
  const OtherPageView(this.functionality, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 65.0),
            child: Text(HomeScreenOtherPageStrings.functionalityInDevelopment(functionality),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Center(
            child: Image.asset(ImagePath.inDevelopment),
          ),
        ],
      ),
    );
  }
}
