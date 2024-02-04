import 'package:app/features/authentication/helpers/auth_helper.dart';
import 'package:app/features/authentication/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllers/user_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  static const String routeName = '/login';

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return AuthenticationHelper()
          .signIn(email: data.name, password: data.password)
          .then((result) {
        if (result != null) {
          return result.toString();
        }
        return null;
      });
    });
  }

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return AuthenticationHelper().signUp(data).then((result) {
        if (result == null) {
          return null;
        } else {
          return result.toString();
        }
      });
    });
  }


  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return AuthenticationHelper().recoverPassword(email: name).then((result) {
        if (result == null) {
          return null;
        } else {
          return result.toString();
        }
      });
    });
  }

  Future<String?> _signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      onConfirmRecover: _signupConfirm,
      //onConfirmSignup: _signupConfirm,
      loginAfterSignUp: false,
      theme: LoginTheme(
        pageColorLight: Colors.green,
        inputTheme: const InputDecorationTheme(
          labelStyle: TextStyle(color: Color.fromRGBO(0, 128, 0, 1)),
          filled: true,
          fillColor: Color.fromRGBO(144, 238, 144, 1),
        ),
        textFieldStyle: const TextStyle(color: Color.fromRGBO(0, 128, 0, 1)),
        switchAuthTextColor: const Color.fromRGBO(34, 139, 34, 1),
        primaryColor: Colors.transparent,
        bodyStyle: const TextStyle(color: Color.fromRGBO(34, 139, 34, 1)),
        buttonTheme: const LoginButtonTheme(
          backgroundColor: Color.fromRGBO(144, 238, 144, 1),
        ),
        accentColor: Colors.green,
        buttonStyle: const TextStyle(color: Color.fromRGBO(0, 128, 0, 1)),
        cardTheme: const CardTheme(
          elevation: 0,
          color: Colors.white,
        ),
      ),
      additionalSignupFields: const [
        UserFormField(keyName: "userName", displayName: "Kullanıcı Adı"),
        UserFormField(keyName: "name", displayName: "İsim"),
      ],
      onLogin: _loginUser,
      onSignup: _signupUser,
      loginProviders: [
        LoginProvider(
          //button: Buttons.anonymous,
          icon: Icons.person,
          label: "Misafir",
          callback: () async {
            AuthenticationHelper().signInAnonymous().then((value) =>
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(),)));
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
            AuthenticationHelper().signInWithGoogle().then((value) =>
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                    settings: RouteSettings(arguments: value))));
          },
        ),
      ],
      onRecoverPassword: _recoverPassword,
      messages: LoginMessages(
        additionalSignUpFormDescription:
            "Kaydı tamamlamak için formu doldurunuz.",
        additionalSignUpSubmitButton: "Gönder",
        providersTitleFirst: 'Veya bununla devam et',
        userHint: 'E-Mail',
        passwordHint: 'Şifre',
        confirmPasswordHint: 'Şifre Tekrar',
        loginButton: 'Giriş',
        signupButton: 'Kayıt Ol',
        forgotPasswordButton: 'Şifremi Unuttum',
        recoverPasswordButton: 'Sıfırla',
        goBackButton: 'Geri',
        recoverPasswordIntro: 'Şifreni Sıfırla',
        confirmPasswordError: 'Şifreler eşleşmedi.',
        recoverPasswordDescription:
            'E-Mail adresinize şifre sıfırlama bağlantısı gönderilecek.',
        recoverPasswordSuccess: 'Sıfırlama bağlantısı gönderildi.',
      ),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreen(),));
      },
      userValidator: (value) {
        if (!value!.contains('@') ) {
          return "Email '@' içermeli!";
        }
        return null;
      },
      passwordValidator: (value) {
        if (value == null || value.isEmpty) {
          return 'Şifre boş olamaz';
        } else if (value.length < 6) {
          return 'Şifre en az 6 karakter içermelidir';
        } else if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
          return 'Şifre en az bir harf içermelidir';
        } else if (!RegExp(r'[0-9]').hasMatch(value)) {
          return 'Şifre en az bir rakam içermelidir';
        }
        return null;
      },
    );
  }
}
