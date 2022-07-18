import 'package:flutter/material.dart';
import 'package:news_test_app/constants/svg_path.dart';
import 'package:news_test_app/home/widgets/bottom_nav_bar_icon.dart';
import 'package:news_test_app/home/widgets/floating_button.dart';

class HomeScreenBottomNavBarView extends StatelessWidget {
  final void Function(int index) onPressed;
  final int index;
  const HomeScreenBottomNavBarView({Key? key,
    required this.onPressed,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            BottomNavBarIconView(
              groupValue: 0,
              value: index,
              onPressed: onPressed,
              iconPath: SvgPath.mainBottomBarIcon,
            ),
            BottomNavBarIconView(
              groupValue: 1,
              value: index,
              onPressed: onPressed,
              iconPath: SvgPath.myCompaniesBottomBarIcon,
            ),

            const SizedBox(width: HomeScreenFloatingButtonView.size,),
            BottomNavBarIconView(
              groupValue: 2,
              value: index,
              onPressed: onPressed,
              iconPath: SvgPath.calendarBottomBarIcon,
            ),
            BottomNavBarIconView(
              groupValue: 3,
              value: index,
              onPressed: onPressed,
              iconPath: SvgPath.profileBottomBarIcon,
            ),

          ],
        ),
      ),
    );
  }
}
