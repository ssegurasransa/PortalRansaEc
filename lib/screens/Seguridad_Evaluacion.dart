import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portaltransportistas/screens/Seguridad_gracias.dart';

import '../api/provider.dart';

class EvaluacionDataPersonal extends StatefulWidget {
  const EvaluacionDataPersonal({super.key, required this.cedula,required this.cd});
  final String cedula;
  final String cd;

  @override
  State<EvaluacionDataPersonal> createState() => _EvaluacionDataPersonalState();
}

class _EvaluacionDataPersonalState extends State<EvaluacionDataPersonal> {
  late String nameValue;
  final nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  late String respuesta1;
  late String respuesta2;
  late String respuesta3;
  late String respuesta4;
  late String respuesta5;
  late String respuesta6;
  late String respuesta7;
  late String respuesta8;
  late String respuesta9;
  late String respuesta10;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    bool isDesktop(BuildContext context) =>
        MediaQuery.of(context).size.width >= 800;
    bool isMobile(BuildContext context) =>
        MediaQuery.of(context).size.width < 800;

    return Scaffold(
      appBar: AppBar(
        title: Text("Inducción de seguridad Ransa ${widget.cd}"),
        actions: [
          IconButton(
            icon: Image.asset('assets/Logo_Ransa_Blanco.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
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
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              //---------------------------------------------------
                              //Pregunta1------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "1.- ¿Qué equipo de protección personal debo utilizar al ingresar a las operaciones?",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta1
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta1 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),

                              //Pregunta2------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "2.- La siguiente señalética es de tipo:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image(
                                      image:
                                          AssetImage('assets/SeguridadPG2.jpg'),
                                      height: 140,
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta2
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta2 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta2---------------------

                              //Pregunta3------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "3.- ¿Puedo hacer uso de mi equipo celular en almacén sin problema?",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta3
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta3 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta3---------------------

                              //Pregunta4------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "4.- El Riesgo es",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta4
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta4 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta4---------------------

                              //Pregunta5------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "5.- La condición subestándar o insegura es:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta5
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta5 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta5---------------------

                              //Pregunta6------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "6.- El accidente es:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta6
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta6 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta6---------------------

                              //Pregunta7------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "7.- Postura forzada, esfuerzo, manipulación de cargas y movimiento repetitivo, se relaciona con el riesgo:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta7
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta7 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta7---------------------

                              //Pregunta8------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "8.- La siguiente señalética hace referencia al Riesgo:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image(
                                      image:
                                          AssetImage('assets/SeguridadPG8.jpg'),
                                      height: 140,
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta8
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta8 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta8---------------------

                              //Pregunta9------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "9.- Seleccione un trabajo considerado como riesgo especial:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta9
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta9 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta9---------------------

                              //Pregunta10------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "10.- Seleccione una de las prohibiciones al ingreso a las instalaciones de Ransa:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta10
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta10 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta10---------------------

                              const SizedBox(height: 30),

                              TextButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    /*  print(
                                        "$respuesta1,$respuesta2,$respuesta3,$respuesta4,$respuesta5,$respuesta6,$respuesta7,$respuesta8,$respuesta9,$respuesta10");
 */
                                    await enviarEvaluacion(
                                      respuesta1,
                                      respuesta2,
                                      respuesta3,
                                      respuesta4,
                                      respuesta5,
                                      respuesta6,
                                      respuesta7,
                                      respuesta8,
                                      respuesta9,
                                      respuesta10,
                                      FechaActual(),
                                      //Estado
                                      CalcularRespuesta(
                                          respuesta1,
                                          respuesta2,
                                          respuesta3,
                                          respuesta4,
                                          respuesta5,
                                          respuesta6,
                                          respuesta7,
                                          respuesta8,
                                          respuesta9,
                                          respuesta10)[1],
                                      //Calificacion
                                      CalcularRespuesta(
                                          respuesta1,
                                          respuesta2,
                                          respuesta3,
                                          respuesta4,
                                          respuesta5,
                                          respuesta6,
                                          respuesta7,
                                          respuesta8,
                                          respuesta9,
                                          respuesta10)[0],
                                          CondicionalCD3(widget.cd),

                                      widget.cedula,
                                    );

                                    /* Navigator.of(context).pushNamed(
                                            "/CapacitacionSeguridad"); */
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GraciasPantalla(
                                          cedula: widget.cedula,
                                          resultado: CalcularRespuesta(
                                              respuesta1,
                                              respuesta2,
                                              respuesta3,
                                              respuesta4,
                                              respuesta5,
                                              respuesta6,
                                              respuesta7,
                                              respuesta8,
                                              respuesta9,
                                              respuesta10)[0],
                                          puntuacion: CalcularRespuesta(
                                              respuesta1,
                                              respuesta2,
                                              respuesta3,
                                              respuesta4,
                                              respuesta5,
                                              respuesta6,
                                              respuesta7,
                                              respuesta8,
                                              respuesta9,
                                              respuesta10)[1], cd: widget.cd,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Terminar evaluación',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
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

          //--------------------------------------------------------

          //-------------------Version Mobil----------------------

          //--------------------------------------------------------
          if (isMobile(context))
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              //---------------------------------------------------
                              //Pregunta1------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Container(
                                      child: Text(
                                        "1.- ¿Qué equipo de protección personal debo utilizar al ingresar a las operaciones?",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta1
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta1 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),

                              //Pregunta2------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "2.- La siguiente señalética es de tipo:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image(
                                      image:
                                          AssetImage('assets/SeguridadPG2.jpg'),
                                      height: 140,
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta2
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta2 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta2---------------------

                              //Pregunta3------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "3.- ¿Puedo hacer uso de mi equipo celular en almacén sin problema?",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta3
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta3 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta3---------------------

                              //Pregunta4------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "4.- El Riesgo es",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta4
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta4 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta4---------------------

                              //Pregunta5------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "5.- La condición subestándar o insegura es:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta5
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta5 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta5---------------------

                              //Pregunta6------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "6.- El accidente es:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta6
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta6 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta6---------------------

                              //Pregunta7------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "7.- Postura forzada, esfuerzo, manipulación de cargas y movimiento repetitivo, se relaciona con el riesgo:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta7
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta7 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta7---------------------

                              //Pregunta8------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "8.- La siguiente señalética hace referencia al Riesgo:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Image(
                                      image:
                                          AssetImage('assets/SeguridadPG8.jpg'),
                                      height: 140,
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta8
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta8 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta8---------------------

                              //Pregunta9------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "9.- Seleccione un trabajo considerado como riesgo especial:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta9
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta9 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta9---------------------

                              //Pregunta10------------------------------------------
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        child: Text(
                                          "10.- Seleccione una de las prohibiciones al ingreso a las instalaciones de Ransa:",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ),
                                    ),
                                  ),
                                  DropdownButtonFormField2(
                                    decoration: InputDecoration(
                                      isDense: true,
                                      contentPadding: EdgeInsets.zero,
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    isExpanded: true,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.black45,
                                    ),
                                    iconSize: 30,
                                    buttonHeight: 60,
                                    buttonPadding: const EdgeInsets.only(
                                        left: 20, right: 10),
                                    dropdownDecoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    items: pregunta10
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
                                        return 'Falta de ingresar la respuesta a esta pregunta';
                                      }
                                    },
                                    onChanged: (value) {},
                                    onSaved: (value) {
                                      respuesta10 = value.toString();
                                    },
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                              //Pregunta10---------------------

                              const SizedBox(height: 30),
                              TextButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    /*  print(
                                        "$respuesta1,$respuesta2,$respuesta3,$respuesta4,$respuesta5,$respuesta6,$respuesta7,$respuesta8,$respuesta9,$respuesta10");
 */
                                    await enviarEvaluacion(
                                      respuesta1,
                                      respuesta2,
                                      respuesta3,
                                      respuesta4,
                                      respuesta5,
                                      respuesta6,
                                      respuesta7,
                                      respuesta8,
                                      respuesta9,
                                      respuesta10,
                                      FechaActual(),
                                      //Estado
                                      CalcularRespuesta(
                                          respuesta1,
                                          respuesta2,
                                          respuesta3,
                                          respuesta4,
                                          respuesta5,
                                          respuesta6,
                                          respuesta7,
                                          respuesta8,
                                          respuesta9,
                                          respuesta10)[1],
                                      //Calificacion
                                      CalcularRespuesta(
                                          respuesta1,
                                          respuesta2,
                                          respuesta3,
                                          respuesta4,
                                          respuesta5,
                                          respuesta6,
                                          respuesta7,
                                          respuesta8,
                                          respuesta9,
                                          respuesta10)[0],
                                          CondicionalCD3(widget.cd),
                                      widget.cedula,
                                    );

                                    /* Navigator.of(context).pushNamed(
                                            "/CapacitacionSeguridad"); */
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => GraciasPantalla(
                                          cedula: widget.cedula,
                                          resultado: CalcularRespuesta(
                                              respuesta1,
                                              respuesta2,
                                              respuesta3,
                                              respuesta4,
                                              respuesta5,
                                              respuesta6,
                                              respuesta7,
                                              respuesta8,
                                              respuesta9,
                                              respuesta10)[0],
                                          puntuacion: CalcularRespuesta(
                                              respuesta1,
                                              respuesta2,
                                              respuesta3,
                                              respuesta4,
                                              respuesta5,
                                              respuesta6,
                                              respuesta7,
                                              respuesta8,
                                              respuesta9,
                                              respuesta10)[1], cd: widget.cd,
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: const Text(
                                  'Terminar evaluación',
                                  style: TextStyle(fontSize: 25),
                                ),
                              ),
                              const SizedBox(height: 60),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
/* 
  void _showCapacitacionPage(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.of(context).pushNamed("/CapacitacionSeguridad");
    }
  } */
}

String FechaActual() {
  String formattedDate = DateFormat('MM-dd-yyyy').format(DateTime.now());

  return formattedDate;
}
String CondicionalCD3(cd) {
  String valor;
  if (cd=='Babahoyo CD' || cd=='Milagro CD' || cd=='Manta CD' || cd=='Machala CD'){
    valor="No";}
    else {
      valor="Si";
    }
  return valor;


  

  
}
List CalcularRespuesta(
    res1, res2, res3, res4, res5, res6, res7, res8, res9, res10) {
  var contador = 0;
  String stringValue;
  String estado;
  if (res1 ==
      'Calzado de seguridad + chaleco o ropa reflectiva + casco + mascarilla') {
    contador += 1;
  }
  if (res2 == 'Prohibición') {
    contador += 1;
  }
  if (res3 == 'Falso') {
    contador += 1;
  }
  if (res4 ==
      'Probabilidad de que un peligro se materialice en determinadas condiciones y genere daños a las personas, equipos y al ambiente') {
    contador += 1;
  }
  if (res5 ==
      'Es toda condición en el entorno del trabajo que puede causar un accidente') {
    contador += 1;
  }
  if (res6 ==
      'Todo suceso repentino que sobrevenga por causa o con ocasión del trabajo y que produzca en el trabajador una lesión orgánica, una perturbación funcional, una invalidez o la muerte.') {
    contador += 1;
  }
  if (res7 == 'Físico') {
    contador += 1;
  }
  if (res8 == 'Mecánico') {
    contador += 1;
  }
  if (res9 == 'Trabajos en altura') {
    contador += 1;
  }
  if (res10 == 'Prohibido el ingreso y consumo de alimentos') {
    contador += 1;
  }

  if (contador >= 7) {
    estado = "Aprobado";
    stringValue = contador.toString();
  } else {
    estado = "denegado";
    stringValue = contador.toString();
  }
/*   print("$estado,$stringValue"); */

  return [estado, stringValue];
}

final List<String> pregunta1 = [
  'Calzado de seguridad + cofia',
  'Calzado de seguridad + chaleco o ropa reflectiva + casco + mascarilla',
  'Ninguno'
];

final List<String> pregunta2 = ['Advertencia', 'Prohibición', 'Ninguno'];

final List<String> pregunta3 = [
  'Verdadero',
  'Falso',
];

final List<String> pregunta4 = [
  'Situación o característica intrínseca de algo capaz de ocasionar daños a las personas, equipos, procesos y ambiente.',
  'Probabilidad de que un peligro se materialice en determinadas condiciones y genere daños a las personas, equipos y al ambiente',
  'Ninguna'
];

final List<String> pregunta5 = [
  'Es toda condición en el entorno del trabajo que puede causar un accidente',
  'Todas las actividades que causan accidentes de trabajo',
  'Ninguna'
];
final List<String> pregunta6 = [
  'Suceso repentino que no trae afectaciones a la salud de los trabajadores',
  'Todo suceso repentino que sobrevenga por causa o con ocasión del trabajo y que produzca en el trabajador una lesión orgánica, una perturbación funcional, una invalidez o la muerte.',
  'Ninguna'
];
final List<String> pregunta7 = ['Físico', 'Químico', 'Ninguna'];
final List<String> pregunta8 = ['Ergonómico', 'Mecánico', 'Psicosocial'];
final List<String> pregunta9 = ['Estiba', 'Trabajos en altura', 'Limpieza'];
final List<String> pregunta10 = [
  'Prohibido mantener reuniones',
  'Prohibido el ingreso y consumo de alimentos',
  'Ninguna'
];








/* 
                                      TextFormField(
                                        decoration: InputDecoration(
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 20,
                                          ),
                                          hintText: 'Enter Your Full Name.',
                                          hintStyle:
                                              const TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                      ), */