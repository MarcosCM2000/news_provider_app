import 'package:flutter/material.dart';

import 'package:news_provider_app/pages/pages.dart';
import 'package:news_provider_app/theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: miTema,
      home: const TabsPage(),
    );
  }
}
