import 'package:flutter/material.dart';
import 'package:homework/pages/Contacts.dart';
import 'package:homework/pages/Discovery.dart';
import 'package:homework/pages/Works.dart';
import 'package:homework/pages/Messages.dart';
import 'package:homework/Myself.dart';
import 'package:homework/pages/chat_screen.dart';

void main() => runApp(new HomeworkApp());

class HomeworkApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Homework App',

      theme: new ThemeData(
        primaryColor: new Color(0xff075E54),                       //new
        accentColor: new Color(0xff25D366),                        //new
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        platform: Theme.of(context).platform,
      ),
      home: new MyHomePage(title: 'Home Page'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController;
  int page = 2;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.grey,
      body: new PageView(
        children: [
//          new Messages(),
          new ChatScreen(),
          new Works(),
          new Discovery(),
          new Contacts(),
          new Myself()
        ],
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
              icon: new Icon(Icons.message),
              title: new Text("消息"),
              backgroundColor: Colors.grey),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.work),
              title: new Text("工作"),
              backgroundColor: Colors.grey),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.shopping_cart),
              title: new Text("发现"),
              backgroundColor: Colors.grey),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.contacts), title: new Text("通讯录")),
          new BottomNavigationBarItem(
              icon: new Icon(Icons.person), title: new Text("我的")),
        ],
        onTap: onTap,
        currentIndex: page,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = new PageController(initialPage: this.page);
  }

  void onTap(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this.page = page;
    });
  }
}
