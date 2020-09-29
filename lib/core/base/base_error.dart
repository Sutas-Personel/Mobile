import '../init/network/model/IResponseModel.dart';

class BaseError extends IErrorModel {
  final String message;

  BaseError(this.message);
}
