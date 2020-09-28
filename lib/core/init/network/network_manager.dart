import 'dart:io';

import 'package:SutasPersonel/core/base/base_error.dart';
import 'package:SutasPersonel/core/base/base_model.dart';
import 'package:SutasPersonel/core/init/network/ICoreDio.dart';
import 'package:SutasPersonel/core/init/network/core_dio.dart';
import 'package:dio/dio.dart';

class NetworkManager {
  static NetworkManager _instance;
  static NetworkManager get instance {
    if (_instance == null) _instance = NetworkManager._init();
    return _instance;
  }

  ICoreDio coreDio;
  NetworkManager._init() {
    final baseOptions = BaseOptions(
      baseUrl: "https://sutaspersonel.herokuapp.com/",
    );
    coreDio = CoreDio(
      baseOptions,
    );
  }
}
