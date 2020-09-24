import 'package:barcode_scan/barcode_scan.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ungpwa/models/user_model.dart';
import 'package:ungpwa/utility/constant.dart';
import 'package:ungpwa/utility/normal_dialog.dart';

class ReadQR extends StatefulWidget {
  @override
  _ReadQRState createState() => _ReadQRState();
}

class _ReadQRState extends State<ReadQR> {
  // String qrResult;
  String qrResult = 'beLSVXcLkMeBeesWgmhk1UIVcNo2';
  UserModel userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => processReadQRcode(),
        child: Icon(Icons.add_to_queue),
      ),
      body: userModel == null
          ? Center(child: Text('กรุณา คลิก QR code'))
          : buildColumn(),
    );
  }

  Center buildColumn() {
    return Center(
      child: Column(
        children: [
          Text('uidFrined ==>> $qrResult'),
          Container(
            width: 200,
            height: 200,
            child: Image.network(userModel.path),
          ),
          Text('Name ==> ${userModel.name}'),
          Text('Position ==>> ${userModel.position}'),
          Text('ละติจูต ==> ${userModel.lat}'),
          Text('ลองติจูต ==>> ${userModel.lng}'),
          buildOutlineButton()
        ],
      ),
    );
  }

  OutlineButton buildOutlineButton() => OutlineButton(
        onPressed: () => processUploadMySQL(),
        child: Text('Upload Data To mySQL'),
      );

  Future<Null> processReadQRcode() async {
    try {
      var result = await BarcodeScanner.scan();
      qrResult = result.rawContent;
      print('qrResult = $qrResult');

      await readData();
    } catch (e) {}
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('UserUng')
          .doc(qrResult)
          .snapshots()
          .listen((event) {
        setState(() {
          userModel = UserModel.fromJson(event.data());
          print('url ==>> ${userModel.path}');
        });
      });
    });
  }

  Future<Null> processUploadMySQL() async {
    String urlAPI =
        '${Constant().domain}/pwa/addFriend.php?isAdd=true&uidLogin=$qrResult&uidFriend=$qrResult&nameFriend=${userModel.name}&position=${userModel.position}&urlPath=${userModel.path}&lat=${userModel.lat}&lng=${userModel.lng}';
    await Dio()
        .get(urlAPI)
        .then((value) => normalDialog(context, 'Upload MySQL Success'));
  }
}
