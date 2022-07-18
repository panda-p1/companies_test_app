import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_test_app/constants/svg_path.dart';

const _kMockupPadding = 14.0;

class HomeScreenFloatingButtonView extends StatelessWidget {
  const HomeScreenFloatingButtonView({Key? key,}) : super(key: key);

  static const size = 51.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: size - _kMockupPadding),
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(248, 213, 72, 1),
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(113, 110, 93, 0.38),
            offset: Offset(0, 8),
            blurRadius: 10,
          )
        ]
      ),
      child: Center(
        child: SvgPicture.asset(SvgPath.bpBottomBarIcon),
      ),
    );
  }
}
