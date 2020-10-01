import '../../models/news_model.dart';

abstract class INewsService {
  Future<List<NewsModel>> getNewsList();
  Future<NewsModel> getNewsSearch(String newsId);
}
