import 'package:get/get.dart';
import '../classes/user.dart';
import '../helpers/auth_helper.dart';

class UserController extends GetxController {
  final AuthenticationHelper _authenticationHelper = AuthenticationHelper();

  var user = MyUser().obs;

  void getUser() async {
    try {
      var _user = await _authenticationHelper.getUser();
      if (_user != null) {
        user.value = _user;
      }
    } catch (e) {
      print('getUser Error: $e');
    }
  }

  void updateUser(MyUser newUser) async {
    try {
      await _authenticationHelper.updateUser(newUser);
      user.value = newUser;
    } catch (e) {
      print('updateUser Error: $e');
    }
  }

  void changePassword(String newPassword) {
    try {
      _authenticationHelper.changePassword(newPassword);
    } catch (e) {
      print('changePassword Error: $e');
    }
  }

  void deleteUser() async {
    try {
      await _authenticationHelper.deleteUser();
      user.value = MyUser();
    } catch (e) {
      print('deleteUser Error: $e');
    }
  }

  void logOut() {
    try {
      _authenticationHelper.logOut();
      user.value = MyUser(); // Kullanıcıyı sıfırla
    } catch (e) {
      print('logOut Error: $e');
    }
  }
}