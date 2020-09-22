import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: Text('Register'),
      ),
      body: Column(
        children: [
          buildAvatar(),
          buildName(),
        ],
      ),
    );
  }

  Container buildName() {
    return Container(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.face, color: Color(0xFFE81EE8),),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black38)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }

  Container buildAvatar() {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(icon: Icon(Icons.add_a_photo), onPressed: null),
          Container(
            width: 180,
            height: 180,
            child: Image.asset('images/avatar.png'),
          ),
          IconButton(icon: Icon(Icons.add_photo_alternate), onPressed: null),
        ],
      ),
    );
  }
}
