import 'package:flutter/material.dart';
import 'package:news_test_app/api/news_provider.dart';
import 'package:news_test_app/constants/image_path.dart';
import 'package:news_test_app/constants/strings/home_screen/home_screen.dart';
import 'package:news_test_app/home/other_page/view.dart';
import 'package:news_test_app/home/widgets/bottom_nav_bar.dart';
import 'package:news_test_app/home/widgets/floating_button.dart';
import 'package:news_test_app/managers/news_feed_manager.dart';

import 'main_page/view.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {

  final pageController = PageController();
  final index = ValueNotifier(0);
  final NewsProviderRepo newsFeedProvider = NewsFeedDecorator(NewsProvider());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const HomeScreenFloatingButtonView(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: index,
        builder: (_, index, __) => HomeScreenBottomNavBarView(
          onPressed: _onBottomNavBarItemPressed,
          index: index,
        ),
      ),
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.bgcImage),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SafeArea(
          child: PageView(
            controller: pageController,
            onPageChanged: (int index) => this.index.value = index,
            children: [
              HomeScreenMainPageView(
                newsFeedProvider: newsFeedProvider,
              ),
              const OtherPageView(HomeScreenStrings.myCompanies),
              const OtherPageView(HomeScreenStrings.calendar),
              const OtherPageView(HomeScreenStrings.profile),
            ],
          ),
        ),
      ),
    );
  }

  void _onBottomNavBarItemPressed(int index) {
    pageController.jumpToPage(index);
  }
}
