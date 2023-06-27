import 'package:casino/StatefulWidget/banditManchotScreen.dart';
import 'package:flutter/material.dart';

class BanditManchotApp extends StatelessWidget {
  const BanditManchotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bandit Manchot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BanditManchotScreen(),
    );
  }
}
