import 'package:barcode_scan/barcode_scan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungpwa/models/user_model.dart';

class ReadQR extends StatefulWidget {
  @override
  _ReadQRState createState() => _ReadQRState();
}

class _ReadQRState extends State<ReadQR> {
  String qrResult;
  // String qrResult = 'beLSVXcLkMeBeesWgmhk1UIVcNo2';
  UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => processReadQRcode(),
        child: Icon(Icons.add_to_queue),
      ),
      body: qrResult == null
          ? Center(child: Text('กรุณา คลิก QR code'))
          : buildColumn(),
    );
  }

  Center buildColumn() {
    return Center(
      child: Column(
        children: [
          Text('uidFrined ==>> $qrResult'),
          Container(width: 200,height: 200,child: Image.network(userModel.path),),
          Text('Name ==> ${userModel.name}'),
          Text('Position ==>> ${userModel.position}'),
          Text('ละติจูต ==> ${userModel.lat}'),
          Text('ลองติจูต ==>> ${userModel.lng}'),
        ],
      ),
    );
  }

  Future<Null> processReadQRcode() async {
    try {
      var result = await BarcodeScanner.scan();
      qrResult = result.rawContent;
      print('qrResult = $qrResult');

      await Firebase.initializeApp().then((value) async {
        await FirebaseFirestore.instance
            .collection('UserUng')
            .doc(qrResult)
            .snapshots()
            .listen((event) {
          setState(() {
            userModel = UserModel.fromJson(event.data());
          });
        });
      });
    } catch (e) {}
  }
}
