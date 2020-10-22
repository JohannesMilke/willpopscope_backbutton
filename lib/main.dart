import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willpopscope_backbutton/model/user.dart';
import 'package:willpopscope_backbutton/page/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final String title = 'WillPop & BackButton';
  final user = User();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (_) => user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: HomePage(),
        ),
      );
}
