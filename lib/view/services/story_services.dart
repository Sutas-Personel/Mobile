import 'package:SutasPersonel/core/constants/http_request_enum.dart';
import 'package:SutasPersonel/view/models/story_model.dart';
import 'package:SutasPersonel/view/services/base_services.dart';

import 'interfaces/IStoryServices.dart';

class Story extends BaseService implements IStoryService {
  static Story _instance;
  static Story get instance {
    if (_instance == null) _instance = Story._init();
    return _instance;
  }

  Story._init();

  Future<List<StoryModel>> getStoryList() async {
    return (await coreDio.fetch<List<StoryModel>, StoryModel>("story/getAll",
            type: HttpTypes.GET, parseModel: StoryModel()))
        .data;
  }
}
