import 'package:flutter/material.dart';
import 'package:news_test_app/api/news_provider.dart';
import 'package:news_test_app/constants/image_path.dart';
import 'package:news_test_app/constants/strings/home_screen/home_screen_main_page.dart';
import 'package:news_test_app/home/main_page/widgets/news/news_feed_view.dart';
import 'package:news_test_app/home/main_page/widgets/notification_view.dart';
import 'package:news_test_app/home/main_page/widgets/title_item_text_view.dart';

class HomeScreenMainPageView extends StatelessWidget {
  final NewsProviderRepo newsFeedProvider;
  const HomeScreenMainPageView({Key? key,
    required this.newsFeedProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 20.0);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Center(child: Image.asset(ImagePath.accountant)),
                const SizedBox(height: 10,),
                const Center(child: Text(HomeScreenMainPageStrings.yourAccountant,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                )),
                const SizedBox(height: 11,),
                const Center(child: Text(HomeScreenMainPageStrings.accountantInstanceName,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),),
                const SizedBox(height: 20,),
                const HomeScreenMainTitleTextView(HomeScreenMainPageStrings.notifications,),
                const SizedBox(height: 16,),
              ],
            ),
          ),

          const NotificationView(
            margin: padding,
            description: HomeScreenMainPageStrings.addFirstCompanyNotification,
            imagePath: ImagePath.addFirstCompanyNotification,
          ),


          Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28,),
                const HomeScreenMainTitleTextView(HomeScreenMainPageStrings.news,),
                const SizedBox(height: 7,),
                NewsFeedView(api: newsFeedProvider,),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
