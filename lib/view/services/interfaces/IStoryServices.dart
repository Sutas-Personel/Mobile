import 'package:SutasPersonel/view/models/story_model.dart';

abstract class IStoryService {
  Future<List<StoryModel>> getStoryList();
}
