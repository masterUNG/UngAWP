import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ungpwa/widget/authen.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  String uidLogin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findLogin();
  }

  Future<Null> findLogin() async {
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      uidLogin = event.uid;
      print('uidLogin ==>> $uidLogin');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: buildDrawer(),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Stack(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text('Name'), accountEmail: Text('Email')),
          buildSingOut(),
        ],
      ),
    );
  }

  Column buildSingOut() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.red.shade700),
          child: ListTile(
            onTap: () {
              processSingOut();
            },
            leading: Icon(
              Icons.exit_to_app,
              size: 36,
              color: Colors.white,
            ),
            title: Text(
              'Sign Out',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Future<Null> processSingOut() async {
    await FirebaseAuth.instance.signOut().then(
          (value) => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => Authen(),
              ),
              (route) => false),
        );
  }
}
