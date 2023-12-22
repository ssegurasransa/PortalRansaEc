import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';
import 'package:portaltransportistas/PortalEpp/widgets/text_predictivo.dart';
import 'package:provider/provider.dart';
import '../provider/gh_registerNew.dart';
import '../widgets/menu_gh.dart';
import '../widgets/message_input.dart';
import '../widgets/text_widget.dart';
import 'dropdownprovider.dart';

class GhRegistrarEpp extends StatefulWidget {
  const GhRegistrarEpp({super.key});

  @override
  State<GhRegistrarEpp> createState() => _GhRegistrarEppState();
}

class _GhRegistrarEppState extends State<GhRegistrarEpp> {
  late String nameValue;
  late String fechaValue;
  late String areadetrabajo;
  int botasDias = 0;
  int cascosDias = 0;
  int camisetasDias = 0;
  int camisasDias = 0;
  int chalecosDias = 0;
  String? dropdownValueRol;
  String? dropdownValueEPP;
  String? dropdownDecBotas;
  final fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;

    return ChangeNotifierProvider(
      create: (context) => RegisterFormProvider(),
      child: Builder(builder: (context) {
        final registerFormProvider =
            Provider.of<RegisterFormProvider>(context, listen: false);

        return Scaffold(
          body: Row(children: [
            Gh_menu(),
            SingleChildScrollView(
                child: Form(
              key: registerFormProvider.formKey,
              child: Consumer<DropdownService>(builder: (context, value, chil) {
                return Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      child: Row(children: [
                        //Obtener la data del SQL y guardarla en la base local
                        Container(
                          height: 0,
                          width: 0,
                          child: FutureBuilder(
                            future: obtenerGhMatrisEpp(),
                            builder: (context,
                                AsyncSnapshot<List<GhMatrisEpp>> snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // Muestra un indicador de carga mientras espera el resultado
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (snapshot.hasError) {
                                // Muestra un mensaje de error si hay un error
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else {
                                List<GhMatrisEpp> datos = snapshot.requireData;
                                cascosDias = datos[0].dias;
                                camisasDias = datos[1].dias;
                                camisetasDias = datos[2].dias;
                                botasDias = datos[3].dias;
                                chalecosDias = datos[4].dias;
                                return Container();
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: 30),
                        Container(
                          width: 950,
                          child: TextWidget(
                            text: "Nuevo registros:",
                            textAlignt: TextAlign.left,
                            fontWeight: FontWeight.normal,
                            textcolor: Color.fromARGB(255, 110, 110, 110),
                            textsize: 16,
                          ),
                        ),
                      ]),
                    ),

                    const SizedBox(height: 10),
                    Container(
                      child: Row(children: [
                        const SizedBox(width: 30),
                        Container(
                            height: 1,
                            width: 950,
                            color: Color.fromARGB(255, 110, 110, 110))
                      ]),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: ancho * 0.59,
                      child: Row(
                        children: [
                          AutocompleteWidget(value.setcedulaSelect),
                        ],
                      ),
                    ),

                    //------------ EPP--------------

                    const SizedBox(height: 30),
                    Container(
                      child: Row(children: [
                        const SizedBox(width: 30),
                        Container(
                          width: 950,
                          child: TextWidget(
                            text: "Registrar EPP:",
                            fontWeight: FontWeight.normal,
                            textcolor: Color.fromARGB(255, 110, 110, 110),
                            textsize: 16,
                            textAlignt: TextAlign.left,
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      child: Row(children: [
                        const SizedBox(width: 30),
                        Container(
                            height: 1,
                            width: 950,
                            color: Color.fromARGB(255, 110, 110, 110))
                      ]),
                    ),
                    Container(
                      height: 40,
                    ),
                    //----------------------Epp----------------------------

                    RegistrosEPP(),

                    //Boton de envio---------------------------------------------
                    Container(
                      height: 100,
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
                              if (registerFormProvider.formKey.currentState!
                                  .validate()) {
                                mostrarDialog(context);
                              }
                            },
                            child: const Text('Generar solicitud'),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 50,
                    ),
                  ],
                );
              }),
            ))
          ]),
        );
      }),
    );
  }

  Container RegistrosEPP() {
    return Container(
      child: Consumer<DropdownService>(builder: (context, value, child) {
        return Container(
          child: Column(
            children: [
//Botas------------------------------------------------------------

              Row(
                children: [
                  DropdowntextBotas(
                    titulo: 'Botas',
                  ),
                  Container(
                    width: 600,
                  ),
                ],
              ),
              Container(
                height: 30,
              ),
              if (value.botasselected == "Si")
                Container(
                  child: Row(children: [
                    Container(
                      width: 30,
                    ),
                    Image(
                        image: AssetImage('assets/Bota_de_seguridad.png'),
                        height: 200),
                    Container(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          child: FormInput("Cantidad:", value.botasCantidad,
                              value.setBotasCantidad),
                          width: 300,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: FormInput("Proveedor:", value.botasProveedor,
                              value.setBotasProveedor),
                          width: 300,
                        ),
                      ],
                    ),
                    Container(
                      width: 20,
                    ),
                    Column(
                      children: [
                        DropdowntextBotasEstado(
                          titulo: "Estado",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DateCampo(
                            context,
                            value.botasfechacompra,
                            value.botasfechaController,
                            value.setbotasfechacompra,
                            botasDias,
                            value.setbotasfecharenovar),
                      ],
                    ),
                  ]),
                ),

//Casco------------------------------------------------------------

              Row(
                children: [
                  DropdowntextCasco(
                    titulo: 'Casco',
                  ),
                  //Cambio
                  Container(
                    width: 600,
                  ),
                ],
              ),
              Container(
                height: 30,
              ),
              if (value.cascoselected == "Si")
                Container(
                  child: Row(children: [
                    Container(
                      width: 30,
                    ),
                    Image(
                        image: AssetImage('assets/GH_Casco.png'), height: 200),
                    Container(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          child: FormInput("Cantidad:", value.cascosCantidad,
                              value.setCascoCantidad),
                          width: 300,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: FormInput("Proveedor:", value.cascosProveedor,
                              value.setCascoProveedor),
                          width: 300,
                        ),
                      ],
                    ),
                    Container(
                      width: 20,
                    ),
                    Column(
                      children: [
                        DropdowntextCascoEstado(
                          titulo: "Estado",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DateCampo(
                            context,
                            value.cascosfechacompra,
                            value.cascosfechaController,
                            value.setCascofechacompra,
                            cascosDias,
                            value.setcascosFecharenovar)
                      ],
                    ),
                  ]),
                ),

//Camisetas----------------------------------------------------------------
              Row(
                children: [
                  DropdowntextCamisetas(
                    titulo: 'Camisetas',
                  ),
                  //Cambio
                  Container(
                    width: 600,
                  ),
                ],
              ),
              Container(
                height: 30,
              ),
              if (value.camisetasselected == "Si")
                Container(
                  child: Row(children: [
                    Container(
                      width: 30,
                    ),
                    Image(
                        image: AssetImage('assets/GH_CamisetaOficina.png'),
                        height: 200),
                    Container(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          child: FormInput("Cantidad:", value.camisetasCantidad,
                              value.setCamisetasCantidad),
                          width: 300,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: FormInput(
                              "Proveedor:",
                              value.camisetasProveedor,
                              value.setCamisetasProveedor),
                          width: 300,
                        ),
                      ],
                    ),
                    Container(
                      width: 20,
                    ),
                    Column(
                      children: [
                        DropdowntextCamisetasEstado(
                          titulo: "Estado",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DateCampo(
                            context,
                            value.camisetasfechacompra,
                            value.camisetasfechaController,
                            value.setcamisetasfechacompra,
                            camisetasDias,
                            value.setcamisetasfecharenovar)
                      ],
                    ),
                  ]),
                ),

//Camisas--------------------------------------------------------------------------
              Row(
                children: [
                  DropdowntextCamisas(
                    titulo: 'Camisas',
                  ),
                  //Cambio
                  Container(
                    width: 600,
                  ),
                ],
              ),
              Container(
                height: 30,
              ),
              if (value.camisasselected == "Si")
                Container(
                  child: Row(children: [
                    Container(
                      width: 30,
                    ),
                    Image(
                        image: AssetImage('assets/GH_CamisasSeguridad.png'),
                        height: 200),
                    Container(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          child: FormInput("Cantidad:", value.camisasCantidad,
                              value.setCamisasCantidad),
                          width: 300,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: FormInput("Proveedor:", value.camisasProveedor,
                              value.setCamisasProveedor),
                          width: 300,
                        ),
                      ],
                    ),
                    Container(
                      width: 20,
                    ),
                    Column(
                      children: [
                        DropdowntextCamisasEstado(
                          titulo: "Estado",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DateCampo(
                            context,
                            value.camisasfechacompra,
                            value.camisasfechaController,
                            value.setcamisasfechacompra,
                            camisasDias,
                            value.setcamisasfecharenovar)
                      ],
                    ),
                  ]),
                ),
//Chaleco--------------------------
              Row(
                children: [
                  DropdowntextChaleco(
                    titulo: 'Chalecos',
                  ),
                  //Cambio
                  Container(
                    width: 600,
                  ),
                ],
              ),
              Container(
                height: 30,
              ),
              if (value.chalecoselected == "Si")
                Container(
                  child: Row(children: [
                    Container(
                      width: 30,
                    ),
                    Image(
                        image: AssetImage('assets/GH_Chaleco.png'),
                        height: 200),
                    Container(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Container(
                          child: FormInput("Cantidad:", value.chalecosCantidad,
                              value.setChalecossCanitdad),
                          width: 300,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: FormInput(
                            "Proveedor:",
                            value.chalecosProveedor,
                            value.setChalecosProveedor,
                          ),
                          width: 300,
                        ),
                      ],
                    ),
                    Container(
                      width: 20,
                    ),
                    Column(
                      children: [
                        DropdowntextChalecoEstado(
                          titulo: "Estado",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DateCampo(
                            context,
                            value.chalecosfechacompra,
                            value.chalecosfechaController,
                            value.setchalecosfechacompra,
                            chalecosDias,
                            value.setchalecosfecharenovar)
                      ],
                    ),
                  ]),
                ),
            ],
          ),
        );
      }),
    );
  }

  DateCampo(BuildContext context, fechavalue, fechaControler, setfechacompra,
      int dias, setfecharenovar) {
    return Container(
      width: 300,
      child: Column(
        children: [
          Container(
            width: 300,
            child: TextWidget(
              text: "Fecha:",
              fontWeight: FontWeight.normal,
              textcolor: Color.fromARGB(255, 110, 110, 110),
              textsize: 16,
              textAlignt: TextAlign.left,
            ),
          ),
          Container(
            height: 3,
          ),
          TextFormField(
            onChanged: (value) => fechavalue = value,
            controller: fechaControler,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onTap: (() async {
              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100));
              if (pickeddate != null) {
                setState(() {
                  fechaControler.text =
                      DateFormat("dd-MM-yyyy").format(pickeddate);
                  setfechacompra(DateFormat("yyyy-MM-dd").format(pickeddate));
                  setfecharenovar(DateFormat("yyyy-MM-dd")
                      .format(pickeddate.add(Duration(days: dias))));
                });
              }
            }),
            onSaved: (value) {
              fechaValue = DateFormat("MM-dd-yyyy")
                  .format(DateFormat('dd-MM-yyyy').parse(value!));
            },
            validator: ((value) {
              if (value!.isEmpty) {
                return "Llene este campo";
              }
            }),
          )
        ],
      ),
    );
  }

  Container FormInput(titleinput, valueinput, dynamic setfunction) {
    return Container(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: TextWidget(
                text: titleinput,
                fontWeight: FontWeight.normal,
                textcolor: Color.fromARGB(255, 110, 110, 110),
                textsize: 16,
                textAlignt: TextAlign.left,
              ),
            ),
          ),
          Container(
            height: 3,
          ),
          TextFormField(
            onChanged: (String? v) {
              setfunction(v);
            },
            validator: (value) {
              if (value == null || value.isEmpty) return "Llene este campo";
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            onSaved: (value) {
              nameValue = value!;
            },
          ),
        ],
      ),
    );
  }
}
