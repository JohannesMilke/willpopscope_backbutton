import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willpopscope_backbutton/main.dart';
import 'package:willpopscope_backbutton/model/user.dart';
import 'package:willpopscope_backbutton/page/edit_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => editUser(context),
          ),
        ],
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Username:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(width: 8),
            Text(
              user.username ?? '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  void editUser(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => EditPage()),
      );
}
