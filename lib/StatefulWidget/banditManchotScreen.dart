// ignore: file_names
import 'dart:math';
import 'package:flutter/material.dart';


class BanditManchotScreen extends StatefulWidget {
  const BanditManchotScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BanditManchotScreenState createState() => _BanditManchotScreenState();
}

class _BanditManchotScreenState extends State<BanditManchotScreen> {
  List<String> icons = [
    'images/bar.png',
    'images/cerise.png',
    'images/cloche.png',
    'images/diamant.png',
    'images/fer-a-cheval.png',
    'images/pasteque.png',
    'images/sept.png',
  ];

  int _counter = 0;

  String icon1 = "";
  String icon2 = "";
  String icon3 = "";

  void spin() {
    setState(() {
      icon1 = getRandomIcon();
      icon2 = getRandomIcon();
      icon3 = getRandomIcon();
      _counter++;
    });
  }

  String getRandomIcon() {
    final random = Random();
    return icons[random.nextInt(icons.length)];
  }

  bool isJackpot() {
    return icon1 == icon2 && icon2 == icon3;
  }

  bool isJackpotWith7() {
    return isJackpot() && icon1 == 'assets/icon7.png';
  }

  @override
  void initState() {
    super.initState();
    spin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bandit Manchot'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(icon1, width: 80, height: 80),
                Image.asset(icon2, width: 80, height: 80),
                Image.asset(icon3, width: 80, height: 80),
              ],
            ),
            const SizedBox(height: 20),
            isJackpot()
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have won the jackpot !',
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'You have lost this many times:',
                      ),
                      Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
            const SizedBox(height: 20),
            FloatingActionButton(
              onPressed: () {
                spin();
                if (isJackpotWith7()) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Jackpot!'),
                        content: const Text(
                            'Congratulations, you won the jackpot with the symbol 7 !'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else if (isJackpot()) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Jackpot!'),
                        content: const Text('Congratulations, you won the jackpot!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                } else {}
              },
              child: const Icon(Icons.replay),
            ),
          ],
        ),
      ),
    );
  }
}
