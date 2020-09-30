import 'package:SutasPersonel/core/constants/http_enums.dart';
import 'package:SutasPersonel/models/story_model.dart';
import 'package:SutasPersonel/services/base_services.dart';

import 'interfaces/IStoryServices.dart';

class StoryService extends BaseService implements IStoryService {
  static StoryService _instance;
  static StoryService get instance {
    if (_instance == null) _instance = StoryService._init();
    return _instance;
  }

  StoryService._init();

  Future<List<StoryModel>> getStoryList() async {
    return (await coreDio.fetch<List<StoryModel>, StoryModel>("story/getAll",
            type: HttpTypes.GET, parseModel: StoryModel()))
        .data;
  }

   Future<StoryModel> getNewsSearch(String storyID) async {
    return (await coreDio.fetch<StoryModel, StoryModel>("story/search/$storyID",
            type: HttpTypes.GET, parseModel: StoryModel()))
        .data;
  }
}
