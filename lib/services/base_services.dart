import 'package:SutasPersonel/core/init/network/ICoreDio.dart';
import 'package:SutasPersonel/core/init/network/network_manager.dart';

abstract class BaseService {
  ICoreDio coreDio = NetworkManager.instance.coreDio;
}