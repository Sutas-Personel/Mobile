import 'package:SutasPersonel/core/base/base_model.dart';
import 'package:SutasPersonel/core/constants/http_request_enum.dart';
import 'package:SutasPersonel/core/init/network/IResponse_model.dart';
import 'package:flutter/material.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      Map<String, dynamic> queryParameters,
      void Function(int, int) onReceiveProgress});
}
