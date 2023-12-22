import 'dart:convert';

import 'package:lottie/lottie.dart';
import 'package:portaltransportistas/PortalEpp/pages/col_home.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_home.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_registrarEPP.dart';
import 'package:portaltransportistas/PortalEpp/pages/gh_mostrarActaEntrega.dart';
import 'package:portaltransportistas/PortalEpp/pages/seg_home.dart';
import 'package:portaltransportistas/PortalEpp/widgets/campo_string.dart';
import 'package:portaltransportistas/pdf/pdf_service.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../pages/gh_renovar.dart';
import '../pages/gh_solicitudEPP.dart';
import '../provider/gh_registerNew.dart';
import '../provider/providerEPP.dart';

Future<void> mostrarDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return Consumer<DropdownService>(builder: (context, value, child) {
        return AlertDialog(
          // <-- SEE HERE
          title: const Text(
            'REGISTRO EPP',
            style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(""),
                Text(
                    'Estas seguro/a de registrar este usuario, se le asignara los siguientes recursos:'),
                if (value.botasselected == "Si")
                  Text("${value.botasCantidad} Botas"),
                if (value.cascoselected == "Si")
                  Text("${value.cascosCantidad} Casco"),
                if (value.camisetasselected == "Si")
                  Text("${value.camisetasCantidad} Camisetas"),
                if (value.camisasselected == "Si")
                  Text("${value.camisasCantidad} Camisas"),
                if (value.chalecoselected == "Si")
                  Text("${value.chalecosCantidad} Chalecos")
              ],
            ),
          ),

          actions: <Widget>[
            TextButton(
              child: const Text('Rechazar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                if (value.botasselected == "Si") {
                  insertRenovacionNuevoEquipo(
                      "Botas",
                      value.botasfechacompra,
                      "vigente",
                      value.cedulaSelect,
                      value.botasfecharenovar,
                      value.botasfechacompra,
                      value.botasProveedor);
                }
                if (value.cascoselected == "Si") {
                  insertRenovacionNuevoEquipo(
                      "Casco",
                      value.cascosfechacompra,
                      "vigente",
                      value.cedulaSelect,
                      value.cascosFecharenovar,
                      value.cascosfechacompra,
                      value.cascosProveedor);
                }

                if (value.camisetasselected == "Si") {
                  insertRenovacionNuevoEquipo(
                      "Camisetas",
                      value.camisetasfechacompra,
                      "vigente",
                      value.cedulaSelect,
                      value.camisetasfecharenovar,
                      value.camisetasfechacompra,
                      value.camisetasProveedor);
                }
                if (value.camisasselected == "Si") {
                  insertRenovacionNuevoEquipo(
                      "Camisas",
                      value.cascosfechacompra,
                      "vigente",
                      value.cedulaSelect,
                      value.cascosFecharenovar,
                      value.cascosfechacompra,
                      value.cascosProveedor);
                }
                if (value.chalecoselected == "Si") {
                  insertRenovacionNuevoEquipo(
                      "Chalecos",
                      value.chalecosfechacompra,
                      "vigente",
                      value.cedulaSelect,
                      value.chalecosfecharenovar,
                      value.chalecosfechacompra,
                      value.chalecosProveedor);
                }
                enviadoCorrectamente(
                    context, "EPP registrado con exito", Gh_home());
              },
            ),
          ],
        );
      });
    },
  );
}

