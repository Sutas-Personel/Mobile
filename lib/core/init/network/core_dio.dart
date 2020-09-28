import 'dart:io';
import 'package:SutasPersonel/core/base/base_error.dart';
import 'package:SutasPersonel/core/base/base_model.dart';
import 'package:SutasPersonel/core/extension/network_extention.dart';
import 'package:SutasPersonel/core/constants/http_request_enum.dart';
import 'package:SutasPersonel/core/init/network/ICoreDio.dart';
import 'package:SutasPersonel/core/init/network/IResponse_model.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
part "./network_core/network_core.dart";

class CoreDio with DioMixin implements Dio, ICoreDio {
  final BaseOptions options;

  CoreDio(this.options) {
    this.options = options;
    this.interceptors.add(InterceptorsWrapper());
    this.httpClientAdapter = DefaultHttpClientAdapter();
  }

  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      Map<String, dynamic> queryParameters,
      void Function(int, int) onReceiveProgress}) async {
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R>(parseModel, _responseParser);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError("message"));
    }
  }
}
