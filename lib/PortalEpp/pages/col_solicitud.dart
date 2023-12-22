import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_home.dart';
import 'package:portaltransportistas/PortalEpp/pages/dropdownprovider.dart';
import 'package:portaltransportistas/PortalEpp/provider/col_registerNew.dart';
import 'package:portaltransportistas/PortalEpp/provider/gh_registerNew.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
import 'package:portaltransportistas/PortalEpp/widgets/fecha_forms.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_col.dart';
import 'package:portaltransportistas/PortalEpp/widgets/message_input.dart';
import 'package:portaltransportistas/PortalEpp/widgets/tablaCol.dart';
import 'package:portaltransportistas/PortalEpp/widgets/text_widget.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';
import 'package:provider/provider.dart';

class ColSolicitudes extends StatefulWidget {
  const ColSolicitudes({super.key});

  @override
  State<ColSolicitudes> createState() => _ColSolicitudesState();
}

String cedula = '0123456789';
String fecha = "01-01-2023";

Future<List<TablasColSelectSolicitudEpp>> dataLista =
    obtenerTablasColSelectSolicitudEpp(query: cedula);

class _ColSolicitudesState extends State<ColSolicitudes> {
  late String nameValue;
  final comentarioValue = TextEditingController();
  final fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    final variables = Provider.of<VariablesExtCol>(context, listen: true);
    final variablesDrop =
        Provider.of<ColDropdownService>(context, listen: true);

    final _formKey = GlobalKey<FormState>();
    return ChangeNotifierProvider(
        create: (context) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          return Scaffold(
              body: Row(
            children: [
              Col_menu(),
              Container(
                width: ancho * 0.8,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Consumer<DropdownService>(
                        builder: (context, value, chil) {
                      return Column(
                        children: [
                          ImagenRansaTop(ancho: ancho),
                          SeparadorTitulo(
                            titulo:
                                'Haga click en el EPP que quisiera reportar:',
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              Container(
                                width: ancho * 0.05,
                              ),
                              SizedBox(
                                height: 400,
                                width: 1075,
                                child: FutureBuilder<
                                        List<TablasColSelectSolicitudEpp>>(
                                    future: dataLista,
                                    builder: (context, snapshot) {
                                      var filterData = snapshot.data;
                                      if (snapshot.hasData) {
                                        return Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          verticalDirection:
                                              VerticalDirection.down,
                                          children: <Widget>[
                                            Expanded(
                                              child: TablaColSolicitud(
                                                data: filterData,
                                              ),
                                            )
                                          ],
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text("${snapshot.error}");
                                      }
                                      return const CircularProgressIndicator();
                                    }),
                              ),
                            ],
                          ),
                          SeparadorTitulo(
                            titulo: 'Escribir los motivos',
                          ),
                          Container(
                            height: 25,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: ancho * 0.05,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: FormInput(
                                      "Nombre:",
                                      variables.epp,
                                      value.cedulaSelect,
                                      value.setcedulaSelect),
                                ),
                                Container(
                                  width: 10,
                                ),
                                DateForm(fecha, fechaController),
                                Container(
                                  width: 10,
                                ),
                                const DropdownColSolicitudMotivo(
                                  titulo: 'Motivo:',
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: alto * 0.03,
                          ),
                          Row(
                            children: [
                              Container(
                                width: ancho * 0.05,
                              ),
                              SizedBox(
                                width: ancho * 0.6,
                                child: FormLargeInput(
                                    "Comentario:", comentarioValue),
                              ),
                            ],
                          ),
                          Container(
                            height: alto * 0.1,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (variables.epp != "") {
                                if (_formKey.currentState!.validate()) {
                                  print(variables.id);
                                  print(comentarioValue.text);
                                  colUpdateSolicitudEpp(
                                      "Solicitud",
                                      comentarioValue.text,
                                      "correo",
                                      variablesDrop.motivoselected,
                                      variables.id);
                                  enviadoCorrectamente(context,
                                      "Solicitud de EPP enviada", ColHome());

                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Ingrese un equipo')),
                                );
                              }
                            },
                            child: Text('Enviar solicitud'),
                          ),
                          Container(
                            height: alto * 0.1,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ],
          ));
        }));
  }

//------------------------------------
  Column FormInput(
      titleinput, String valorInicial, valueinput, dynamic setfunction) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextWidget(
            text: titleinput,
            fontWeight: FontWeight.normal,
            textcolor: const Color.fromARGB(255, 110, 110, 110),
            textsize: 16,
            textAlignt: TextAlign.left,
          ),
        ),
        Container(
          height: 3,
        ),
        Container(
          width: 400,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Center(
              child: Row(
            children: [
              Container(
                width: 10,
              ),
              Text(
                "$valorInicial",
                style: TextStyle(fontSize: 16),
              ),
            ],
          )),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Column FormLargeInput(titleinput, valor) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: TextWidget(
            text: titleinput,
            fontWeight: FontWeight.normal,
            textcolor: const Color.fromARGB(255, 110, 110, 110),
            textsize: 16,
            textAlignt: TextAlign.left,
          ),
        ),
        Container(
          height: 3,
        ),
        SizedBox(
          height: 100,
          child: TextFormField(
            controller: valor,
            expands: true,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            /* onChanged: (String? v) {
              setfunction(v);
            }, */
            validator: (value) {
              if (value == null || value.isEmpty) return "Llene este campo";
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ),
      ],
    );
  }
}

class ImagenRansaTop extends StatelessWidget {
  const ImagenRansaTop({
    super.key,
    required this.ancho,
  });

  final double ancho;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ancho * 0.8,
      height: 100,
      child: const Align(
        alignment: Alignment.topRight,
        child: Image(image: AssetImage('assets/Logo_Ransa.png'), height: 140),
      ),
    );
  }
}
