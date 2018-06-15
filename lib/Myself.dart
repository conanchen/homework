import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:homework/pages/chat_screen.dart';

const Color _kFlutterBlue = const Color(0xFF003D75);
const double _kDemoItemHeight = 64.0;
const Duration _kFrontLayerSwitchDuration = const Duration(milliseconds: 300);

final List<GalleryDemo> kAllGalleryDemos = _buildGalleryDemos();

class Myself extends StatefulWidget {

  @override
  _MyselfState createState() => new _MyselfState();

}

class _MyselfState extends State<Myself> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: _buildRoutes(),

      home: ListView.builder(
        itemCount: kAllGalleryDemos.length,
        itemBuilder: (context, i) =>
        new Column(
          children: <Widget>[
            new Divider(
              height: 10.0,
            ),
            _DemoItem(demo: kAllGalleryDemos[i]),
          ],
        ),
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
