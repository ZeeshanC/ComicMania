import 'package:ComicMania/components/default_button.dart';
import 'package:ComicMania/constants.dart';
import 'package:ComicMania/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:provider/provider.dart';

class Themes extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        home: HomeScreen(),
      ),
    );
  }
}

class UserSettings extends StatelessWidget{
  static String routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Settings',
          textAlign: TextAlign.center,
          style:TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: new Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              DefaultButton(
                text: "Dark",
                press:() async{
                  return AdaptiveTheme(
                    light: ThemeData(
                      brightness: Brightness.light,
                      primarySwatch: Colors.red,
                      accentColor: Colors.amber,
                    ),
                    dark: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.red,
                      accentColor: Colors.amber,
                    ),
                    initial: AdaptiveThemeMode.light,
                    builder: (theme, darkTheme) => MaterialApp(
                      title: 'Adaptive Theme Demo',
                      theme: theme,
                      darkTheme: darkTheme,
                      home: UserSettings(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              DefaultButton(
                text: 'Dark',
                press:() async{
              AdaptiveTheme.of(context).setLight();
              },
              )

            ],

          ),
      ),
    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:adaptive_theme/adaptive_theme.dart';

class DarkTheme extends StatefulWidget {
  @override
  _DarkThemeState createState() => _DarkThemeState();
}

class _DarkThemeState extends State<DarkTheme> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTheme(
      duration: Duration(milliseconds: 200),
      data: Theme.of(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff3DA468),
          title: Text('Settings'),
        ),
        body: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                'Current Theme Mode',
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 0.8,
                ),
              ),
              Text(
                AdaptiveTheme.of(context).mode.name.toUpperCase(),
                style: TextStyle(
                  fontSize: 24,
                  height: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  AdaptiveTheme.of(context).toggleThemeMode();
                },
                child: Text('Toggle Theme Mode'),
              ),
              ElevatedButton(
                onPressed: () {
                  AdaptiveTheme.of(context).setDark();
                },
                child: Text('Set Dark'),
              ),
              ElevatedButton(
                onPressed: () {
                  AdaptiveTheme.of(context).setLight();
                },
                child: Text('set Light'),
              ),
              ElevatedButton(
                onPressed: () {
                  AdaptiveTheme.of(context).setSystem();
                },
                child: Text('Set System Default'),
              ),
              Spacer(flex: 8),
            ],
          ),
        ),
      ),
    );
  }
}