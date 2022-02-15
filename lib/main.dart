import 'package:flutter/material.dart';
import 'package:flutter_examples/src/widgets/finance_dark_mode/finance_app.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorDark: const Color(0xff2a2a2a),
        hoverColor: const Color(0xff3d3d3d),
        primarySwatch: Colors.blue,
      ),
      home: const FinanceApp(),
    );
  }
}
