import 'package:flutter/material.dart';
import 'colors.dart';
import 'menu.dart';
import 'text_field_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Профиль',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.black,
            ),
            onPressed: () {
              // TODO editing;
            },
          ),
          //SizedBox(width: 8.0),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            Card(
              color: Color(0xFFF4F4F4),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 160.0,
                    height: 160.0,
                    padding: EdgeInsets.fromLTRB(22.0, 6.0, 6.0, 6.0),
                    child: Image.asset('assets/default_avatar.png'),
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    children: <Widget>[
                      Text(
                        'Имя Фамилия',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 2.0),
                      Text(
                        'example@email.com',
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: cMain,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 4.0),
                            child: Text(
                              'Дата рождения:',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Text(
                            '01.01.1971',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                              color: cMain,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: <Widget>[
                          Icon(Icons.check_circle_outline),
                          SizedBox(width: 6.0),
                          Text(
                            'Наставник',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              color: cMain,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            CustomTextField(
              readOnly: true,
              enabled: false,
              icon: Icons.format_list_numbered,
              labelText: 'ID участника РБД',
            ),
            SizedBox(height: 40.0),
            CustomTextField(
              readOnly: true,
              enabled: false,
              icon: Icons.people_outline,
              labelText: 'Вид деятельности',
            ),
            SizedBox(height: 12.0),
            CustomTextField(
              readOnly: true,
              enabled: false,
              icon: Icons.phone,
              labelText: '+7 (123) 456 78 90',
            ),
            SizedBox(height: 40.0),
            Card(
              color: Color(0xFFF4F4F4),
              child: Padding(
                padding: EdgeInsets.all(6.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('О себе'),
                    SizedBox(height: 80.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: MenuDrawer(),
    );
  }
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(),
    );
  }
}
