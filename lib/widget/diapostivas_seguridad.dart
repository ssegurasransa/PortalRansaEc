import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../screens/Seguridad_Evaluacion.dart';

final List<String> images = [
  'Diapositiva1.JPG',
  'Diapositiva2.JPG',
  'Diapositiva3.JPG',
  'Diapositiva4.JPG',
  'Diapositiva5.JPG',
  'Diapositiva6.JPG',
  'Diapositiva7.JPG',
  'Diapositiva8.JPG',
  'Diapositiva9.JPG',
  'Diapositiva10.JPG',
  'Diapositiva11.JPG',
  'Diapositiva12.JPG',
  'Diapositiva13.JPG',
  'Diapositiva14.JPG',
  'Diapositiva15.JPG',
  'Diapositiva16.JPG',
  'Diapositiva17.JPG',
  'Diapositiva18.JPG',
  'Diapositiva19.JPG',
  'Diapositiva20.JPG',
  'Diapositiva21.JPG',
  'Diapositiva22.JPG',
  'Diapositiva23.JPG',
  'Diapositiva24.JPG',
  'Diapositiva25.JPG',
  'Diapositiva26.JPG',
  'Diapositiva27.JPG',
  'Diapositiva28.JPG',
  'Diapositiva29.JPG',
  'Diapositiva30.JPG',
  'Diapositiva31.JPG',
  'Diapositiva32.JPG',
  'Diapositiva33.JPG',
  'Diapositiva34.JPG',
  'Diapositiva35.JPG',
  'Diapositiva36.JPG',
  'Diapositiva37.JPG',
  'Diapositiva38.JPG',
  'Diapositiva39.JPG',
  'Diapositiva40.JPG',
  'Diapositiva41.JPG',
  'Diapositiva42.JPG',
  'Diapositiva43.JPG',
  'Diapositiva44.JPG',
];

List<Widget> generateImagesTiles() {
  return images
      .map((element) => ClipRRect(
            child: Image.asset(element),
          ))
      .toList();
}

class DiapositivasSeguridad extends StatefulWidget {
  const DiapositivasSeguridad({super.key, required this.cedula, required this.cd});
  final String cedula;
  final String cd;

  @override
  State<DiapositivasSeguridad> createState() => _DiapositivasSeguridadState();
}

class _DiapositivasSeguridadState extends State<DiapositivasSeguridad> {
  //Responsivo----------------
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.height >= 500;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.height < 500;
  //---------------------------

  @override
  Widget build(BuildContext context) {
    final controller = CarouselController();
    void next() => controller.nextPage();
    void previuos() => controller.previousPage();

    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        children: [
          Container(
              height: altura * 0.7,
              child: InteractiveViewer(
                child: CarouselSlider(
                  carouselController: controller,
                  items: generateImagesTiles(),
                  options: CarouselOptions(
                      enlargeCenterPage: true, enableInfiniteScroll: false),
                ),
              )),
          if (isDesktop(context))
            Column(
              children: [
                Container(
                  height: altura * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ancho * 0.01,
                                  vertical: altura * 0.005)),
                          onPressed: previuos,
                          child: Icon(Icons.arrow_back, size: altura * 0.05)),
                      SizedBox(
                        width: ancho * 0.05,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ancho * 0.01,
                                  vertical: altura * 0.005)),
                          onPressed: next,
                          child:
                              Icon(Icons.arrow_forward, size: altura * 0.05)),
                    ],
                  ),
                ),
                Container(
                  height: altura * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: ancho * 0.03,
                                vertical: altura * 0.03)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  EvaluacionDataPersonal(
                                cedula: widget.cedula, cd: widget.cd,
                              ),
                            ),
                          );
                        },
                        child: Text("Ir a Evaluación"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          if (isMobile(context))
            Column(
              children: [
                Container(
                  height: altura * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ancho * 0.01,
                                  vertical: altura * 0.005)),
                          onPressed: previuos,
                          child: Icon(Icons.arrow_back, size: altura * 0.05)),
                      SizedBox(
                        width: ancho * 0.05,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: ancho * 0.03,
                                vertical: altura * 0.03)),
                        onPressed: () {
                          Navigator.push(
                            context,
                             MaterialPageRoute(
                              builder: (context) =>  EvaluacionDataPersonal(
                                cedula: widget.cedula, cd: '',
                              ),
                            ),
                          );
                        },
                        child: Text("Ir a Evaluación"),
                      ),
                      SizedBox(
                        width: ancho * 0.05,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ancho * 0.01,
                                  vertical: altura * 0.005)),
                          onPressed: next,
                          child:
                              Icon(Icons.arrow_forward, size: altura * 0.05)),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
