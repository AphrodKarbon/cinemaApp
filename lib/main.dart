import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'All.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black, // Remplacez par la couleur de votre choix
        statusBarIconBrightness: Brightness.light, // Contrôle la couleur des icônes de la barre de statut (clair ou foncé)
      )
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const All(title: 'Flutter Demo Home Page'),
    );
  }
}

