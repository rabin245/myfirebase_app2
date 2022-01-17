import 'package:flutter/material.dart';
import 'package:myfirebase_app2/signup_widget.dart';

import 'login_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginWidget(onClickedSignUp: toggle);
    } else {
      return SignUpWidget(onClickedSignIn: toggle);
    }
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
