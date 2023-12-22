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
          DataColumn(label: Text("Cédula"), numeric: false, tooltip: "Cédula"),
          DataColumn(
              label: Text("Documento IEES"), numeric: false, tooltip: "Estado"),
          DataColumn(
              label: Text("Antecedente"),
              numeric: false,
              tooltip: "Antecedente"),
          DataColumn(
              label: Text("Examen de seguridad"),
              numeric: false,
              tooltip: "Seguridad"),
          DataColumn(
              label: Text("razón social"),
              numeric: false,
              tooltip: "razón social"),
          DataColumn(
              label: Text("Fecha doc"),
              numeric: false,
              tooltip: "Fecha documentación"),
          DataColumn(
              label: Text("Fecha sub"),
              numeric: false,
              tooltip: "Fecha subida"),
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
              ]),
            )
            .toList(),
      ),
    ),
  );
}

SingleChildScrollView tablaBodyAll(List<ProjectListAll>? data) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortColumnIndex: 0,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text("Nombre"), numeric: false, tooltip: "Nombre"),
          DataColumn(label: Text("Cédula"), numeric: false, tooltip: "Cédula"),
          DataColumn(
              label: Text("Documento IEES"), numeric: false, tooltip: "Estado"),
          DataColumn(
              label: Text("Antecedente"),
              numeric: false,
              tooltip: "Antecedente"),
          DataColumn(
              label: Text("Examen de seguridad"),
              numeric: false,
              tooltip: "Seguridad"),
          DataColumn(
              label: Text("Razón social"),
              numeric: false,
              tooltip: "Razón social"),
          DataColumn(
              label: Text("Fecha doc"),
              numeric: false,
              tooltip: "Fecha documentacion"),
          DataColumn(
              label: Text("Fecha sub"),
              numeric: false,
              tooltip: "Fecha subida"),
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
              ]),
            )
            .toList(),
      ),
    ),
  );
}

SingleChildScrollView tablaBodyAllCD3(List? data) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortColumnIndex: 0,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text("Cedula"), numeric: false, tooltip: "Cedula"),
          DataColumn(label: Text("Nombre"), numeric: false, tooltip: "Nombre"),
          DataColumn(
              label: Text("Fecha"),
              numeric: false,
              tooltip: "Fecha en que realizo el examen"),
          DataColumn(
              label: Text("Examen de Seguridad"),
              numeric: false,
              tooltip: "Estado"),
          DataColumn(
              label: Text("Antecedentes"),
              numeric: false,
              tooltip: "Antecedentes"),
        ],
        rows: data!
            .map(
              (valor) => DataRow(cells: [
                DataCell(Text(valor.cedula)),
                DataCell(Text(valor.nombre)),
                DataCell(Text(
                    "${valor.fecha.day}/${valor.fecha.month}/${valor.fecha.year}")),
                DataCell(EstadoSeguridad(valor.estado)),
                DataCell(EstadoAntecedentesCD3(valor.antedentes)),
              ]),
            )
            .toList(),
      ),
    ),
  );
}

SingleChildScrollView tablaBodyConsultaQuito(List<TablasQuitoConsulta>? data) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: DataTable(
        sortColumnIndex: 0,
        showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text("Cedula"), numeric: false, tooltip: "Cedula"),
          DataColumn(label: Text("Nombre"), numeric: false, tooltip: "Nombre"),
          DataColumn(
              label: Text("Fecha"),
              numeric: false,
              tooltip: "Fecha en que realizo el examen"),
          DataColumn(label: Text("Estado"), numeric: false, tooltip: "Estado"),
          DataColumn(
              label: Text("Antecedentes"),
              numeric: false,
              tooltip: "Antecedentes"),
          DataColumn(
              label: Text("Comentarios"),
              numeric: false,
              tooltip: "Comentarios"),
        ],
        rows: data!
            .map(
              (valor) => DataRow(cells: [
                DataCell(Text(valor.cedula)),
                DataCell(Text(valor.nombre)),
                DataCell(Text(
                    "${valor.fecha.day}/${valor.fecha.month}/${valor.fecha.year}")),
                DataCell(EstadoSeguridad(valor.estado)),
                DataCell(EstadoAntecedentesCD3(valor.antedentes)),
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
  if (documentacionIees == "Expirado") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.red,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Expirado"));
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

EstadoAntecedentesCD3(antecedentes) {
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
  }
  if (antecedentes == "Error Consulta") {
    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
            color: Colors.red,
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Error consulta"));
  }

  if (antecedentes == "") {
    return Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 0, 26, 255),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 26, 255),
            width: 8,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text("Revisando.."));
  }
}
