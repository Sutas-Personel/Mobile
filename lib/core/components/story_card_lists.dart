import 'package:SutasPersonel/models/story_model.dart';
import 'package:SutasPersonel/view/story_screen/story_screen.dart';
import 'package:flutter/material.dart';
import '../../core/extension/context_entension.dart';
import 'story_card.dart';

class StoryCardLists extends StatefulWidget {
  final List<StoryModel> stories;

  StoryCardLists({Key key, this.stories}) : super(key: key);

  @override
  _StoryCardListsState createState() => _StoryCardListsState();
}

class _StoryCardListsState extends State<StoryCardLists> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.15,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.stories.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StoryScreen()),
              );
            },
            child: StoryCard(
                imgUrl: storyUserUrl(
                    storyUrl: widget.stories[index].url,
                    isStoryMedia: widget.stories[index].media))),
      ),
    );
  }

  storyUserUrl({isStoryMedia, storyUrl}) {
    String logo =
        "https://www.sutas.com.tr/uploads/setting/seo/6281b9c4a8e57cb110cdda5bdc06ffbc.png";
    return isStoryMedia == "IMAGE" ? storyUrl : logo;
  }
}
