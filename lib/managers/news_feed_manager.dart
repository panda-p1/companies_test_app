import 'package:news_test_app/api/news_provider.dart';
import 'package:news_test_app/api/provider.dart';
import 'package:news_test_app/api/provider_response.dart';
import 'package:news_test_app/data/news/news.dart';

class NewsFeedDecorator implements NewsProviderRepo {
  NewsFeedDecorator(this._provider);

  final NewsProviderRepo _provider;
  List<News>? _news;

  @override
  Future<ProviderResponse<List<News>>> getNews() async {
    if(_news != null) {
      return ProviderResponse(success: true, content: _news, );
    }
    final response = await _provider.getNews();
    if(response.isSuccess()) {
      _news = response.content!;
    }

    return response;

  }
}