import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portaltransportistas/api/provider.dart';import 'package:portaltransportistas/screens/Seguridad_Capacitacion.dart';

class IngresoDataPersonal extends StatefulWidget {
  const IngresoDataPersonal({super.key});

  @override
  State<IngresoDataPersonal> createState() => _IngresoDataPersonalState();
}

class _IngresoDataPersonalState extends State<IngresoDataPersonal> {
  late String nameValue;
  late String cedulaValue;
  late String fechaValue;
  late String cargoValue;
  late String sedeValue;

  final nameController = TextEditingController();
  final cedulaController = TextEditingController();
  final fechaController = TextEditingController();
  final cargoController = TextEditingController();
  final sedeController = DropdownEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 600;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width < 600;

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Inducción de seguridad Ransa'),
          actions: [
            IconButton(
              icon: Image.asset('assets/Logo_Ransa_Blanco.png'),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (isDesktop(context))
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Form(
                            key: formKey,
                            child: ListView(
                              children: <Widget>[
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      labelText: "Nombre y apellido:"),
                                  onSaved: (value) {
                                    nameValue = value.toString();
                                  },
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Llene este campo";
                                    }
                                  }),
                                ),
                                TextFormField(
                                  controller: cedulaController,
                                  decoration:
                                      InputDecoration(labelText: "Cedula:"),
                                  onSaved: (value) {
                                    cedulaValue = value!;
                                  },
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Llene este campo";
                                    }
                                  }),
                                ),
                                TextFormField(
                                  controller: fechaController,
                                  decoration: InputDecoration(
                                      labelText: "Fecha:",
                                      icon: Icon(Icons.calendar_today_rounded)),
                                  onTap: (() async {
                                    DateTime? pickeddate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100));
                                    if (pickeddate != null) {
                                      setState(() {
                                        fechaController.text =
                                            DateFormat("dd-MM-yyyy")
                                                .format(pickeddate);
                                      });
                                    }
                                  }),
                                  onSaved: (value) {
                                    fechaValue = DateFormat("MM-dd-yyyy")
                                        .format(DateFormat('dd-MM-yyyy')
                                            .parse(value!));
                                  },
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Llene este campo";
                                    }
                                  }),
                                ),
                                TextFormField(
                                  controller: cargoController,
                                  decoration:
                                      InputDecoration(labelText: "Cargo:"),
                                  onSaved: (value) {
                                    cargoValue = value!;
                                  },
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Relationship este campo";
                                    }
                                  }),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      labelText: "Centro de distribución:",
/*                                           isDense: true,
 */
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 50,
                                    buttonPadding:
                                        const EdgeInsets.only(right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: listacd
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Llene este campo';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      sedeValue = value.toString();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: ancho * 0.17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        _showCapacitacionPage(context);
                                      },
                                      child: Text("Ir a la capacitación")),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            alignment: Alignment.bottomRight,
                            child: Image(
                              height: 70,
                              image: AssetImage('assets/Logo_Ransa.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                //-------------------Version Mobil----------------------

                if (isMobile(context))
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Form(
                            key: formKey,
                            child: ListView(
                              children: <Widget>[
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      labelText: "Nombre y apellido:"),
                                  onSaved: (value) {
                                    nameValue = value!;
                                  },
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Llene este campo";
                                    }
                                  }),
                                ),
                                TextFormField(
                                  controller: cedulaController,
                                  decoration:
                                      InputDecoration(labelText: "Cedula:"),
                                  onSaved: (value) {
                                    cedulaValue = value!;
                                  },
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Llene este campo";
                                    }
                                  }),
                                ),
                                TextFormField(
                                  controller: fechaController,
                                  decoration: InputDecoration(
                                      labelText: "Fecha:",
                                      icon: Icon(Icons.calendar_today_rounded)),
                                  onTap: (() async {
                                    DateTime? pickeddate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100));
                                    if (pickeddate != null) {
                                      setState(() {
                                        fechaController.text =
                                            DateFormat("dd-MM-yyyy")
                                                .format(pickeddate);
                                      });
                                    }
                                  }),
                                  onSaved: (value) {
                                    fechaValue = DateFormat("MM-dd-yyyy")
                                        .format(DateFormat('dd-MM-yyyy')
                                            .parse(value!));
                                  },
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Llene este campo";
                                    }
                                  }),
                                ),
                                TextFormField(
                                  controller: cargoController,
                                  decoration:
                                      InputDecoration(labelText: "Cargo:"),
                                  onSaved: (value) {
                                    cargoValue = value!;
                                  },
                                  validator: ((value) {
                                    if (value!.isEmpty) {
                                      return "Llene este campo";
                                    }
                                  }),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 7),
                                  child: DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      labelText: "Centro de distribución:",
/*                                           isDense: true,
 */
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 50,
                                    buttonPadding:
                                        const EdgeInsets.only(right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: listacd
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Llene este campo';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      sedeValue = value.toString();
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: ancho * 0.2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50, right: 50),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        _showCapacitacionPage(context);
                                      },
                                      child: Text("Ir a la capacitación ")),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ));
  }

  void _showCapacitacionPage(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      enviarRegistro(cedulaValue, nameValue, fechaValue, cargoValue, sedeValue);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  CapacitacionSeguridad(
            cedula: cedulaValue, cd: sedeValue,
          ),
        ),
      );
    }
  }
}

final List<String> listacd = [
  "Guayaquil CD1: Almacenes",
  "Guayaquil CD2: Distribución",
  "Quito CD Parque Industrial Sur - Guamaní",
  "Babahoyo CD",
  "Milagro CD",
  "Manta CD",
  "Machala CD"
];

/* 

TextDropdownFormField(
                                      options: [
                                        "Guayaquil CD1: Almacenes",
                                        "Guayaquil CD2: Archivo y Distribución",
                                        "Quito CD Parque Industrial Sur - Guamaní"
                                      ],
                                      decoration: InputDecoration(
                                          suffixIcon:
                                              Icon(Icons.arrow_drop_down),
                                          labelText: "Sede:"),
                                      dropdownHeight: 150,
                                      onSaved: (value) {
                                        sedeValue = value!;
                                      },
                                      validator: ((value) {
                                        if (value!.isEmpty) {
                                          return "Llene este campo";
                                        }
                                      }),
                                    ), */