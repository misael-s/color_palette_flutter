import 'package:flutter/material.dart';

import 'helpers/palette/color_palette.dart';
import 'helpers/palette/palette.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ColorPalette.instance,
      builder: (_, value) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(title: 'App Palette'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Palette.tertiary,
        title: Text(widget.title),
      ),
      body: Container(
        color: Palette.background,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Theme Mode:",
                style: Theme.of(context).textTheme.headline6,
              ),
              Wrap(
                children: [
                  Container(
                    width: mq.width * .33,
                    height: mq.height * .25,
                    color: Palette.primary,
                  ),
                  Container(
                    width: mq.width * .33,
                    height: mq.height * .25,
                    color: Palette.secondary,
                  ),
                  Container(
                    width: mq.width * .33,
                    height: mq.height * .25,
                    color: Palette.tertiary,
                  ),
                ],
              ),
              Text(
                ColorPalette.isDarkTheme ? "Dark" : "Light",
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Palette.tertiary,
        onPressed: () {
          ColorPalette.instance.changeTheme();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.change_circle),
      ),
    );
  }
}
