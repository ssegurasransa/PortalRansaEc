import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portaltransportistas/PortalEpp/pages/dropdownprovider.dart';
import 'package:portaltransportistas/PortalEpp/widgets/campo_fecha.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_gh.dart';
import 'package:portaltransportistas/PortalEpp/widgets/message_input.dart';
import 'package:portaltransportistas/PortalEpp/widgets/text_widget.dart';
import 'package:portaltransportistas/widget/separadortitulo.dart';

class Gh_AgregarCol extends StatefulWidget {
  const Gh_AgregarCol({super.key});

  @override
  State<Gh_AgregarCol> createState() => _Gh_AgregarColState();
}

class _Gh_AgregarColState extends State<Gh_AgregarCol> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Row(children: [
      Gh_menu(),
      SingleChildScrollView(
          child: SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
            SizedBox(
              width: ancho * 0.8,
              height: 100,
              child: const Align(
                alignment: Alignment.topRight,
                child: Image(
                    image: AssetImage('assets/Logo_Ransa.png'), height: 140),
              ),
            ),
            Container(
              height: 50,
            ),
            SeparadorTitulo(
              titulo: 'Crear colaborador',
            ),
            Container(
              height: 50,
            ),
            Row(
              children: [
                Container(
                  width: ancho * 0.05,
                ),
                MyForm(),
              ],
            )
          ])))
    ]));
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  String fechavalue = "";
  TextEditingController _cedulaController = TextEditingController();
  TextEditingController _nombreController = TextEditingController();
  TextEditingController _apellidoController = TextEditingController();
  TextEditingController _numTrabajadorController = TextEditingController();
  TextEditingController _fechaIngresoController = TextEditingController();
  TextEditingController _correoController = TextEditingController();
  TextEditingController _cargoController = TextEditingController();
  TextEditingController _ciudadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;

    return Form(
      key: _formKey,
      child: Container(
        width: ancho * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                FormInput(context, "Cédula", _cedulaController),
                Container(
                  width: ancho * 0.02,
                ),
                FormInput(context, "Nombre", _nombreController),
                Container(
                  width: ancho * 0.02,
                ),
                FormInput(context, "Apellido", _apellidoController),
              ],
            ),
            Container(
              height: alto * 0.03,
            ),
            Row(
              children: [
                FormInput(context, "Número", _numTrabajadorController),
                Container(
                  width: ancho * 0.02,
                ),
                FechaCampo(fechavalue, _fechaIngresoController),
                Container(
                  width: ancho * 0.02,
                ),
                FormInput(context, "Correo", _correoController),
              ],
            ),
            Container(
              height: alto * 0.03,
            ),
            Row(
              children: [
                DropdowntextEmpresa(
                  titulo: 'Empresa',
                ),
                Container(
                  width: ancho * 0.02,
                ),
                DropdowntextPais(
                  titulo: 'Pais',
                ),
                Container(
                  width: ancho * 0.02,
                ),
                FormInput(context, "Ciudad", _ciudadController),
              ],
            ),
            Container(
              height: alto * 0.03,
            ),
            Row(
              children: [
                FormInput(context, "Cargo", _cargoController),
                Container(
                  width: ancho * 0.02,
                ),
                DropdowntextArea(
                  titulo: 'Area de trabajo',
                ),
                Container(
                  width: ancho * 0.02,
                ),
                DropdowntextRol(
                  titulo: 'Area asignado',
                ),
              ],
            ),
            Container(
              height: alto * 0.06,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    mostrarMensajeEnviado(
                        context,
                        _cedulaController,
                        _nombreController,
                        _apellidoController,
                        _numTrabajadorController,
                        _fechaIngresoController,
                        _correoController,
                        _ciudadController,
                        _cargoController);
                  }
                },
                child: Text(
                  'Guardar',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container FormInput(context, titleinput, varController) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return Container(
      width: 300,
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
            controller: varController,
            validator: (value) {
              if (value == null || value.isEmpty) return "Llene este campo";
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
        ],
      ),
    );
  }
}
