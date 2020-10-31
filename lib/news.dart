import 'package:flutter/material.dart';
import 'colors.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPagePageState createState() => _NewsPagePageState();
}

class _NewsPagePageState extends State<NewsPage> {
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
                  Text(
                    '13 октября 2020',
                    style: TextStyle(color: cTextGrey),
                  ),
                ],
              ),
            )
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
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewsApp()),
            );
          },
        ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          isScrollable: true,
          tabs: <Widget>[
            Tab(text: 'Новости'),
            Tab(text: 'Для вас'),
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
      )
    );
  }
}

class NewsApp extends StatelessWidget {
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
