import 'package:SutasPersonel/core/base/base_model.dart';
import 'package:flutter/material.dart';
import '../../../constants/http_enums.dart';
import 'IResponseModel.dart';

abstract class ICoreDio {
  Future<IResponseModel<R>> fetch<R, T extends IBaseModel>(String path,
      {@required HttpTypes type,
      @required T parseModel,
      dynamic data,
      Map<String, dynamic> queryParameters,
      void Function(int, int) onReceiveProgress});
}
