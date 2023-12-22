import 'dart:js';

import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../provider/gh_registerNew.dart';
import '../provider/providerEPP.dart';

SingleChildScrollView tablaActivo(List<EppActivo>? data) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 194, 194, 194)),
            borderRadius: BorderRadius.circular(10)),
        sortColumnIndex: 0,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text("Nombres"), numeric: false, tooltip: "Nombre"),
          DataColumn(
              label: Text("Apellidos"), numeric: false, tooltip: "Apellidos"),
          DataColumn(label: Text("Cedula"), numeric: false, tooltip: "Cedula"),
          DataColumn(
              label: Text("Fecha Compra"),
              numeric: false,
              tooltip: "Fecha compra"),
          DataColumn(
              label: Text("Fecha Renovar"),
              numeric: false,
              tooltip: "Fecha renovar"),
          DataColumn(label: Text("EPP"), numeric: false, tooltip: "EPP"),
          DataColumn(label: Text("Estado"), numeric: false, tooltip: "Estado"),
        ],
        rows: data!
            .map(
              (valor) => DataRow(cells: [
                DataCell(Text(valor.nombres)),
                DataCell(Text(valor.apellidos)),
                DataCell(Text(valor.cedula)),
                DataCell(Text(valor.fechaCompra.day.toString() +
                    "/" +
                    valor.fechaCompra.month.toString() +
                    "/" +
                    valor.fechaCompra.year.toString())),
                DataCell(Text(valor.fechaRenovar.day.toString() +
                    "/" +
                    valor.fechaRenovar.month.toString() +
                    "/" +
                    valor.fechaRenovar.year.toString())),
                DataCell(Text(valor.nombreEpp)),
                DataCell(EstadosEpp(valor.estado)),
              ]),
            )
            .toList(),
      ),
    ),
  );
}

EstadosEpp(estado) {
  if (estado == "vigente") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            color: Colors.green,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("vigente"));
  }
  if (estado == "Renovar") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(
            color: Colors.orange,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Renovar"));
  }
  if (estado == "Falta Firmar") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.red,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Falta Firmar"));
  }
  if (estado == "Solicitud") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          border: Border.all(
            color: Colors.red,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Solicitud"));
  }
  if (estado == "") {
    return Container(child: Text(""));
  } else {
    return Text("");
  }
}

String cantidadLista(List<EppActivo>? data) {
  return ("${data?.length}");
}

// ignore: must_be_immutable
class TablaRenovar extends StatefulWidget {
  late List<EppActivo>? data;
  TablaRenovar({super.key, required this.data});

  @override
  State<TablaRenovar> createState() => _TablaRenovarState();
}

String verdad = "";

