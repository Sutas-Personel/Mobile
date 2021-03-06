import 'package:SutasPersonel/core/constants/colors.dart';
import 'package:SutasPersonel/models/story_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../core/extension/context_entension.dart';
import 'story_screen_view_model.dart';

class StoryScreenView extends StoryScreenViewModel
    with SingleTickerProviderStateMixin {
  int currentIndex;
  final List<StoryModel> stories;
  StoryScreenView({this.stories, this.currentIndex});
  PageController _pageController;
  AnimationController _animationController;
  VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    _animationController = AnimationController(vsync: this);
    final StoryModel firstStory = stories[currentIndex];
    _loadStory(story: firstStory, animateToPage: false);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // _animationController..stop()..reset();//????????????????????????????????
        _animationController.stop();
        _animationController.reset();
        setState(() {
          if (currentIndex + 1 < stories.length) {
            currentIndex += 1;
            _loadStory(story: stories[currentIndex]);
          } else {
            currentIndex = 0;
            _loadStory(story: stories[currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final StoryModel story = stories[currentIndex];

    return Scaffold(
      body: GestureDetector(
        onTapDown: (details) => _onTapDown(details, story),
        onTap: () => _onTap(story),
        child: Stack(
          children: [_pageViewBuilder(), _userAndTimeBar(story)],
        ),
      ),
    );
  }

  Widget _userAndTimeBar(StoryModel story) {
    return Positioned(
      top: 40.0,
      left: 10.0,
      right: 10.0,
      child: Column(
        children: [
          Row(
            children: stories
                .asMap()
                .map(
                  (key, value) => MapEntry(
                    key,
                    AnimatedBar(
                      animController: _animationController,
                      position: key,
                      currentIndex: currentIndex,
                    ),
                  ),
                )
                .values
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.5, vertical: 10),
            child: UserInfo(
              story: story,
            ),
          )
        ],
      ),
    );
  }

  PageView _pageViewBuilder() {
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageController,
      itemCount: stories.length,
      itemBuilder: (context, index) {
        final StoryModel story = stories[currentIndex];

        switch (story.media) {
          case MediaType.image:
            // print("resim");
            return CachedNetworkImage(
              imageUrl: story.url,
              fit: BoxFit.cover,
            );
          // break;
          case MediaType.video:
            // print("video");

            if (_videoController != null &&
                _videoController.value.initialized) {
              return FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                      width: _videoController.value.size.width,
                      height: _videoController.value.size.height,
                      child: VideoPlayer(_videoController)));
            }
          // break;
        }
        return const SizedBox.shrink(); //????????????????????????????????
      },
    );
  }

  void _onTap(StoryModel story) {
    if (story.media == MediaType.video) {
      if (_videoController.value.isPlaying) {
        // videoları dokunarak durdurma olmalı ????????
        _videoController.pause();
        _animationController.stop();
      } else {
        _videoController.play();
        _animationController.forward();
      }
    }
  }

  void _loadStory({StoryModel story, bool animateToPage = true}) {
    _animationController.stop();
    _animationController.reset();
    switch (story.media) {
      case MediaType.image:
        _animationController.duration =
            Duration(seconds: int.parse(story.duration));
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
        currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  _onTapDown(TapDownDetails details, StoryModel story) {
    final double screenWidth = context.width;
    final double dx = details.globalPosition
        .dx; // ekranındaki dokunmaların glabal konumunu alıyoruz.

    if (dx < screenWidth / 3) {
      //ekranın 3/1 oranın sol kısmın dokunmaları yakalıyor.

      setState(() {
        if (currentIndex - 1 >= 0) {
          currentIndex--;
          _loadStory(story: stories[currentIndex]);
        }
      });
    } else if (dx > 2 * screenWidth / 3) {
      //ekranın 3/1 oranın sağ kısmın dokunmaları yakalıyor.

      setState(() {
        if (currentIndex + 1 < stories.length) {
          currentIndex++;
          _loadStory(story: stories[currentIndex]);
        } else {
          currentIndex = 0;
          _loadStory(story: stories[currentIndex]);
        }
      });
    } else {
      if (story.media == MediaType.video) {
        if (_videoController.value.isPlaying) {
          // videoları dokunarak durdurma olmalı ????????
          _videoController.pause();
          _animationController.stop();
        } else {
          _videoController.play();
          _animationController.forward();
        }
      }
    }
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;

  const AnimatedBar({
    Key key,
    @required this.animController,
    @required this.position,
    @required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 1.5),
        child: Container(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.5),
                  child: Stack(
                    children: [
                      _buildContainer(
                          double.infinity,
                          position < currentIndex
                              ? AllColors.MAIN_GREEN
                              : AllColors.MAIN_GREEN.withOpacity(0.5)),
                      position == currentIndex
                          ? AnimatedBuilder(
                              animation: animController,
                              builder: (context, child) {
                                return _buildContainer(
                                    constraints.maxWidth * animController.value,
                                    AllColors.MAIN_GREEN);
                              })
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5,
      width: width,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: Colors.black12,
            width: 0.8,
          )),
    );
  }
}

class UserInfo extends StatelessWidget {
  String sutasLogo =
      "https://www.sutas.com.tr/uploads/setting/seo/6281b9c4a8e57cb110cdda5bdc06ffbc.png";
  final StoryModel story;

  UserInfo({Key key, this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.transparent,
          backgroundImage: CachedNetworkImageProvider(
            //????????????????????????????????
            story.media == "IMAGE" ? story.url : sutasLogo,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
            child: Text(
          story.user,
          style: context.textTheme.subtitle1.copyWith(
              color: AllColors.MAIN_GREEN,
              fontWeight: FontWeight.bold,
              fontSize: 16),
        )),
        IconButton(
          icon: const Icon(
            Icons.close,
            size: 30.0,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
