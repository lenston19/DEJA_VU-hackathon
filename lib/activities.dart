import 'package:flutter/material.dart';
import 'colors.dart';
import 'menu.dart';

class ActivitiesPage extends StatefulWidget {
  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  List<Card> _buildListCards(int count) {
    List<Card> cards = List.generate(
      count,
      (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 4.0),
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset('assets/activities_example.jpg'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 2.0, 18.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Школьный этап всероссийской олимпиады стартует 1 ноября',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 6.0),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.tag,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 2.0),
                      Text(
                        'Всероссийская олимпиада школьников',
                        style: TextStyle(color: cTextGrey),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Container(
                    child: Text(
                      '18 октября 2020',
                      style: TextStyle(color: cTextGrey),
                    ),
                    alignment: Alignment.centerRight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Мероприятия',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        leading: Builder (
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
        actions: <Widget>[SizedBox(width: 54.0)],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: _buildListCards(3),
        ),
      ),
      drawer: MenuDrawer(),
    );
  }
}

class ActivitiesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activities',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ActivitiesPage(),
    );
  }
}
