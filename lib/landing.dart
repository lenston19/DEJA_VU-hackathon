import 'package:flutter/cupertino.dart';
import 'package:talant/login.dart';
import 'package:talant/news.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = false;

    return isLoggedIn ? NewsApp() : LoginPage();
  }
}
