import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ungpwa/widget/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  bool statusRedEye = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -0.5),
            radius: 1.0,
            colors: [Colors.white, Colors.lime],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildContainer(),
                buildText(),
                buildContainerUser(),
                buildContainerPassword(),
                buildLogin(),
                buildFlatButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  FlatButton buildFlatButton() {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context, MaterialPageRoute(builder: (context) => Register(),)
        );
      },
      child: Text(
        'New Registrer',
        style: TextStyle(color: Colors.pink),
      ),
    );
  }

  Container buildLogin() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: RaisedButton(
        color: Colors.purple.shade700,
        onPressed: () {},
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Container buildContainerUser() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        decoration: InputDecoration(
          labelText: 'User :',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Container buildContainerPassword() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: 250,
      child: TextField(
        obscureText: statusRedEye,
        decoration: InputDecoration(
          labelText: 'Password :',
          border: OutlineInputBorder(),
          suffixIcon: IconButton(
              icon: Icon(Icons.remove_red_eye),
              onPressed: () {
                setState(() {
                  statusRedEye = !statusRedEye;
                });
              }),
        ),
      ),
    );
  }

  Text buildText() => Text(
        'Ung PWA',
        style: GoogleFonts.lobster(
            textStyle: TextStyle(
          fontSize: 30,
          color: Colors.purple.shade700,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
        )),
      );

  Container buildContainer() {
    return Container(
      width: 180,
      child: Image.asset('images/logo.png'),
    );
  }
}