class _TablaRenovarState extends State<TablaRenovar> {
  @override
  Widget build(BuildContext context) {
    final variables = Provider.of<VariablesExt>(context, listen: true);

    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: DataTable(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 194, 194, 194)),
                  borderRadius: BorderRadius.circular(10)),
              sortColumnIndex: 0,
              showCheckboxColumn: false,
              columns: const [
                DataColumn(label: Text("ID"), numeric: true, tooltip: "Id"),
                DataColumn(
                    label: Text("Nombres"), numeric: false, tooltip: "Nombre"),
                DataColumn(
                    label: Text("Apellidos"),
                    numeric: false,
                    tooltip: "Apellidos"),
                DataColumn(
                    label: Text("Cedula"), numeric: false, tooltip: "Cedula"),
                DataColumn(
                    label: Text("Fecha Compra"),
                    numeric: false,
                    tooltip: "Fecha compra"),
                DataColumn(
                    label: Text("Fecha Renovar"),
                    numeric: false,
                    tooltip: "Fecha renovar"),
                DataColumn(label: Text("EPP"), numeric: false, tooltip: "EPP"),
                DataColumn(
                    label: Text("Estado"), numeric: false, tooltip: "Estado"),
              ],
              rows: widget.data!
                  .map(
                    (valor) => DataRow(
                        selected: variables.selectEpp.contains(valor),
                        onSelectChanged: (isSelected) {
                          setState(() {
                            final isAdding = isSelected != null && isSelected;
                            if (variables.selectEpp.length >= 1 && isAdding) {
                              variables.selectEpp.clear();
                              isAdding
                                  ? {
                                      variables.selectEpp.add(valor),
                                      variables.nombresfun =
                                          valor.nombres.toString(),
                                      variables.apellidofun =
                                          valor.apellidos.toString(),
                                      variables.eppfun =
                                          valor.nombreEpp.toString(),
                                      variables.idInicfun = valor.id.toString(),
                                      variables.cedulafun =
                                          valor.cedula.toString(),
                                    }
                                  : variables.selectEpp.remove(valor);
                            } else {
                              isAdding
                                  ? {
                                      variables.selectEpp.add(valor),
                                      variables.nombresfun =
                                          valor.nombres.toString(),
                                      variables.apellidofun =
                                          valor.apellidos.toString(),
                                      variables.eppfun =
                                          valor.nombreEpp.toString(),
                                      variables.idInicfun = valor.id.toString(),
                                      variables.cedulafun =
                                          valor.cedula.toString(),
                                    }
                                  : variables.selectEpp.remove(valor);
                            }
                          });
                        },
                        cells: [
                          DataCell(Text(valor.id.toString())),
                          DataCell(Text(valor.nombres)),
                          DataCell(Text(valor.apellidos)),
                          DataCell(Text(valor.cedula)),
                          DataCell(Text(valor.fechaCompra.day.toString() +
                              "/" +
                              valor.fechaCompra.month.toString() +
                              "/" +
                              valor.fechaCompra.year.toString())),
                          DataCell(Text(valor.fechaRenovar.day.toString() +
                              "/" +
                              valor.fechaRenovar.month.toString() +
                              "/" +
                              valor.fechaRenovar.year.toString())),
                          DataCell(Text(valor.nombreEpp)),
                          DataCell(EstadosEpp(valor.estado)),
                        ]),
                  )
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class TablaEppSinAsignar extends StatefulWidget {
  late List<EppSinAsignar>? data;

  TablaEppSinAsignar({super.key, required this.data});

  @override
  State<TablaEppSinAsignar> createState() => _TablaEppSinAsignarState();
}

List selectEpp = [];

class _TablaEppSinAsignarState extends State<TablaEppSinAsignar> {
  @override
  Widget build(BuildContext context) {
    final variables = Provider.of<VariablesExt>(context, listen: false);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DataTable(
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 194, 194, 194)),
              borderRadius: BorderRadius.circular(10)),
          sortColumnIndex: 0,
          showCheckboxColumn: false,
          columns: const [
            DataColumn(label: Text("ID"), numeric: false, tooltip: "ID"),
            DataColumn(
                label: Text("Nombre EPP"),
                numeric: false,
                tooltip: "Nombre EPP"),
            DataColumn(
                label: Text("Fecha Compra"),
                numeric: false,
                tooltip: "Fecha Compra"),
            DataColumn(
                label: Text("Estado"), numeric: false, tooltip: "Estado"),
            DataColumn(
                label: Text("Fecha en inventario"),
                numeric: false,
                tooltip: "Fecha en inventario"),
          ],
          rows: widget.data!
              .map(
                (valor) => DataRow(
                    selected: selectEpp.contains(valor),
                    onSelectChanged: (isSelected) => setState(() {
                          final isAdding = isSelected != null && isSelected;
                          if (selectEpp.length >= 1) {
                            selectEpp.clear();
                            isAdding
                                ? {
                                    selectEpp.add(valor),
                                    variables.idfun = valor.id.toString(),
                                    variables.fechaComprafun =
                                        valor.fechaCompra.day.toString() +
                                            "/" +
                                            valor.fechaCompra.month.toString() +
                                            "/" +
                                            valor.fechaCompra.year.toString(),
                                  }
                                : selectEpp.remove(valor);
                          } else {
                            isAdding
                                ? {
                                    selectEpp.add(valor),
                                    variables.idfun = valor.id.toString(),
                                    variables.fechaComprafun =
                                        "${valor.fechaCompra.day}/${valor.fechaCompra.month}/${valor.fechaCompra.year}",
                                  }
                                : selectEpp.remove(valor);
                          }
                        }),
                    cells: [
                      DataCell(Text(valor.id.toString())),
                      DataCell(Text(valor.nombreEpp)),
                      DataCell(Text(
                          "${valor.fechaCompra.day}/${valor.fechaCompra.month}/${valor.fechaCompra.year}")),
                      DataCell(Text(valor.estado)),
                      DataCell(Text(
                          "${valor.fechainventario.day}/${valor.fechainventario.month}/${valor.fechainventario.year}")),
                    ]),
              )
              .toList(),
        ),
      ),
    );
  }
}
