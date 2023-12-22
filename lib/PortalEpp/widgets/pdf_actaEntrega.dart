/* import 'dart:io';
import 'dart:js';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_MostrarPdf.dart';
import 'package:portaltransportistas/PortalEpp/widgets/pdf_api.dart';

class PdfInvoiceApi {
  static Future<File> generate(Invoice invoice) async {
    final pdf=Document();
    print("object");

    pdf.addPage(MultiPage(build: (context)=>[
      buildTitle(invoice),

    ]));

    return PdfApi.saveDocument(name:'my_invoice.pdf', pdf: pdf,);
  }
  
  static buildTitle(Invoice invoice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Freddy",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 0.8*PdfPageFormat.cm)
      ]
    );
  
  }


  
} */