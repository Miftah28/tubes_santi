// ignore_for_file: use_key_in_widget_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:bookstore_app/login.dart';
import 'package:bookstore_app/data.dart';
import 'package:bookstore_app/detail.dart';
import 'package:bookstore_app/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoginPage(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}

generateRoute(RouteSettings settings) {
  final path = settings.name.split('/');
  final title = path[1];

  Book book = books.firstWhere((it) => it.title == title);
  return MaterialPageRoute(
    settings: settings,
    builder: (context) => Detail(book),
  );
}
