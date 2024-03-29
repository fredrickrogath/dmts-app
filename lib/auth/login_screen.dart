import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../homepage.dart';


const users = {
  'shidende@gmail.com': 'shidende',
  'dmts@gmail.com': 'dmts',
};

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => const Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return 'Tupo kwenye matengenezo';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
        title: 'DMTS',
        logo: const AssetImage('assets/logo.png'),
        onLogin: _authUser,
        onSignup: _signupUser,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        },
        onRecoverPassword: _recoverPassword,
        theme: LoginTheme(
          primaryColor: const Color(0xFF004B23),
          accentColor: const Color(0xFF008000),
          errorColor: Colors.deepOrange,
          titleStyle: const TextStyle(
            color: Colors.white,
            // fontFamily: 'Quicksand',
            letterSpacing: 4,
          ),
        ));
  }
}
