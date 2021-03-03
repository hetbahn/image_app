import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  int totalPage = 4;

  void _onScroll() {}

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                backgroundColor: Colors.black,
              ),
            ],
          ),
          makepage(
            page: 1,
            image: 'assets/images/image1.jpg',
            title: '백예빈',
            description: 'DIA',
          ),
          makepage(
            page: 2,
            image: 'assets/images/image2.jpg',
            title: '최유주',
            description: 'CherryBullet',
          ),
          makepage(
            page: 3,
            image: 'assets/images/image3.jpg',
            title: '왕이런',
            description: 'Everglow',
          ),
          makepage(
            page: 4,
            image: 'assets/images/image4.jpg',
            title: '예슈화',
            description: '(G)I-DLE',
          ),
        ],
      ),
    );
  }
}

Widget makepage({image, title, description, page}) {
  return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
          Colors.black,
          Colors.black.withOpacity(.1),
        ])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        height: 1.2,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                        height: 1.9,
                        fontSize: 13),
                  ),
                ],
              ))
            ],
          ),
        ),
      ));
}
