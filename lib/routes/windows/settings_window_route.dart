import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';

import '../../main.dart';
import '../../transitions/custom_fade_transition.dart';
import '../../utils/theme_color.dart';
import '../sign_up_page_route.dart';

class SettingsWindowRoute extends StatefulWidget {
  const SettingsWindowRoute({super.key});

  @override
  State<StatefulWidget> createState() => _SettingsWindowRouteState();
}

class _SettingsWindowRouteState extends State<SettingsWindowRoute> {
  late String _selected = "Light";
  late List<MyThemeColor> themeColors;
  RoundedRectangleBorder listTileRoundness = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
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
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      Assets.assetsGhandi,
                      fit: BoxFit.fill,
                      height: 100,
                      width: 150,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
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
                  Row(
                    children: [
                      Icon(Icons.language_rounded),
                      SizedBox(width: 10),
                      Text("Language"),
                    ],
                  ),
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
              title: const Row(
                children: [
                  Icon(Icons.handshake_rounded),
                  SizedBox(width: 10),
                  Text("Pro Membership"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              shape: listTileRoundness,
              onTap: () {},
              title: const Row(
                children: [
                  Icon(Icons.support),
                  SizedBox(width: 10),
                  Text("Customer Support"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              shape: listTileRoundness,
              onTap: () {},
              title: const Row(
                children: [
                  Icon(Icons.notifications_rounded),
                  SizedBox(width: 10),
                  Text("Notifications"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ExpansionTile(
              shape: listTileRoundness,
              title: const Row(
                children: [
                  Icon(Icons.color_lens_outlined),
                  SizedBox(width: 10),
                  Text("Themes"),
                ],
              ),
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(
                      width: 4,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("Theme"),
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
                                (themeColorItem) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      MyApp.of(context)?.changeAppColorTheme(
                                          themeColorItem.color);
                                      for (var element in themeColors) {
                                        element.isSelected = false;
                                      }
                                      themeColorItem.isSelected = true;
                                    });
                                  },
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: themeColorItem.color,
                                      borderRadius: BorderRadius.circular(500),
                                      border: Border.all(
                                        width:
                                            (themeColorItem.isSelected) ? 3 : 0,
                                      ),
                                    ),
                                    child: (themeColorItem.isSelected)
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
                  ),
                )
              ],
            ),
            ExpansionTile(
              shape: listTileRoundness,
              title: const Row(
                children: [
                  Icon(Icons.text_fields_rounded),
                  SizedBox(width: 10),
                  Text("Fonts"),
                ],
              ),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: MyApp.of(context)!.appFontFamilies.map(
                    (fontFamily) {
                      bool isSelected = false;
                      if (Theme.of(context).textTheme.bodySmall?.fontFamily ==
                          fontFamily) {
                        isSelected = true;
                      }
                      return FilledButton.tonal(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                  width: 2,
                                  color: (!isSelected)
                                      ? Theme.of(context)
                                          .colorScheme
                                          .secondaryContainer
                                      : Theme.of(context).colorScheme.tertiary),
                            ),
                          ),
                        ),
                        onPressed: () {
                          MyApp.of(context)?.changeFontTheme(fontFamily);
                        },
                        child: Text(fontFamily),
                      );
                    },
                  ).toList(),
                )
              ],
            ),
            const SizedBox(height: 10),
            ListTile(
              shape: listTileRoundness,
              onTap: () {},
              title: const Row(
                children: [
                  Icon(Icons.info_rounded),
                  SizedBox(width: 10),
                  Text("About us"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Hero(
              tag: "signup",
              child: OutlinedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    CustomFadeTransition(
                      page: const SignupPageRoute(),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Logout ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
