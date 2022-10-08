
import 'package:base_structure/providers_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:overlay_support/overlay_support.dart';

import 'app.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(RestartWidget(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return multiProvider();
  }
}

Widget multiProvider(){
  return OverlaySupport.global(
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>  authProvider),

      ],
      child: app(),
    ),
  );
}

class RestartWidget extends StatefulWidget {
  RestartWidget({this.child});

  final Widget? child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child ?? Container(),
    );
  }
}