Future<void> mostrarDialogRenovar(context) async {
  final now = new DateTime.now();
  final datainventario = Provider.of<DropdownService>(context, listen: false);

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text(
          'REGISTRO EPP',
          style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
        ),
        content: Consumer<VariablesExt>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(""),
                Text(
                    'Estas seguro/a de registrar ${value.nombres}, se le asignara los siguientes recursos:'),
                Text("${value.epp}"),
              ],
            ),
          );
        }),
        actions: <Widget>[
          TextButton(
            child: const Text('Rechazar'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Consumer<VariablesExt>(builder: (context, value, child) {
            return TextButton(
              child: const Text('Aceptar'),
              onPressed: () {
                enviadoCorrectamente(
                    context, "Registro EPP exitoso", GhRenovarequipo());
                //Actualizar registro
                datainventario.renovarSelect == 'Asignar de inventario'
                    ? {
                        enviadoCorrectamente(
                            context, "REGISTRO EPP", GhRenovarequipo())
/*                   enviarRenovacion(value.epp,"vigente",value.cedula,value.fechaCompra,value.fechaEntrega,value.id),
                  enviarRenovacionBaja("Baja",DateFormat('yMd').format(now),value.idInic),
                  print("Asignar de inventario") */
                      }
                    : {
                        enviadoCorrectamente(
                            context, "REGISTRO EPP", GhRenovarequipo())

                        //Insertar nuevos registros
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
                      };

                Navigator.of(context).pop();
              },
            );
          }),
        ],
      );
    },
  );
}

Future<void> mostrarDialogoPendienteEntrega(context, nombre, apellido, cedula,
    fechacompra, fechaEntrega, epp, estado, motivo, comentarios, id) async {
  final now = new DateTime.now();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text(
          'REGISTRO EPP',
          style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(""),
              Text(
                  'Estas seguro/a de aprobar la solicitud de renovación de  ${nombre} ${apellido},'),
              Text(""),
              Text("Por motivos de: ${comentarios}"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              insertGHsolicitud(epp, cedula, motivo, fechaEntrega.toString(),
                  comentarios, "Rechazado", id.toString());
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Si'),
            onPressed: () {
              insertGHsolicitud(epp, cedula, motivo, fechaEntrega.toString(),
                  comentarios, "aprobado", id.toString());
              actualizarGHsolicitud("", "Renovar", comentarios, id.toString());
              enviadoCorrectamente(
                  context, "Solicitud EPP exitosa", Seg_home());

              //Insertar nuevos registros
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
            },
          )
        ],
      );
    },
  );
}

Future<void> mostrarDialogoEntregaRealizada(context, nombre, apellido, cedula,
    fechacompra, fechaEntrega, epp, estado, motivo, comentarios, id) async {
  final _formKey = GlobalKey<FormState>();
  String fechavalue = "";
  TextEditingController fechaController = TextEditingController();
  TextEditingController proveedorController = TextEditingController();
  final now = new DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  int eppDias = 0;

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      double ancho = MediaQuery.of(context).size.width;
      double alto = MediaQuery.of(context).size.height;

      return Form(
        key: _formKey,
        child: AlertDialog(
          // <-- SEE HERE
          title: const Text(
            'Se va a generar una nueva entrega:',
            style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    "$nombre $apellido se le asignara un/as $epp, llene la siguiente información: ",
                    style:
                        TextStyle(color: Color.fromARGB(255, 110, 110, 110))),
                const Text("llene la siguiente información: ",
                    style:
                        TextStyle(color: Color.fromARGB(255, 110, 110, 110))),
                Container(
                  height: alto * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: ancho * 0.2,
                        child: FechaCampo(fechavalue, fechaController)),
                  ],
                ),
                Container(
                  height: 0,
                  width: 0,
                  child: FutureBuilder(
                    future: obtenerGhMatrisEpp(),
                    builder:
                        (context, AsyncSnapshot<List<GhMatrisEpp>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // Muestra un indicador de carga mientras espera el resultado
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        // Muestra un mensaje de error si hay un error
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else {
                        List<GhMatrisEpp> datos = snapshot.requireData;
                        if (epp == 'Casco') {
                          eppDias = datos[0].dias;
                        }
                        if (epp == 'Camisas') {
                          eppDias = datos[1].dias;
                        }
                        if (epp == 'Camisetas') {
                          eppDias = datos[2].dias;
                        }
                        if (epp == 'Botas') {
                          eppDias = datos[3].dias;
                        }
                        if (epp == 'Chalecos') {
                          eppDias = datos[4].dias;
                        }

                        return Container();
                      }
                    },
                  ),
                ),
                Container(
                  height: alto * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: ancho * 0.2,
                        child: CampoTexto("Proveedor:", proveedorController)),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Actualizar'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  DateTime fecha = DateTime.parse(fechaController.text);

                  insertRenovacionNuevoEquipo(
                      epp,
                      fechaController.text,
                      "Falta Firmar",
                      cedula,
                      DateFormat("yyyy-MM-dd")
                          .format(fecha.add(Duration(days: eppDias))),
                      formattedDate,
                      proveedorController.text);
                  eppDarDeBaja("", "Baja", formattedDate, id.toString());
                  enviadoCorrectamente(
                      context, "Solicitud EPP exitosa", GhSolicitudEPPState());
                }

                //Insertar nuevos registros
                /*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                    print("Nuevo recurso") */
              },
            ),
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    },
  );
}

