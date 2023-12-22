/* import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portaltransportistas/PortalEpp/widgets/text_predictivo.dart';
import 'package:provider/provider.dart';


class Gh_home extends StatefulWidget {
  const Gh_home({super.key});

  @override
  State<Gh_home> createState() => _Gh_homeState();
}

class _Gh_homeState extends State<Gh_home> {
  late String nameValue;
  late String fechaValue;
  late String areadetrabajo;
  String? dropdownValueRol;
  String? dropdownValueEPP;
  String? dropdownDecBotas;
  final fechaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final sideMenuProvider = Provider.of<SideMenuProvider>(context);

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
                    Row(
                      children: [
                        Container(
                          width: 30,
                        ),
                        AutocompleteWidget(),
                        Container(
                          child: FormInput("Cedula:", value.cedulaSelect,
                              value.setcedulaSelect),
                          width: 300,
                        ),
                      ],
                    ),
                    Container(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 30,
                        ),
                        DateCampo(context, registerFormProvider.fecha,
                            fechaController),
                        Container(
                          width: 30,
                        ),
                        DropdowntextArea(
                          titulo: 'Area de trabajo',
                        ),
                        Container(
                          width: 30,
                        ),
                        DropdowntextRol(
                          titulo: 'Area asignado',
                        ),

                        /* Container(child:  DropboxCampo(),) */
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          width: 30,
                        ),
                        Container(
                          child: FormInput("Cargo:", value.cargoSelect,
                              value.setcargoSelect),
                          width: 300,
                        ),
                        Container(
                          width: 30,
                        ),
                        DropdowntextNivel(
                          titulo: 'Nivel de dotación',
                        ),
                        Container(
                          width: 30,
                        ),
                        DropdowntextEmpresa(
                          titulo: 'Empresa',
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        Container(
                          width: 30,
                        ),
                        Container(
                          child: FormInput("Ciudad:", value.ciudadSelect,
                              value.setciudadSelect),
                          width: 300,
                        ),
                        Container(
                          width: 30,
                        ),
                        DropdowntextPais(
                          titulo: 'Pais',
                        ),
                        Container(
                          width: 330,
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

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
                        DateCampo(context, value.botasfechacompra,
                            value.botasfechaController)
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
                        DropdowntextBotasEstado(
                          titulo: "Estado",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DateCampo(context, value.cascosfechacompra,
                            value.cascosfechaController)
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
                        DropdowntextBotasEstado(
                          titulo: "Estado",
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DateCampo(context, value.cascosfechacompra,
                            value.cascosfechaController)
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
                        DateCampo(context, value.camisasfechacompra,
                            value.camisasfechaController)
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
                              value.setChalecossCanitdad),
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
                        DateCampo(context, value.chalecosfechacompra,
                            value.chalecosfechaController)
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

  Column DateCampo(BuildContext context, fechavalue, fechaController) {
    return Column(
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
        Container(
          child: DateForm(context, fechavalue, fechaController),
          width: 300,
        ),
      ],
    );
  }

  TextFormField DateForm(BuildContext context, fechavalue, fechaControler) {
    return TextFormField(
      onChanged: (value) => fechavalue = value,
      controller: fechaControler,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onTap: (() async {
        DateTime? pickeddate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100));
        if (pickeddate != null) {
          setState(() {
            fechaControler.text = DateFormat("dd-MM-yyyy").format(pickeddate);
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
 */