import 'package:flutter/material.dart';

import '../PortalEpp/widgets/text_widget.dart';

class SeparadorTitulo extends StatelessWidget {
  String titulo;
  SeparadorTitulo({super.key, required this.titulo});
  

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;

    return  Column(
                  children: [
                    Container(
                      width: ancho*0.8,
                      child: Row(
                        children: [
                          Container(width: ancho*0.05,),
                          Container(
                            width: ancho*0.6,
                            child: TextWidget(
                                        text: "$titulo",
                                        textAlignt: TextAlign.left,
                                        fontWeight: FontWeight.normal,
                                        textcolor: Color.fromARGB(255, 110, 110, 110),
                                        textsize: 20,
                                      ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: ancho*0.8,
                      child: Row(
                        children: [
                          Container(width: ancho*0.05,),
                          Container(
                                        height: 1,
                                        width: ancho*0.7,
                                        color: Color.fromARGB(255, 110, 110, 110)),
                        ],
                      ),
                    ),
                  ],
                );
  }
}