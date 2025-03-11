import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Exerciciiiiiiii/providers/car_provider.dart';
import 'Exerciciiiiiiii/screens/car_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CarProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: CarScreen(),
    );
  }
}
