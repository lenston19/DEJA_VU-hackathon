import 'package:flutter/material.dart';
import 'register.dart';
import 'news.dart';
import 'colors.dart';
import 'text_field_widget.dart';

final _usernameController = TextEditingController();
final _passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('assets/main_logo.png'),
                Text(
                  'Добрый день!',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 12.0),
                Text(
                  'Введите свою почту и пароль, чтобы войти',
                  style: TextStyle(
                    color: cTextGrey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.0),
            CustomTextField(
              controller: _usernameController,
              icon: Icons.email_outlined,
              labelText: 'E-mail:',
            ),
            SizedBox(height: 20.0),
            CustomTextField(
              controller: _passwordController,
              icon: Icons.lock_outline,
              labelText: 'Пароль:',
              obscureText: true,
            ),
            SizedBox(height: 8.0),
            InkWell(
              child: Text(
                'Забыли пароль?',
                style: TextStyle(
                  color: Color(0xFF959595),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.right,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
                );
              },
            ),
            SizedBox(height: 22.0),
            Center(
              child: MaterialButton(
                child: Text(
                  'ВОЙТИ',
                  style: TextStyle(color: Colors.white),
                ),
                color: cMain,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                ),
                minWidth: 180.0,
                height: 50.0,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewsApp()),
                  );
                },
              ),
            ),
            SizedBox(height: 26.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 4.0),
                  child: Text(
                    'Нет аккаунта?',
                    style: TextStyle(
                      color: cTextGrey,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                InkWell(
                  child: Text(
                    'Зарегистрируйтесь',
                    style: TextStyle(
                      color: cMain,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterApp()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
