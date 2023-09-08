import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phyzzicare/routes/home_page_route.dart';
import 'package:phyzzicare/utils/theme_color.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static const appName = "PhyzziCare";

  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();

  static MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MyAppState>();
}

class MyAppState extends State<MyApp> {
  var themeColors = [
    MyThemeColor(Colors.green, false),
    MyThemeColor(Colors.orange, false),
    MyThemeColor(Colors.pink, false),
    MyThemeColor(Colors.red, false),
    MyThemeColor(Colors.blue, false),
  ];
  Color _seedColor = Colors.green;
  ThemeMode _appThemeMode = ThemeMode.light;
  late String? appFontFamily = "Begonia";

  get appThemeMode => _appThemeMode;

  get seedColor => _seedColor;

  setSavedSeedColor() {
    setState(() {
      SharedPreferences.getInstance().then(
        (pref) {
          switch (pref.getString("themeColor")) {
            case "orange":
              _seedColor = Colors.orange;
              break;
            case "pink":
              _seedColor = Colors.pink;
              break;
            case "red":
              _seedColor = Colors.red;
              break;
            case "blue":
              _seedColor = Colors.blue;
              break;
            case "green":
            default:
              _seedColor = Colors.green;
              break;
          }
        },
      );
    });
  }

  setSavedThemeMode() {
    setState(() {
      SharedPreferences.getInstance().then(
        (pref) {
          int mode = pref.getInt("themeMode")!;
          if (mode < 0) {
            _appThemeMode = ThemeMode.dark;
          } else if (mode > 0) {
            _appThemeMode = ThemeMode.light;
          }
        },
      );
    });
  }

  changeThemeMode(newThemeMode) {
    setState(() {
      _appThemeMode = newThemeMode;
      int themeCode = 0;
      if (newThemeMode == ThemeMode.dark) {
        themeCode = -1;
      } else if (newThemeMode == ThemeMode.light) {
        themeCode = 1;
      }
      saveThemeMode(themeCode);
    });
  }

  changeAppColorTheme(Color newSeedColor) {
    setState(
      () {
        _seedColor = newSeedColor;
        String color = "green";
        if (newSeedColor == Colors.red) {
          color = "red";
        } else if (newSeedColor == Colors.orange) {
          color = "orange";
        } else if (newSeedColor == Colors.pink) {
          color = "pink";
        } else if (newSeedColor == Colors.red) {
          color = "red";
        } else if (newSeedColor == Colors.blue) {
          color = "blue";
        }
        saveSeedColor(color);
      },
    );
  }

  changeFontTheme(String? newAppFontTheme) {
    setState(() {
      appFontFamily = newAppFontTheme;
    });
  }

  @override
  void initState() {
    setSavedSeedColor();
    setSavedThemeMode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    setSavedSeedColor();
    setSavedThemeMode();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phyzzicare',
      theme: ThemeData(
        fontFamily: appFontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        fontFamily: appFontFamily,
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seedColor,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: _appThemeMode,
      home: const HomePageRoute(),
    );
  }

  Future saveSeedColor(String color) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString("themeColor", color);
  }

  Future saveThemeMode(int mode) async {
    var pref = await SharedPreferences.getInstance();
    pref.setInt("themeMode", mode);
  }
}
