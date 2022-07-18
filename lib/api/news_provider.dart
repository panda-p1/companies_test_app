import 'package:news_test_app/api/provider.dart';
import 'package:news_test_app/api/provider_response.dart';
import 'package:news_test_app/data/news/news.dart';
import 'package:news_test_app/data/news/parser.dart';

abstract class NewsProviderRepo {
  Future<ProviderResponse<List<News>>> getNews();
}

class NewsProvider extends Provider implements NewsProviderRepo {
  static const _url = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<ProviderResponse<List<News>>> getNews() async {
    final response = await get(_url);
    if(response.isFail()) {
      return response.unType();
    }
    return response.assignContent(NewsParser.parseListJson(response.content));
  }
}