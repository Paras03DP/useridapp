import 'package:flutter/material.dart';
import 'package:getit/di/di.dart';
import 'package:getit/view/add_user_view.dart';
import 'package:getit/view/display_user_view.dart';

void main() {
  initModule();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const AddUserView(),
        '/displayUser': (context) => const DisplayUserView(),
      },
    ),
  );
}
