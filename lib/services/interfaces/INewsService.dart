import 'package:SutasPersonel/models/news_model.dart';

import '../news_services.dart';

abstract class INewsService {
  Future<List<NewsModel>> getNewsList();
}
