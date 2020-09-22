import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> positions = [
    'Account Manager',
    'Administrative Officer',
    'Brand Manager',
    'Customer Service Executive',
    'Financial Analyst',
    'HR Generalist/ Specialist',
    'Logistic Manager'
  ];
  String choosePosition;
  double lat, lng;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    findLatLng();
  }

  Future<Null> findLatLng() async {
    LocationData locationData = await findLocation();
    lat = locationData.latitude;
    lng = locationData.longitude;
    print('lat = $lat, lng = $lng');
  }

  Future<LocationData> findLocation() async {
    Location location = Location();
    try {
      return await location.getLocation();
    } catch (e) {
      print('e findLocation ==> ${e.toString()}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade700,
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildAvatar(),
            buildName(),
            buildSizedBox(),
            buildPosition(),
            buildSizedBox(),
            buildUser(),
            buildSizedBox(),
            buildPassword(),
            buildSizedBox(),
            buildMap(),
            buildSizedBox(),
          ],
        ),
      ),
    );
  }

  Container buildMap() => Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.width * 0.8,
        color: Colors.grey,
      );

  SizedBox buildSizedBox() {
    return SizedBox(
      height: 16,
    );
  }

  Container buildPosition() => Container(
        width: 250,
        child: DropdownButton<String>(
          items: positions
              .map(
                (e) => DropdownMenuItem(
                  child: Text(e),
                  value: e,
                ),
              )
              .toList(),
          value: choosePosition,
          hint: Text('Positon'),
          onChanged: (value) {
            setState(() {
              choosePosition = value;
            });
          },
        ),
      );

  Container buildName() {
    return Container(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Display Name',
            prefixIcon: Icon(
              Icons.face,
              color: Color(0xFFE81EE8),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black38)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }

  Container buildUser() {
    return Container(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
            hintText: 'User',
            prefixIcon: Icon(
              Icons.account_circle,
              color: Color(0xFFE81EE8),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.black38)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      width: 250,
      child: TextField(
        decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.lock,
              color: Color(0xFFE81EE8),
            ),
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
