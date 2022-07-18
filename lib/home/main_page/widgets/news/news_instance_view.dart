import 'package:flutter/material.dart';
import 'package:news_test_app/data/news/news.dart';
import 'package:news_test_app/home/main_page/widgets/news/news_details_view.dart';
import 'package:news_test_app/tools/date_ui_tool.dart';

class NewsInstanceView extends StatelessWidget {
  final News news;
  final EdgeInsets? margin;
  const NewsInstanceView(this.news, {Key? key,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () => _onNewsPressed(context),
        child: Container(
          height: 166,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(image: AssetImage(news.imagePath),
              fit: BoxFit.fitWidth
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('${DateUITool(news.date).makeShortDotString()} - ${news.shortTitle}',
                  maxLines: 1,
                  style: textStyle,
                ),
                Text(news.body,
                  maxLines: 2,
                  style: textStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onNewsPressed(BuildContext context) {
    Navigator.of(context).push(
      _createRoute(),
    );
  }

  Route _createRoute() {
    return MaterialPageRoute(builder: (_) => NewsDetailsView(news,));
  }

  static const textStyle = TextStyle(
    fontWeight: FontWeight.w600,
    color: Colors.white,
    overflow: TextOverflow.ellipsis,
    fontSize: 14,
  );
}
