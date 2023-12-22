import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_gh.dart';
import 'package:portaltransportistas/PortalEpp/widgets/message_input.dart';
import 'package:portaltransportistas/PortalEpp/widgets/text_widget.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;
import 'dart:convert';

class Gh_CrearUsuario extends StatefulWidget {
  const Gh_CrearUsuario({super.key});

  @override
  State<Gh_CrearUsuario> createState() => _Gh_CrearUsuarioState();
}

class _Gh_CrearUsuarioState extends State<Gh_CrearUsuario> {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  late String nameValue;
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  void _handleClearButtonPressed() {
    signatureGlobalKey.currentState!.clear();
  }

  void _handleSaveButtonPressed() async {
    final data =
        await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
    final bytes = await data.toByteData(format: ui.ImageByteFormat.png);

    String base64String = base64Encode(bytes!.buffer.asUint8List());
    print(base64String);
    insertActadeEntregaEpp("1", "Freddy", "Paladines", "0922002175",
        base64String, "Ingresado", "Casco", "093434412");

    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Center(
                  child: Container(
                    color: Colors.grey[300],
                    child: Image.memory(base64Decode(base64String)),
                    //child: Image.memory(bytes!.buffer.asUint8List()),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Gh_menu(),
          SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      FutureBuilder<List<EppSelectActadeEntrega>>(
                        future: eppSelectActadeEntrega(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                                child: Image.memory(
                                    base64Decode(snapshot.data!.first.firma)));
                          }
                          return CircularProgressIndicator();
                        },
                        //child:Text(eppSelectActadeEntrega().toString())
                      ),
                      Row(
                        children: [
                          Container(
                            width: 300,
                            child: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: SfSignaturePad(
                                        key: signatureGlobalKey,
                                        backgroundColor: Colors.white,
                                        strokeColor: Colors.black,
                                        minimumStrokeWidth: 1.0,
                                        maximumStrokeWidth: 4.0)),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      TextButton(
                                        child: Text('ToImage'),
                                        onPressed: _handleSaveButtonPressed,
                                      ),
                                      TextButton(
                                        child: Text('Clear'),
                                        onPressed: _handleClearButtonPressed,
                                      )
                                    ]),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 300,
                                        child: TextWidget(
                                          text: "Nombre",
                                          fontWeight: FontWeight.normal,
                                          textcolor: Color.fromARGB(
                                              255, 110, 110, 110),
                                          textsize: 16,
                                          textAlignt: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 3,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return "Llene este campo";
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  onSaved: (value) {
                                    nameValue = value!;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 160,
                            height: 35,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff009B3A),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  mostrarDialog(context);
                                }
                              },
                              child: const Text('Generar solicitud'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))),
        ],
      ),
    );
  }
}
