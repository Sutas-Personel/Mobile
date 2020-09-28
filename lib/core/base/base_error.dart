import 'package:SutasPersonel/core/init/network/IResponse_model.dart';

class BaseError extends IErrorModel {
  final String message;

  BaseError(this.message);
}
