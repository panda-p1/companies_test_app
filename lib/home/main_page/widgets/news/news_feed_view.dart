import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_test_app/api/news_provider.dart';
import 'package:news_test_app/data/news/news.dart';
import 'package:news_test_app/home/main_page/widgets/news/news_instance_view.dart';

class NewsFeedView extends StatefulWidget {
  final NewsProviderRepo api;
  const NewsFeedView({Key? key,
    required this.api,
  }) : super(key: key);

  @override
  _NewsFeedViewState createState() => _NewsFeedViewState();
}

class _NewsFeedViewState extends State<NewsFeedView> {

  final loading = ValueNotifier(false);
  final hasError = ValueNotifier(false);
  List<News>? _newsList;
  List<News> get newsList => _newsList!;
  bool areNewsLoaded() => _newsList != null;

  @override
  void initState() {
    _init();
    super.initState();
  }

  void _init() async {
    await Future.delayed(Duration.zero);
    _tryLoadNews();
  }

  void _tryLoadNews() async {
    try {
      await _loadNews();
    } catch(e) {
      print(e);
      hasError.value = true;
      loading.value = false;
    }
  }

  Future<void> _loadNews() async {
    loading.value = true;

    final response = await widget.api.getNews();

    if(response.isFail()) {
      hasError.value = true;
      loading.value = false;
      return;
    }

    _newsList = response.content!;
    loading.value = false;
    hasError.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loading,
      builder: (_, loading, __) {
        if(loading) {
          return const SizedBox(
            height: 100,
            child: Center(
              child: CupertinoActivityIndicator(),
            ),
          );
        }
        return ValueListenableBuilder<bool>(
          valueListenable: hasError,
          builder: (_, hasError, __) {
            if(hasError) {
              return SizedBox(
                height: 100,
                child: Center(
                  child: TextButton(
                    onPressed: _onReloadPressed,
                    child: const Text('Reload'),
                  ),
                ),
              );
            }
            if(!areNewsLoaded()) {
              return const SizedBox();
            }
            return Column(
              children: newsList.map((e) => NewsInstanceView(e,
                margin: const EdgeInsets.symmetric(vertical: 4.0,),
              )).toList(),
            );
          },
        );

      },
    );
  }
  
  void _onReloadPressed() {
    _tryLoadNews();
  }
}