Future<void> mostrarDialogoPendienteEntregaRechazo(
    context,
    nombre,
    apellido,
    cedula,
    fechacompra,
    fechaEntrega,
    epp,
    estado,
    motivo,
    comentarios,
    id) async {
  final now = new DateTime.now();

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text(
          'REGISTRO EPP',
          style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(""),
              Text(
                  'Estas seguro/a de rechazar la solicitud de renovación de  ${nombre} ${apellido},'),
              Text(""),
              Text("Por motivos de: ${comentarios}"),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('No'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Si'),
            onPressed: () {
              insertGHsolicitud(epp, cedula, motivo, fechaEntrega.toString(),
                  comentarios, "rechazado", id.toString());
              actualizarGHsolicitud("", estado, "", id.toString());
              enviadoCorrectamente(context, "Solicitud Rechazada con exito",
                  GhSolicitudEPPState());

              //Insertar nuevos registros
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
            },
          )
        ],
      );
    },
  );
}

Future<void> enviadoCorrectamente(context, titulo, pagina) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: Text(
          titulo,
          style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
        ),
        content: Consumer<VariablesExt>(builder: (context, value, child) {
          return SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => pagina,
                        ),
                      );
                    },
                    child: Lottie.asset('assets/Aceptar.json',
                        repeat: false,
                        height: 250,
                        width: 250,
                        fit: BoxFit.cover)),
              ],
            ),
          );
        }),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'Aceptar',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => pagina,
                ),
              );
              //Actualizar registro
            },
          )
        ],
      );
    },
  );
}

Future<void> mostrarDocumentoActEntrega(
    context, nombre, apellido, numero, epp, cedula, firma) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE

        content:
            GhMostrarActEntrega(nombre, apellido, numero, epp, cedula, firma),
        actions: <Widget>[
          TextButton(
            child: const Text('Descargar'),
            onPressed: () {
              print("object");
              PdfService().printCustomersPdf(
                  firma, nombre, apellido, numero, epp, cedula);
            },
          ),
          TextButton(
            child: const Text('Volver'),
            onPressed: () {
              Navigator.of(context).pop();
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
            },
          )
        ],
      );
    },
  );
}

Future<void> colFirmaDocumentoActEntrega(
    context, nombre, apellido, numero, epp, cedula, firma, id) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        content:
            GhMostrarActEntrega(nombre, apellido, numero, epp, cedula, firma),
        actions: <Widget>[
          if (firma == "")
            TextButton(
              child: const Text(
                'Firmar',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showSecond(context, nombre, apellido, numero, epp, cedula, id);
              },
            ),
          if (firma != "")
            TextButton(
              child: const Text(
                'Enviar',
                style: TextStyle(fontSize: 20),
              ),
              //Actualizar la informacion a SQL
              onPressed: () {
                colactualizarFirma("Si", "vigente", id.toString());
                insertActadeEntregaEpp(id.toString(), nombre, apellido, cedula,
                    firma, "ingresado", epp, numero);
                enviadoCorrectamente(
                    context, "Epp firmado con exito", ColHome());
              },
            ),
          TextButton(
            child: const Text(
              'Volver',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pop();
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
            },
          )
        ],
      );
    },
  );
}

