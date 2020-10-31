import 'package:flutter/material.dart';
import 'login.dart';
import 'profile.dart';
import 'news.dart';
import 'activities.dart';

class MenuSeparator extends StatelessWidget {
  @override Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.symmetric(horizontal: BorderSide()),
      ),
    );
  }
}

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              automaticallyImplyLeading: false,
              centerTitle: true,
              flexibleSpace: InkWell(
                child: Column(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 31.0 / 11.0,
                      child: Image.asset('assets/default_avatar.png'),
                    ),
                    SizedBox(height: 14.0),
                    Text(
                      'Имя Фамилия',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileApp()),
                  );
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginApp()),
                    );
                  },
                ),
              ],
            ),
          ),
          MenuSeparator(),
          ListTile(
            title: Center(
              child: Text(
                'Новости',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewsApp()),
              );
            },
          ),
          MenuSeparator(),
          ListTile(
            title: Center(
              child: Text(
                'Возможности',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            onTap: () {
              // TODO
              Navigator.pop(context);
            },
          ),
          MenuSeparator(),
          ListTile(
            title: Center(
              child: Text(
                'Профориентация',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            onTap: () {
              // TODO
              Navigator.pop(context);
            },
          ),
          MenuSeparator(),
          ListTile(
            title: Center(
              child: Text(
                'Мероприятия',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            onTap: () {
              Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ActivitiesApp()),
                );
            },
          ),
          MenuSeparator(),
          ListTile(
            title: Center(
              child: Text(
                'Мессенджер',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            onTap: () {
              // TODO
              Navigator.pop(context);
            },
          ),
          MenuSeparator(),
        ],
      ),
    );
  }
}
