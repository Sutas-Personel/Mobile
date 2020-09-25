import 'package:SutasPersonel/model/data.dart';
import 'package:SutasPersonel/model/story_servis_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'story_screen_view_model.dart';

class StoryScreenView extends StoryScreenViewModel
    with SingleTickerProviderStateMixin {
  // List<Story> stories;
  PageController _pageController;
  AnimationController _animationController;
  VideoPlayerController _videoController;
  int _currentIndex = 0;
  // StoryScreenView({@required this.stories});
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _pageController = PageController();
    _animationController = AnimationController(vsync: this);
    final Story firstStory = stories.first;
    _loadStory(story:firstStory,animateToPage: false);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    _animationController.dispose();
    _videoController?.dispose();
    super.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: [
            PageView.builder(
                physics:
                    NeverScrollableScrollPhysics(), //????????????????????????????????
                controller: _pageController,
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final Story story = stories[index];

                  switch (story.media) {
                    case MediaType.image:
                      print("resim");
                      return CachedNetworkImage(
                        imageUrl: story.url,
                        fit: BoxFit.cover,
                      );
                      break;
                    case MediaType.video:
                      print("video");

                      if (_videoController != null &&
                          _videoController.value.initialized) {
                        return FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                                width: _videoController.value.size.width,
                                height: _videoController.value.size.height,
                                child: VideoPlayer(_videoController)));
                      }
                      break;
                  }
                  return const SizedBox
                      .shrink(); //????????????????????????????????
                })
          ],
        ),
      ),
    );
  }

  void _loadStory({Story story, bool animateToPage = true}) {
    _animationController.stop();
    _animationController.reset();
    switch (story.media) {
      case MediaType.image:
        _animationController.duration = story.duration;
        _animationController.forward();
        break;
      case MediaType.video:
        _videoController = null;
        _videoController
            ?.dispose(); // Ternory operatör yani null ise dispose çağır demek oluyor sistemi devam ettiriyor. kullanımı çok doğru değil.
        _videoController = VideoPlayerController.network(story.url)
          ..initialize().then((value) {
            setState(() {});

            if (_videoController.value.initialized) {
              _animationController.duration = _videoController.value.duration;
              _videoController.play();
              _animationController.forward(); //????????????????????????????????
            }
          });

        break;
    }

    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}
