import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'features/search/view/search_page.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Color(0xFF363f93),
                fontSize: 18,
                fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.black),
            color: Colors.white,
            elevation: 0 //<-- SEE HERE
            ),
      ),
      home: SearchPage(),
    );
  }
}
