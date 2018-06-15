import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:homework/pages/chat_screen.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

const Color _kFlutterBlue = const Color(0xFF003D75);
const double _kDemoItemHeight = 64.0;
const Duration _kFrontLayerSwitchDuration = const Duration(milliseconds: 300);

final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();

class Myself extends StatefulWidget {
  @override
  _MyselfState createState() => new _MyselfState();
}

class _MyselfState extends State<Myself> {
  final double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: _buildRoutes(),

      home: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: Icon(Icons.favorite),
            expandedHeight: _appBarHeight,
            pinned: _appBarBehavior == AppBarBehavior.pinned,
            floating: _appBarBehavior == AppBarBehavior.floating ||
                _appBarBehavior == AppBarBehavior.snapping,
            snap: _appBarBehavior == AppBarBehavior.snapping,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                '我的',
                style: const TextStyle(color: Colors.red),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    'images/TyrionLannister.jpeg',
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Divider(
                      height: 10.0,
                    ),
                    ListTile(
                      leading: Icon(Icons.contacts, size: 36.0),
                      title: Text(
                        "爱探险的朵拉",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      subtitle: Text("微信号：23489729384720"),
                      trailing: Icon(
                        Icons.ac_unit,
                        size: 96.0,
                      ),
                      onTap: () => showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              Text("Show qrcode please")),
                    ),
                  ],
                );
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Divider(
                      height: 10.0,
                    ),
                    _DemoItem(demo: kAllGalleryDemos[index]),
                  ],
                );
              },
              childCount: kAllGalleryDemos.length,
            ),
          ),
        ],
      ),
    );
  }

  Map<String, WidgetBuilder> _buildRoutes() {
    // For a different example of how to set up an application routing table
    // using named routes, consider the example in the Navigator class documentation:
    // https://docs.flutter.io/flutter/widgets/Navigator-class.html
    return new Map<String, WidgetBuilder>.fromIterable(
      kAllGalleryDemos,
      key: (dynamic demo) => '${demo.routeName}',
      value: (dynamic demo) => demo.buildRoute,
    );
  }
}

List<GalleryDemo> _buildGalleryDemos() {
  final List<GalleryDemo> galleryDemos = <GalleryDemo>[
    new GalleryDemo(
      title: 'Sliders',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Switches',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Animated images',
      subtitle: 'GIF and WebP animations',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Video',
      subtitle: 'Video playback',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Sliders',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Switches',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Animated images',
      subtitle: 'GIF and WebP animations',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Video',
      subtitle: 'Video playback',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Sliders',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Switches',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Animated images',
      subtitle: 'GIF and WebP animations',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Video',
      subtitle: 'Video playback',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Sliders',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Switches',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Animated images',
      subtitle: 'GIF and WebP animations',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
    new GalleryDemo(
      title: 'Video',
      subtitle: 'Video playback',
      icon: Icon(Icons.video_call),
      routeName: ChatScreen.routeName,
      buildRoute: (BuildContext context) => const ChatScreen(),
    ),
  ];

  // Keep Pesto around for its regression test value. It is not included
  // in (release builds) the performance tests.
  assert(() {
    galleryDemos.insert(
      0,
      new GalleryDemo(
        title: 'Pesto',
        subtitle: 'Simple recipe browser',
        icon: Icon(Icons.video_call),
        routeName: ChatScreen.routeName,
        buildRoute: (BuildContext context) => const ChatScreen(),
      ),
    );
    return true;
  }());

  return galleryDemos;
}

class GalleryDemo {
  const GalleryDemo({
    @required this.title,
    @required this.icon,
    this.subtitle,
    @required this.routeName,
    @required this.buildRoute,
  })  : assert(title != null),
        assert(routeName != null),
        assert(buildRoute != null);

  final String title;
  final Icon icon;
  final String subtitle;
  final String routeName;
  final WidgetBuilder buildRoute;

  @override
  String toString() {
    return '$runtimeType($title $routeName)';
  }
}

class _DemoItem extends StatelessWidget {
  const _DemoItem({Key key, this.demo}) : super(key: key);

  final GalleryDemo demo;

  void _launchDemo(BuildContext context) {
    if (demo.routeName != null) {
      Timeline.instantSync('Start Transition', arguments: <String, String>{
        'from': '/',
        'to': demo.routeName,
      });
      Navigator.pushNamed(context, demo.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final double textScaleFactor = MediaQuery.textScaleFactorOf(context);

    final List<Widget> titleChildren = <Widget>[
      new Text(
        demo.title,
        style: theme.textTheme.subhead.copyWith(
          color: isDark ? Colors.white : const Color(0xFF202124),
        ),
      ),
    ];
    if (demo.subtitle != null) {
      titleChildren.add(
        new Text(
          demo.subtitle,
          style: theme.textTheme.body1
              .copyWith(color: isDark ? Colors.white : const Color(0xFF60646B)),
        ),
      );
    }

    return new RawMaterialButton(
      padding: EdgeInsets.zero,
      splashColor: theme.primaryColor.withOpacity(0.12),
      highlightColor: Colors.transparent,
      onPressed: () {
        _launchDemo(context);
      },
      child: new Container(
        constraints:
            new BoxConstraints(minHeight: _kDemoItemHeight * textScaleFactor),
        child: new Row(
          children: <Widget>[
            new Container(
              width: 56.0,
              height: 56.0,
              alignment: Alignment.center,
              child: demo.icon,
            ),
            new Expanded(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: titleChildren,
              ),
            ),
            const SizedBox(width: 44.0),
          ],
        ),
      ),
    );
  }
}
