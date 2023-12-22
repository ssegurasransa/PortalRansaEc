import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class GhMostrarActEntrega extends StatefulWidget {
  String nombre;
  String apellido;
  String numero;
  String epp;
  String cedula;
  String firma;
  GhMostrarActEntrega(this.nombre, this.apellido, this.numero, this.epp,
      this.cedula, this.firma,
      {super.key});

  @override
  State<GhMostrarActEntrega> createState() => _GhMostrarActEntregaState();
}

class _GhMostrarActEntregaState extends State<GhMostrarActEntrega> {
  @override
  Widget build(BuildContext context) {
    Size pantalla = MediaQuery.of(context).size;

    String paragraphText1 =
        'Yo ${widget.nombre} ${widget.apellido} con código de trabajador N°${widget.numero} declaro para los debidos fines pertinentes, que el ${widget.epp} se encuentran en mi poder, para uso de mis actividades desde el momento de la entrega, siendo responsable por su cuidado y conservación.';
    String paragraphText2 =
        'El uso de los EPP, uniformes y sus componentes son de carácter obligatorio durante la realización de la actividad para lo cual se me fue contratado. El NO uso será motivo suficiente para generar una sanción por escrito, teniendo en cuenta que la reincidencia en el NO uso inclusive es causal de VISTO BUENO.';
    String paragraphText3 =
        'Asumo entera responsabilidad por la conservación y cuidado del EPP y vestimenta de trabajo que se entregue, así como estoy consciente de la devolución de los mismos cuando se dé el termino de mi contrato de trabajo y reposición del respectivo valor en los casos de pérdidas y daños dolosos.';
    String paragraphText4 =
        'Declaro además haber recibido, el Reglamento Interno de Seguridad en el cual se habla de Prevención, Normas y Procedimientos de la compañía.';
    String paragraphText5 =
        'Confirmo la lectura del término de responsabilidad y recibimiento del equipo de protección individual.                                      ';
    Uint8List _bytesImage;
    _bytesImage = Base64Decoder().convert(widget.firma);

    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: pantalla.width * 0.6,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pantalla.width * 0.04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: pantalla.height * 0.05,
              ),
              Text(
                  "AUTORIZACIÓN DE ENTREGA Y RENOVACIÓN DEL EQUIPO DE PROTECCIÓN PERSONAL (EPP)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(
                height: pantalla.height * 0.05,
              ),
              ParrafoText(
                text: paragraphText1,
              ),
              ParrafoText(
                text: paragraphText2,
              ),
              ParrafoText(
                text: paragraphText3,
              ),
              ParrafoText(
                text: paragraphText4,
              ),
              ParrafoText(
                text: paragraphText5,
              ),
              SizedBox(
                height: pantalla.height * 0.2,
              ),
              Row(
                children: [
                  Text("Firma:",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16)),
                ],
              ),
              if (widget.firma != "")
                Row(
                  children: [
                    Image.memory(
                      _bytesImage,
                      width: pantalla.width * 0.2,
                      height: pantalla.height * 0.15,
                    ),
                  ],
                ),
              if (widget.firma == "")
                Container(
                  height: pantalla.height * 0.15,
                  width: pantalla.width * 0.2,
                ),
              Row(
                children: [
                  Text(
                    "Nombre: ${widget.nombre}",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Cedula: ${widget.cedula}",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Image imageFromBase64String(String base64String) {
  return Image.memory(base64Decode(base64String));
}

class ParrafoText extends StatelessWidget {
  String text;
  ParrafoText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16),
        ),
        Text("", style: TextStyle(fontSize: 16))
      ],
    );
  }
}
