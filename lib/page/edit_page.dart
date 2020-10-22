import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:willpopscope_backbutton/model/user.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();

    final user = Provider.of<User>(context, listen: false);

    controller = TextEditingController(text: user.username ?? '');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Edit User'),
          ),
          body: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildUsername(),
                const SizedBox(height: 40),
                RaisedButton(
                  child: Text('Save'),
                  onPressed: saveUser,
                ),
              ],
            ),
          ),
        ),
      );

  Future<bool> onWillPop() async {
    final shouldPop = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure?'),
        content: Text('Do you want to leave without saving?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No'),
          ),
          FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text('Yes'),
          ),
        ],
      ),
    );

    return shouldPop ?? false;
  }

  Widget buildUsername() => TextField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          labelText: 'Username',
          hintText: 'Type in your name',
          fillColor: Colors.white,
          filled: true,
        ),
      );

  void saveUser() {
    final state = Provider.of<User>(context, listen: false);
    state.username = controller.text;

    Navigator.of(context).pop();
  }
}
