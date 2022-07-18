import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_test_app/constants/svg_path.dart';

class BottomNavBarIconView extends StatelessWidget {
  final void Function(int index) onPressed;
  final int groupValue;
  final int value;
  final String iconPath;
  const BottomNavBarIconView({Key? key,
    required this.onPressed,
    required this.groupValue,
    required this.value,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final active = groupValue == value;
    return Expanded(
      child: GestureDetector(
        onTap: () => onPressed(groupValue),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: active ? [
                const BoxShadow(
                  blurRadius: 7,
                  color: Color.fromRGBO(255, 216, 60, 1),
                ),
            ] : null,
          ),
          child: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(iconPath, color: active ? Colors.black : null,),
            ),
          ),
        ),
      ),
    );
  }
}