Future showSecond(
    BuildContext context, nombre, apellido, numero, epp, cedula, id) {
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();

  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text("Firmar"),
      content: Container(
          height: 300,
          width: 600,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: SfSignaturePad(
              key: signatureGlobalKey,
              backgroundColor: Colors.white,
              strokeColor: Colors.black,
              minimumStrokeWidth: 1.0,
              maximumStrokeWidth: 4.0)),
      actions: [
        TextButton(
          onPressed: () async {
            final data =
                await signatureGlobalKey.currentState!.toImage(pixelRatio: 3.0);
            final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
            final base64String = base64Encode(bytes!.buffer.asUint8List());
            colFirmaDocumentoActEntrega(context, nombre, apellido, numero, epp,
                cedula, base64String, id);
          },
          child: const Text('Firmar'),
        ),
      ],
    ),
  );
}

Future<void> mostrarMensajeEnviado(context, cedula, nombre, apellido, numero,
    fecha, correo, ciudad, cargo) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Consumer<DropdownService>(
          builder: (context, value, child) {
            return AlertDialog(
              // <-- SEE HERE
              title: const Text(
                'REGISTRO DE COLABORADOR',
                style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(""),
                    Text(
                        'Se va a registrar al usuario ${nombre.text} ${apellido.text} con la cedula ${cedula.text} con el cargo de ${cargo.text}.'),
                  ],
                ),
              ),

              actions: <Widget>[
                TextButton(
                  child: const Text('Aceptar'),
                  onPressed: () {
                    print(
                      DateTime.now().toString(),
                    );
                    print(cedula.text);
                    print(nombre.text);
                    print(apellido.text);
                    print(value.areaselected);
                    print(fecha.text);
                    print(value.rolselected);
                    print(cargo.text);
                    print(correo.text);
                    print(numero.text);
                    insertColGH(
                        cedula.text,
                        nombre.text,
                        apellido.text,
                        value.areaselected,
                        fecha.text,
                        value.rolselected,
                        cargo.text,
                        cedula.text,
                        correo.text,
                        cedula.text,
                        "1",
                        DateTime.now().toString(),
                        numero.text);
                    enviadoCorrectamente(
                        context, "Envio exitoso", GhRegistrarEpp());
                  },
                ),
                TextButton(
                  child: const Text('Cancelar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
}

Future<void> mostrarInventariooBaja(
    context, nombre, apellido, numero, epp, cedula, id) async {
  final now = new DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(now);
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        // <-- SEE HERE
        title: const Text(
          "Estatus del EPP",
          style: TextStyle(color: Color(0xff009B3A), fontSize: 30),
        ),
        content: Text("Desea cambiar "),
        actions: <Widget>[
          TextButton(
            child: const Text('Dar de Baja'),
            onPressed: () {
              ghUpdateBaja('Baja', '', formattedDate, '', id);
              enviadoCorrectamente(
                  context, "Se ha dado de baja Correctamente", Gh_home());
            },
          ),
          TextButton(
            child: const Text('Mantar a Inventario'),
            onPressed: () {
              ghUpdateInventario("Inventario", "", formattedDate, id);
              enviadoCorrectamente(
                  context, "Se ha enviado a Inventario", Gh_home());
            },
          ),
          TextButton(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.of(context).pop();
/*                   insertRenovacionNuevoEquipo(value.epp,value.fechaCompra,"Vigente",value.cedula,value.fechaRenovar),
                  print("Nuevo recurso") */
            },
          )
        ],
      );
    },
  );
}
