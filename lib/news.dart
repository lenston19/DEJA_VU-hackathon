import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'colors.dart';
import 'menu.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
              child: Image.asset('assets/news_example.jpg'),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(18.0, 2.0, 18.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Стартовал всероссийский этап Всероссийских спортивных состязаний',
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
                        'Талантливые дети',
                        style: TextStyle(color: cTextGrey),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.0),
                  Container(
                    child: Text(
                      '13 октября 2020',
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
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
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
        bottom: TabBar(
          indicatorColor: Colors.white,
          isScrollable: true,
          tabs: <Widget>[
            Tab(
              child: Text(
                'Новости',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Tab(
              child: Text(
                'Для вас',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: _buildListCards(3),
            ),
          ),
          SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: _buildListCards(1),
            ),
          ),
        ],
      ),
      drawer: MenuDrawer(),
    );
  }
}

class NewsApp extends StatelessWidget {
  final User user;

  const NewsApp({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 2,
        child: NewsPage(),
      ),
    );
  }
}
