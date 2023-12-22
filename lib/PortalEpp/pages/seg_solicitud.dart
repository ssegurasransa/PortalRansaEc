import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/widgets/menu_seg.dart';

import '../../widget/separadortitulo.dart';
import '../provider/providerEPP.dart';
import '../widgets/message_input.dart';

class SegSolicitud extends StatefulWidget {
  const SegSolicitud({super.key});

  @override
  State<SegSolicitud> createState() => _SegSolicitudState();
}

class _SegSolicitudState extends State<SegSolicitud> {
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    Future<List<EppSolicitudList>> dataLista = eppSolicitudEppGH();

    return Scaffold(
      body: Row(
        children: [
          const Seg_menu(),
          SingleChildScrollView(
            child: Column(children: [
              Container(
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
                titulo: 'Solicitudes de EPP',
              ),
              Container(
                height: 50,
              ),
              Container(
                width: ancho * 0.8,
                child: Row(
                  children: [
                    Container(width: ancho * 0.05),
                    Container(
                      width: ancho * 0.7,
                      child: FutureBuilder<List<EppSolicitudList>>(
                          future: dataLista,
                          builder: (context, snapshot) {
                            var filterData = snapshot.data;
                            if (snapshot.hasData) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: DataTable(
                                    dataRowMinHeight: 40,
                                    dataRowMaxHeight: 100,
                                    columnSpacing: 20.0,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 194, 194, 194)),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    sortColumnIndex: 0,
                                    showCheckboxColumn: false,
                                    columns: const [
                                      DataColumn(
                                          label: Text("Nombres"),
                                          numeric: false,
                                          tooltip: "Nombres"),
                                      DataColumn(
                                          label: Text("Apellidos"),
                                          numeric: false,
                                          tooltip: "Apellidos"),
                                      DataColumn(
                                          label: Text("Cedula"),
                                          numeric: false,
                                          tooltip: "Cedula"),
                                      DataColumn(
                                          label: Text("Fecha compra"),
                                          numeric: false,
                                          tooltip: "Fecha compra"),
                                      DataColumn(
                                          label: Text("Fecha de entrega"),
                                          numeric: false,
                                          tooltip: "Fecha de entrega"),
                                      DataColumn(
                                          label: Text("EPP"),
                                          numeric: false,
                                          tooltip: "Nombre Epp"),
                                      DataColumn(
                                          label: Text("Estado"),
                                          numeric: false,
                                          tooltip: "Estado"),
                                      DataColumn(
                                          label: Text("Motivo"),
                                          numeric: false,
                                          tooltip: "Motivo"),
                                      DataColumn(
                                          label: Text("Comentarios"),
                                          numeric: false,
                                          tooltip: "Comentarios"),
                                      DataColumn(
                                          label: Text("Aprobar"),
                                          numeric: false,
                                          tooltip: "Aprobar"),
                                      DataColumn(
                                          label: Text("Rechazar"),
                                          numeric: false,
                                          tooltip: "Rechazar"),
                                    ],
                                    rows: filterData!
                                        .map(
                                          (valor) => DataRow(cells: [
                                            DataCell(
                                                Text(valor.nombres.toString())),
                                            DataCell(Text(valor.apellidos)),
                                            DataCell(Text(valor.cedula)),
                                            DataCell(Text(
                                                "${valor.fechaCompra.day}/${valor.fechaCompra.month}/${valor.fechaCompra.year}")),
                                            DataCell(Text(
                                                "${valor.fechaDeEntrega.day}/${valor.fechaDeEntrega.month}/${valor.fechaDeEntrega.year}")),
                                            DataCell(Text(valor.nombreEpp)),
                                            DataCell(Text(valor.estado)),
                                            DataCell(
                                                Text(valor.motivo.toString())),
                                            DataCell(SizedBox(
                                              height: 80,
                                              width: 275,
                                              child: Center(
                                                child: Text(
                                                  valor.comentarios,
                                                  maxLines: 5,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  softWrap: true,
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            )),
                                            DataCell(onTap: () {
                                              mostrarDialogoPendienteEntrega(
                                                  context,
                                                  valor.nombres,
                                                  valor.apellidos,
                                                  valor.cedula,
                                                  valor.fechaCompra,
                                                  valor.fechaDeEntrega,
                                                  valor.nombreEpp,
                                                  valor.estado,
                                                  valor.motivo,
                                                  valor.comentarios,
                                                  valor.id);
                                            },
                                                Icon(
                                                  Icons.check,
                                                  color: Color(0xff009B3A),
                                                )),
                                            DataCell(onTap: () {
                                              mostrarDialogoPendienteEntregaRechazo(
                                                  context,
                                                  valor.nombres,
                                                  valor.apellidos,
                                                  valor.cedula,
                                                  valor.fechaCompra,
                                                  valor.fechaDeEntrega,
                                                  valor.nombreEpp,
                                                  valor.estado,
                                                  valor.motivo,
                                                  valor.comentarios,
                                                  valor.id);
                                            },
                                                Icon(Icons.close_rounded,
                                                    color: Colors.red)),
                                          ]),
                                        )
                                        .toList(),
                                  ),
                                ),
                              );
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return CircularProgressIndicator();
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
