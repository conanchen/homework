import 'package:flutter/material.dart';
import '../models/contacts_model.dart';

class Contacts extends StatefulWidget {
  @override
  ContactsState createState() {
    return new ContactsState();
  }
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class ContactsState extends State<Contacts> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      new GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.normal;

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: new ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        platform: Theme.of(context).platform,
      ),
      child: new Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              leading: Icon(Icons.favorite),
              expandedHeight: _appBarHeight,
              pinned: _appBarBehavior == AppBarBehavior.pinned,
              floating: _appBarBehavior == AppBarBehavior.floating ||
                  _appBarBehavior == AppBarBehavior.snapping,
              snap: _appBarBehavior == AppBarBehavior.snapping,
              actions: <Widget>[
                new IconButton(
                  icon: const Icon(Icons.create),
                  tooltip: 'Edit',
                  onPressed: () {
                    _scaffoldKey.currentState.showSnackBar(const SnackBar(
                        content: const Text(
                            "Editing isn't supported in this screen.")));
                  },
                ),
                new PopupMenuButton<AppBarBehavior>(
                  onSelected: (AppBarBehavior value) {
                    setState(() {
                      _appBarBehavior = value;
                    });
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuItem<AppBarBehavior>>[
                        const PopupMenuItem<AppBarBehavior>(
                            value: AppBarBehavior.normal,
                            child: const Text('App bar scrolls away')),
                        const PopupMenuItem<AppBarBehavior>(
                            value: AppBarBehavior.pinned,
                            child: const Text('App bar stays put')),
                        const PopupMenuItem<AppBarBehavior>(
                            value: AppBarBehavior.floating,
                            child: const Text('App bar floats')),
                        const PopupMenuItem<AppBarBehavior>(
                            value: AppBarBehavior.snapping,
                            child: const Text('App bar snaps')),
                      ],
                ),
              ],
              flexibleSpace: new FlexibleSpaceBar(
                title: const Text('Ali Connors'),
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    new Image.asset(
                      'images/chuqiao.jpg',
                      fit: BoxFit.cover,
                      height: _appBarHeight,
                    ),
                    // This gradient ensures that the toolbar icons are distinct
                    // against the background image.
                    const DecoratedBox(
                      decoration: const BoxDecoration(
                        gradient: const LinearGradient(
                          begin: const Alignment(0.0, -1.0),
                          end: const Alignment(0.0, -0.4),
                          colors: const <Color>[
                            const Color(0x60000000),
                            const Color(0x00000000)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 3.0,
                childAspectRatio: 1.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 8 + 1)],
                    child: new Text(dummyContactIndexData[index].shortcut),
                  );
                },
                childCount: dummyContactIndexData.length,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return new Column(
                    children: <Widget>[
                      new Divider(
                        height: 10.0,
                      ),
                      new ListTile(
                        leading: new CircleAvatar(
                          foregroundColor: Theme.of(context).primaryColor,
                          backgroundColor: Colors.grey,
                          backgroundImage: new NetworkImage(
                              dummyContactsData[index].avatarUrl),
                        ),
                        title: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Text(
                              dummyContactsData[index].name,
                              style: new TextStyle(fontWeight: FontWeight.bold),
                            ),
                            new Text(
                              dummyContactsData[index].time,
                              style: new TextStyle(
                                  color: Colors.white, fontSize: 14.0),
                            ),
                          ],
                        ),
                        subtitle: new Container(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: new Text(
                            dummyContactsData[index].message,
                            style: new TextStyle(
                                color: Colors.white, fontSize: 15.0),
                          ),
                        ),
                      ),
                    ],
                  );
                },
                childCount: dummyContactsData.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
