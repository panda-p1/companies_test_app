import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_test_app/constants/image_path.dart';
import 'package:news_test_app/constants/strings/home_screen/news_details.dart';
import 'package:news_test_app/data/news/news.dart';
import 'package:news_test_app/tools/date_ui_tool.dart';
import 'package:news_test_app/tools/dialog.dart';

class NewsDetailsView extends StatelessWidget {
  final News news;
  const NewsDetailsView(this.news, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(43, 42, 40, 0.5),
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          splashRadius: 24,
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.ios_share),
            splashRadius: 24,
            onPressed: () => onSharePressed(context),
          ),
        ]
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImagePath.bgcImage),
            fit: BoxFit.cover,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0,),
                height: MediaQuery.of(context).size.height * 0.37, // according to mockup
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(news.imagePath),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                child: Text(news.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16,),
                      Text(DateUITool(news.date).makeDayMonthNameYearTimeString()),
                      const SizedBox(height: 16,),
                      Text(news.body,
                        textAlign: TextAlign.left,
                      ),
                      const SizedBox(width: double.infinity,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSharePressed(BuildContext context) {
    InDevelopmentSimpleDialog.show(context, title: NewsDetailsStrings.sharing, );
  }
}
