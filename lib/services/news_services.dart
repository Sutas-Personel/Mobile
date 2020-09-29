
import '../core/constants/http_enums.dart';
import '../models/news_model.dart';
import 'base_services.dart';
import 'interfaces/INewsService.dart';

class NewsService extends BaseService implements INewsService {
  static NewsService _instance;
  static NewsService get instance {
    if (_instance == null) _instance = NewsService._init();
    return _instance;
  }

  NewsService._init();

  Future<List<NewsModel>> getNewsList() async {
    return (await coreDio.fetch<List<NewsModel>, NewsModel>("news/GetAll",
            type: HttpTypes.GET, parseModel: NewsModel()))
        .data;
  }
}
