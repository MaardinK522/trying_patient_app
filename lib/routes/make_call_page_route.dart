import 'package:flutter/material.dart';
import 'package:phyzzicare/generated/assets.dart';

class MakeCallRoute extends StatefulWidget {
  const MakeCallRoute({Key? key}) : super(key: key);

  @override
  State<MakeCallRoute> createState() => _MakeCallRouteState();
}

class _MakeCallRouteState extends State<MakeCallRoute> {
  bool isMuted = false;
  bool isHandsFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PhyzziCare"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 50),
          Column(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(Assets.assetsGhandi)),
                ),
              ),
              const Text(
                "Mahatma Ghandhi",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          const SizedBox(height: 50),
          const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 10),
                Text(
                  "Connecting...",
                  style: TextStyle(fontSize: 30),
                ),
              ]),
          const Expanded(child: Center()),
          const Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  elevation: 10,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isMuted = !isMuted;
                      });
                    },
                    splashRadius: 40,
                    iconSize: 40,
                    icon: Icon(
                        (isMuted) ? Icons.mic_off_rounded : Icons.mic_rounded),
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: IconButton(
                    splashRadius: 40,
                    iconSize: 40,
                    onPressed: () {
                      setState(() {
                        isHandsFree = !isHandsFree;
                      });
                    },
                    icon: Icon((isHandsFree)
                        ? Icons.volume_off_rounded
                        : Icons.volume_up_rounded),
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: IconButton(
                    icon: const Icon(Icons.call_end_rounded),
                    color: Colors.redAccent,
                    iconSize: 40,
                    onPressed: () {
                      Future.delayed(
                        const Duration(
                          milliseconds: 700,
                        ),
                        () => Navigator.pop(context),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
