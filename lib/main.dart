import 'package:baseview_mobx_counter/product/counter/view/counter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter via Mobx',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        tabBarTheme: ThemeData.light().tabBarTheme,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CounterScreen(),
    );
  }
}
