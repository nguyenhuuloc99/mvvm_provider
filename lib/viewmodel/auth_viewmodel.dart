import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_provider/respository/auth_respostiory.dart';
import 'package:mvvm_provider/utils/utils.dart';

class AuthViewModel extends ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data) async {
    _myRepo.login(data).then((value) => {Utils.showToast("Login Success")},
        onError: (error, stackTrace) {});
    notifyListeners();
  }
}
