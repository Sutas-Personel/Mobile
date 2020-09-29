import 'package:SutasPersonel/models/story_model.dart';

abstract class IStoryService {
  Future<List<StoryModel>> getStoryList();
}
