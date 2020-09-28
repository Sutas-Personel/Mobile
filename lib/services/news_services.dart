import 'package:SutasPersonel/core/base/base_model.dart';
import 'package:SutasPersonel/core/constants/http_request_enum.dart';
import 'package:SutasPersonel/models/news_model.dart';
import 'package:SutasPersonel/services/base_services.dart';
import 'package:SutasPersonel/services/interfaces/INewsService.dart';

class News extends BaseService implements INewsService {
  static News _instance;
  static News get instance {
    if (_instance == null) _instance = News._init();
    return _instance;
  }

  News._init();

  Future<List<NewsModel>> getNewsList() async {
    return (await coreDio.fetch<List<NewsModel>, NewsModel>("news/getAll",
            type: HttpTypes.GET, parseModel: NewsModel()))
        .data;
  }
}
