import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';
import 'package:phyzzicare/routes/login_page_route.dart';

import '../../main.dart';
import '../../utils/theme_color.dart';
import '../animations/custom_fade_transition.dart';

class SettingsWindowRoute extends StatefulWidget {
  const SettingsWindowRoute({super.key});

  @override
  State createState() => _SettingsWindowRouteState();
}

class _SettingsWindowRouteState extends State<SettingsWindowRoute> {
  String _selected = "Light";
  late List<MyThemeColor> themeColors;
  RoundedRectangleBorder listTileRoundness = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(5),
  );

  @override
  void initState() {
    themeColors = MyApp.of(context)!.themeColors;
    for (var item in themeColors) {
      if (item.color == MyApp.of(context)?.seedColor) item.isSelected = true;
    }
    if (MyApp.of(context)?.appThemeMode == ThemeMode.light) {
      _selected = "Light";
    } else if (MyApp.of(context)?.appThemeMode == ThemeMode.dark) {
      _selected = "Dark";
    } else if (MyApp.of(context)?.appThemeMode == ThemeMode.system) {
      _selected = "System";
    }
    super.initState();
  }

  bool isAppBarExpanded = false;

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      centerTitle: true,
      title: const Text("PhyzziCare"),
      actions: [
        IconButton(
          onPressed: () {
            setState(() {
              isAppBarExpanded = !isAppBarExpanded;
            });
          },
          icon: Icon(
            (isAppBarExpanded)
                ? Icons.keyboard_arrow_up_rounded
                : Icons.keyboard_arrow_down_rounded,
          ),
        ),
      ],
    );
    return Scaffold(
      appBar: (isAppBarExpanded)
          ? PreferredSize(
              preferredSize: const Size.fromHeight(300),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: (Theme.of(context).brightness == Brightness.light)
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.background,
                      child: Column(
                        children: [
                          SizedBox(height: MediaQuery.of(context).padding.top),
                          const Expanded(
                            child: Center(
                              child: Text(
                                "Our motive is to maximize stroke recovery.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  appBar,
                ],
              ),
            )
          : appBar,
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: Image.asset(
                              Assets.assetsGhandi,
                              fit: BoxFit.fill,
                              height: 100,
                              width: 150,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mahatma Ghandi",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text("Patient"),
                              ],
                            ),
                            const SizedBox(height: 10),
                            OutlinedButton(
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.edit_note_rounded),
                                  SizedBox(width: 5),
                                  Text("Edit Profile"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: listTileRoundness,
                      onTap: () {},
                      title: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Language"),
                          Row(
                            children: [
                              Text(
                                "English",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Icon(Icons.navigate_next)
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: listTileRoundness,
                      onTap: () {},
                      title: const Text("Notifications"),
                    ),
                    const SizedBox(height: 10),
                    ExpansionTile(
                      shape: listTileRoundness,
                      title: const Text("Themes"),
                      children: [
                        ListTile(
                          title: const Text(
                            "Light",
                          ),
                          trailing: Radio<String>(
                            value: "Light",
                            groupValue: _selected,
                            onChanged: (value) {
                              setState(() {
                                _selected = value!;
                              });
                              MyApp.of(context)
                                  ?.changeThemeMode(ThemeMode.light);
                            },
                          ),
                        ),
                        ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          title: const Text(
                            "Dark",
                          ),
                          trailing: Radio<String>(
                            value: "Dark",
                            groupValue: _selected,
                            onChanged: (value) {
                              setState(() {
                                _selected = value!;
                              });
                              MyApp.of(context)
                                  ?.changeThemeMode(ThemeMode.dark);
                            },
                          ),
                        ),
                        ListTile(
                          titleAlignment: ListTileTitleAlignment.center,
                          title: const Text(
                            "System",
                          ),
                          trailing: Radio<String>(
                            value: "System",
                            groupValue: _selected,
                            onChanged: (value) {
                              setState(() {
                                _selected = value!;
                              });
                              MyApp.of(context)
                                  ?.changeThemeMode(ThemeMode.system);
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: themeColors
                              .map<Widget>(
                                (colorItem) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      MyApp.of(context)?.changeAppColorTheme(
                                          colorItem.color);
                                      for (var element in themeColors) {
                                        element.isSelected = false;
                                      }
                                      colorItem.isSelected = true;
                                    });
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: colorItem.color,
                                      border: Border.all(
                                        color: (Theme.of(context).brightness ==
                                                Brightness.dark)
                                            ? Colors.white
                                            : Colors.black,
                                        width: (colorItem.isSelected) ? 3 : 0,
                                      ),
                                    ),
                                    child: (colorItem.isSelected)
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Icon(Icons.done_rounded),
                                          )
                                        : const Center(),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      shape: listTileRoundness,
                      onTap: () {},
                      title: const Text("About us"),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
          Hero(
            tag: "signup",
            child: ListTile(
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  CustomFadeTransition(
                    page: const LoginPageRoute(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
