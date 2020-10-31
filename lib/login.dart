import 'package:flutter/material.dart';

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
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/main_logo.png'),
                SizedBox(height: 22.0),
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
                    color: Color(0xFF959595),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'E-mail',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
              ),
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
                  MaterialPageRoute(builder: (context) => LoginPage()),
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
                color: Color(0xFFDB2023),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
                minWidth: 180.0,
                height: 50.0,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
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
                      color: Color(0xFF959595),
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
                      color: Color(0xFFDB2023),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
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
