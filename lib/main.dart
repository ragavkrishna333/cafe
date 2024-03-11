import 'package:cafe/dining.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MycafeApp());
}

class MycafeApp extends StatelessWidget {
  const MycafeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const Dining(),
    );
  }
}
