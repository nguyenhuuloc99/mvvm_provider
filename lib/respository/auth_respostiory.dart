import 'package:mvvm_provider/data/network/base_api_service.dart';
import 'package:mvvm_provider/data/network/network_api_service.dart';

class AuthRepository {
  BaseApiService baseApiService = NetWorkApiService();

  Future<dynamic> login(dynamic data) async {
    String url = "";
    dynamic response = baseApiService.getPostApiResponse(url, data);
  }
}
