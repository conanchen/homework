import 'package:flutter/material.dart';
import '../models/contacts_model.dart';

class Contacts extends StatefulWidget {
  @override
  ContactsState createState() {
    return  ContactsState();
  }
}

enum AppBarBehavior { normal, pinned, floating, snapping }

class ContactsState extends State<Contacts> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
       GlobalKey<ScaffoldState>();
  final double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        key: _scaffoldKey,
        body: CustomScrollView(
          slivers: <Widget>[
             SliverAppBar(

              leading: Icon(Icons.favorite),
              expandedHeight: _appBarHeight,
              pinned: _appBarBehavior == AppBarBehavior.pinned,
              floating: _appBarBehavior == AppBarBehavior.floating ||
                  _appBarBehavior == AppBarBehavior.snapping,
              snap: _appBarBehavior == AppBarBehavior.snapping,
              actions: <Widget>[
                 IconButton(
                  icon: const Icon(Icons.create),
                  tooltip: 'Edit',
                  onPressed: () {
                    _scaffoldKey.currentState.showSnackBar(const SnackBar(
                        content: const Text(
                            "Editing isn't supported in this screen.")));
                  },
                ),
                 PopupMenuButton<AppBarBehavior>(
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
              flexibleSpace:  FlexibleSpaceBar(

                title: const Text('通讯录',style:const TextStyle(color: Colors.red),),
                background:  Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                     Image.asset(
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
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 2.0,
                crossAxisSpacing: 2.0,
                childAspectRatio: 1.0,
              ),
              delegate:  SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return  Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 8 + 1)],
                    child:  Text(dummyContactIndexData[index].shortcut),
                  );
                },
                childCount: dummyContactIndexData.length,
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return  Column(
                    children: <Widget>[
                       Divider(
                        height: 10.0,
                      ),
                      ContactListTile(dummyContactsData[index]),
                    ],
                  );
                },
                childCount: dummyContactsData.length,
              ),
            ),
          ],
        ),
    );
  }
}


class ContactListTile extends ListTile {
  ContactListTile(ChatModel contact)
      : super(
    leading:  CircleAvatar(
      backgroundColor: Colors.grey,
      backgroundImage:  NetworkImage(contact.avatarUrl),
    ),
    title:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
         Text(
          contact.name,
          style:  TextStyle(fontWeight: FontWeight.bold),
        ),
         Text(
          contact.time,
          style:  TextStyle(color: Colors.grey, fontSize: 14.0),
        ),
      ],
    ),
    subtitle:  Container(
      padding: const EdgeInsets.only(top: 5.0),
      child:  Text(
        contact.message,
        style:  TextStyle(color: Colors.grey, fontSize: 15.0),
      ),
    ),
  );
}
