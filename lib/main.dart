import 'package:flutter/material.dart';
import "screens/main_screen.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:android_dev/screens/home_screen/providers/post_providers.dart';
import 'package:android_dev/screens/home_screen/services/post_services.dart';

void main() {
  runApp(ProviderScope(
    overrides: [
      postServicesProvider.overrideWithValue(PostServices()),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen()
    );
  }
}
