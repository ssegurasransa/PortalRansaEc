import 'package:flutter/material.dart';

import '../api/provider.dart';

SingleChildScrollView tablaBody(List<ProjectList>? data) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortColumnIndex: 0,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text("Nombre"), numeric: false, tooltip: "Nombre"),
          DataColumn(label: Text("Cedula"), numeric: false, tooltip: "Cedula"),
          DataColumn(
              label: Text("Documento IEES"), numeric: false, tooltip: "Estado"),
          DataColumn(
              label: Text("Posee Antecedente"),
              numeric: false,
              tooltip: "Antecedente"),
          DataColumn(
              label: Text("Examen seguridad"),
              numeric: false,
              tooltip: "Seguridad"),
          DataColumn(
              label: Text("Razon social"),
              numeric: false,
              tooltip: "Razon social"),
          DataColumn(
              label: Text("Fecha doc"),
              numeric: false,
              tooltip: "Fecha documentacion"),
          DataColumn(
              label: Text("Fecha sub"),
              numeric: false,
              tooltip: "Fecha subida"),
          DataColumn(
              label: Text("Comentario"), numeric: false, tooltip: "Comentario"),
        ],
        rows: data!
            .map(
              (valor) => DataRow(cells: [
                DataCell(Text(valor.nombre)),
                DataCell(Text(valor.cedula)),
                DataCell(EstadoDocumentacionIEES(valor.estado)),
                DataCell(EstadoAntecedentes(valor.antedentes)),
                DataCell(EstadoSeguridad(valor.examenseguridad)),
                DataCell(Text(valor.razonSocial)),
                DataCell(Text(valor.fechaDeDocumentacion.day.toString() +
                    "/" +
                    valor.fechaDeDocumentacion.month.toString() +
                    "/" +
                    valor.fechaDeDocumentacion.year.toString())),
                DataCell(Text(valor.fechaHoraSistema.day.toString() +
                    "/" +
                    valor.fechaHoraSistema.month.toString() +
                    "/" +
                    valor.fechaHoraSistema.year.toString())),
                DataCell(Text(valor.comentario)),
              ]),
            )
            .toList(),
      ),
    ),
  );
}

EstadoSeguridad(examenSeguridad) {
  if (examenSeguridad == "Aprobado") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            color: Colors.green,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Aprobado"));
  }
  if (examenSeguridad == "") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.red,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Sin realizar"));
    ;
  }
}

EstadoAntecedentes(antecedentes) {
  if (antecedentes == "No") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            color: Colors.green,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("No"));
  }
  if (antecedentes == "Si") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.red,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Si"));
    ;
  }
  if (antecedentes == "") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(
            color: Colors.orange,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Sin registro"));
    ;
  }
}

EstadoDocumentacionIEES(documentacionIees) {
  if (documentacionIees == "Activo") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(
            color: Colors.green,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Aprobado"));
  }
  if (documentacionIees == "Caducado") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.red,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Caducado"));
    ;
  }
  if (documentacionIees == "") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.orange,
          border: Border.all(
            color: Colors.orange,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Sin registro"));
    ;
  }
}
