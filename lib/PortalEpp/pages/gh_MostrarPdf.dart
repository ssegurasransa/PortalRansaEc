// ignore: file_names
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:portaltransportistas/pdf/pdf_service.dart';

import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

// ignore: camel_case_types
class Gh_MostrarPDF extends StatefulWidget {
  const Gh_MostrarPDF({super.key});

  @override
  _Gh_MostrarPDFState createState() => _Gh_MostrarPDFState();
}

class _Gh_MostrarPDFState extends State<Gh_MostrarPDF> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  late String dataString1;

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  Future<String> _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
    //Uint8List byteData = bytes!.buffer.asUint8List();
    String base64String = base64Encode(bytes!.buffer.asUint8List());
    setState(() {
      dataString1 = base64String;
    });
    return base64String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: SfSignaturePad(
              key: signatureGlobalKey,
              backgroundColor: Colors.white,
              strokeColor: Colors.black,
              minimumStrokeWidth: 1.0,
              maximumStrokeWidth: 4.0)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final data =
              await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
          final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
          final base64String = base64Encode(bytes!.buffer.asUint8List());

          //PdfService().printCustomersPdf(dataString1);

          //PdfService().printCustomersPdf(_handleSaveButtonPressed());
        },
        child: const Icon(Icons.print),
      ),
    );
  }
}
