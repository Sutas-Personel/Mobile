import 'package:SutasPersonel/core/init/navigation/navigation_service.dart';
import 'package:SutasPersonel/models/news_model.dart';
import 'package:SutasPersonel/services/interfaces/INewsService.dart';
import 'package:SutasPersonel/services/news_services.dart';
import 'package:flutter/material.dart';

import 'cardDetail.dart';

abstract class CardDetailViewModel extends State<CardDetail>
    with BaseViewModel {
  INewsService newsService;
  NewsModel newsGet;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsService = NewsService.instance;
    searchNewsGet("5f70985d11aa3d7f2eec657e");
  }
// final Map arguments = ModalRoute.of(context).settings.arguments as Map;
   
  Future<void> searchNewsGet(String newsId) async {
    newsGet = await newsService.getNewsSearch(newsId);
  }
}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
