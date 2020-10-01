import 'package:SutasPersonel/core/init/navigation/navigation_service.dart';
import 'package:SutasPersonel/models/news_model.dart';
import 'package:SutasPersonel/services/interfaces/INewsService.dart';
import 'package:flutter/material.dart';
import '../../core/init/navigation/navigation_service.dart';

import 'cardDetail.dart';

abstract class CardDetailViewModel extends State<CardDetail>
    with BaseViewModel {
  INewsService newsService;
  NewsModel newsGet;
  String newsId;
}

abstract class BaseViewModel {
  NavigationService navigation = NavigationService.instance;
}
