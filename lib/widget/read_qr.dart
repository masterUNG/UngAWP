import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class ReadQR extends StatefulWidget {
  @override
  _ReadQRState createState() => _ReadQRState();
}

class _ReadQRState extends State<ReadQR> {
  String qrResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => processReadQRcode(),
        child: Icon(Icons.add_to_queue),
      ),
      body: Center(child: Text('Read QR')),
    );
  }

  Future<Null> processReadQRcode() async {
    try {
      var result = await BarcodeScanner.scan();
      qrResult = result.rawContent;
      print('qrResult = $qrResult');
    } catch (e) {}
  }
}
