import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'colors.dart';
import 'text_field_widget.dart';

final _nicknameController = TextEditingController();
final _usernameController = TextEditingController();
final _password1Controller = TextEditingController();
final _password2Controller = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final _displayName = TextEditingController();
final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginApp()),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Регистрация',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Заполните все поля, чтобы создать аккаунт',
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
                controller: _nicknameController,
                icon: Icons.people_outline,
                labelText: 'Имя Фамилия:',
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                controller: _usernameController,
                icon: Icons.email_outlined,
                labelText: 'E-mail:',
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                controller: _password1Controller,
                icon: Icons.lock_outlined,
                labelText: 'Пароль:',
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              CustomTextField(
                controller: _password2Controller,
                icon: Icons.lock_outlined,
                labelText: 'Подтвердите пароль:',
                obscureText: true,
              ),
              SizedBox(height: 30.0),
              Center(
                child: MaterialButton(
                  child: Text(
                    'СОЗДАТЬ',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: cMain,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  minWidth: 180.0,
                  height: 50.0,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      if (_password1Controller.text ==
                          _password2Controller.text) {
                        _registerAccount();
                      }
                    }
                    // Navigator.pop(context);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => NewsApp()),
                    // );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Нажимая кнопку "Создать", вы соглашаетесь с',
                    style: TextStyle(
                      color: cTextGrey,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  InkWell(
                    child: Text(
                      'политикой обработки персональных данных',
                      style: TextStyle(
                        color: cMain,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      /*Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterApp()),
                      );*/
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 4.0),
                    child: Text(
                      'Уже есть аккаунт?',
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
                      'Войдите',
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
                        MaterialPageRoute(builder: (context) => LoginApp()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RegisterPage(),
    );
  }
}

void _registerAccount() async {
  final User user = (await _auth.createUserWithEmailAndPassword(
          email: _nicknameController.text, password: _password1Controller.text))
      .user;

  if (user != null) {
    if (!user.emailVerified) {
      await user.sendEmailVerification();
    }
    await user.updateProfile(displayName: _displayName.text);
    final user1 = _auth.currentUser;
    // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
    //   return NewsApp(
    //     user: user1,
    //   );
    // }));
  }
}
