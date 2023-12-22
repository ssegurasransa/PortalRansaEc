import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'dart:ui';

import 'package:syncfusion_flutter_pdf/pdf.dart';

class PdfService {
  Future<void> printCustomersPdf(
      imagedata, nombre, apellido, numero, epp, cedula) async {
    //Create a new PDF document
    final PdfDocument document = PdfDocument();
    final PdfPage page = document.pages.add();
    final Size pageSize = page.getClientSize();

    String paragraphText1 =
        'Yo $nombre $apellido con código de trabajador N°$numero declaro para los debidos fines pertinentes, que el $epp se encuentran en mi poder, para uso de mis actividades desde el momento de la entrega, siendo responsable por su cuidado y conservación.';
    const String paragraphText2 =
        'El uso de los EPP, uniformes y sus componentes son de carácter obligatorio durante la realización de la actividad para lo cual se me fue contratado. El NO uso será motivo suficiente para generar una sanción por escrito, teniendo en cuenta que la reincidencia en el NO uso inclusive es causal de VISTO BUENO.';
    const String paragraphText3 =
        'Asumo entera responsabilidad por la conservación y cuidado del EPP y vestimenta de trabajo que se entregue, así como estoy consciente de la devolución de los mismos cuando se dé el termino de mi contrato de trabajo y reposición del respectivo valor en los casos de pérdidas y daños dolosos.';
    const String paragraphText4 =
        'Declaro además haber recibido, el Reglamento Interno de Seguridad en el cual se habla de Prevención, Normas y Procedimientos de la compañía.';
    const String paragraphText5 =
        'Confirmo la lectura del término de responsabilidad y recibimiento del equipo de protección individual.';

    //Titulo--

    page.graphics.drawString(
        'AUTORIZACIÓN DE ENTREGA Y RENOVACIÓN DEL EQUIPO DE PROTECCIÓN PERSONAL (EPP)',
        PdfStandardFont(PdfFontFamily.helvetica, 14),
        bounds: Rect.fromLTWH(10, 30, pageSize.width - 10, 60),
        format: PdfStringFormat(alignment: PdfTextAlignment.center));

    //Parrafo--
    page.graphics.drawString(
        paragraphText1, PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: Rect.fromLTWH(10, 100, pageSize.width - 10, pageSize.height),
        format: PdfStringFormat(alignment: PdfTextAlignment.justify));

    page.graphics.drawString(
        paragraphText2, PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: Rect.fromLTWH(10, 160, pageSize.width - 10, pageSize.height),
        format: PdfStringFormat(alignment: PdfTextAlignment.justify));

    page.graphics.drawString(
        paragraphText3, PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: Rect.fromLTWH(10, 225, pageSize.width - 10, pageSize.height),
        format: PdfStringFormat(alignment: PdfTextAlignment.justify));

    page.graphics.drawString(
        paragraphText4, PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: Rect.fromLTWH(10, 290, pageSize.width - 10, pageSize.height),
        format: PdfStringFormat(alignment: PdfTextAlignment.justify));

    page.graphics.drawString(
        paragraphText5, PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: Rect.fromLTWH(10, 325, pageSize.width - 10, pageSize.height),
        format: PdfStringFormat(alignment: PdfTextAlignment.justify));

//Load the image using PdfBitmap.
    Uint8List bytes1 = base64.decode(imagedata);

    final PdfBitmap image = PdfBitmap(bytes1);
//Draw the image to the PDF page.
    page.graphics.drawImage(image, const Rect.fromLTWH(60, 590, 200, 50));

    //Firma
    page.graphics.drawString(
        'Firma:', PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: Rect.fromLTWH(10, 200, pageSize.width - 10, pageSize.height),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString('Nombre: $nombre $apellido',
        PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: Rect.fromLTWH(10, 290, pageSize.width - 10, pageSize.height),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    page.graphics.drawString(
        'Cédula: $cedula', PdfStandardFont(PdfFontFamily.helvetica, 12),
        bounds: Rect.fromLTWH(10, 310, pageSize.width - 10, pageSize.height),
        format: PdfStringFormat(lineAlignment: PdfVerticalAlignment.middle));

    List<int> bytes = await document.save();

    //Download document
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", "Firma$cedula.pdf")
      ..click();

    //Dispose the document
    document.dispose();
  }
}
