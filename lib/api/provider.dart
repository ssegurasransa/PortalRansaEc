import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ProjectList {
  ProjectList(
      {required this.nombre,
      required this.cedula,
      required this.razonSocial,
      this.ruc,
      this.nombreDelEmpleador,
      this.ciudad,
      required this.fechaDeDocumentacion,
      required this.fechaHoraSistema,
      this.tipoDeNovedad,
      this.cargo,
      required this.estado,
      required this.antedentes,
      required this.comentario,
      required this.examenseguridad});

  String nombre;
  String cedula;
  String razonSocial;
  String? ruc;
  String? nombreDelEmpleador;
  String? ciudad;
  DateTime fechaDeDocumentacion;
  DateTime fechaHoraSistema;
  String? tipoDeNovedad;
  String? cargo;
  String estado;
  String antedentes;
  String comentario;
  String examenseguridad;

  factory ProjectList.fromJson(Map<String, dynamic> map) => ProjectList(
        nombre: map["Nombre"],
        cedula: map["Cedula"],
        razonSocial: map["Razon_Social"],
        ruc: map["RUC"],
        nombreDelEmpleador: map["Nombre_del_Empleador"],
        ciudad: map["Ciudad"],
        fechaDeDocumentacion: DateTime.parse(map["Fecha_de_documentacion"]),
        fechaHoraSistema: DateTime.parse(map["Fecha_hora_sistema"]),
        tipoDeNovedad: map["Tipo_de_novedad"],
        cargo: map["Cargo"],
        estado: map["Estado"],
        antedentes: map["Antedentes"],
        comentario: map["Comentario"],
        examenseguridad: map["Examen_seguridad"],
      );
}

Future<List<ProjectList>> obtenerSeguros({String? query}) async {
  final response =
      await http.get(Uri.parse("https://ransaapiecuador.azurewebsites.net/"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final ProjectMap =
        responseList.map((project) => ProjectList.fromJson(project)).toList();
    if (query != null) {
      return ProjectMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return ProjectMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

//---------------------Quito-----------------

class TablasQuito {
  TablasQuito({
    required this.cedula,
    required this.nombre,
    required this.fecha,
    required this.estado,
    required this.antedentes,
    required this.comentario,
  });

  String cedula;
  String nombre;
  DateTime fecha;
  String estado;
  String antedentes;
  String comentario;

  factory TablasQuito.fromJson(Map<String, dynamic> map) => TablasQuito(
        cedula: map["cedula"],
        nombre: map["nombre"],
        fecha: DateTime.parse(map["fecha"]),
        estado: map["estado"],
        antedentes: map["Antedentes"],
        comentario: map["Comentario"],
      );
}

Future<List<TablasQuito>> obtenerTablasQuito({String? query}) async {
  final response = await http
      .get(Uri.parse("https://ransaapiecuador.azurewebsites.net/ingresoQuito"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final TablasQuitoMap =
        responseList.map((project) => TablasQuito.fromJson(project)).toList();
    if (query != null) {
      return TablasQuitoMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return TablasQuitoMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

class TablasQuitoConsulta {
  TablasQuitoConsulta({
    required this.cedula,
    required this.nombre,
    required this.fecha,
    required this.estado,
    required this.antedentes,
    required this.comentario,
  });

  String cedula;
  String nombre;
  DateTime fecha;
  String estado;
  String antedentes;
  String comentario;

  factory TablasQuitoConsulta.fromJson(Map<String, dynamic> map) =>
      TablasQuitoConsulta(
        cedula: map["cedula"],
        nombre: map["nombre"],
        fecha: DateTime.parse(map["fecha"]),
        estado: map["estado"],
        antedentes: map["Antedentes"],
        comentario: map["Comentario"],
      );
}

Future<List<TablasQuitoConsulta>> obtenerTablasQuitoConsulta(
    {String? query}) async {
  final response = await http
      .get(Uri.parse("https://ransaapiecuador.azurewebsites.net/ingresoQuito"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final TablasQuitoConsultaMap = responseList
        .map((project) => TablasQuitoConsulta.fromJson(project))
        .toList();
    if (query != null) {
      return TablasQuitoConsultaMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return TablasQuitoConsultaMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

//------------------------Manta-------------------------

class TablasMantaConsulta {
  TablasMantaConsulta({
    required this.cedula,
    required this.nombre,
    required this.fecha,
    required this.estado,
    required this.antedentes,
    required this.comentario,
  });

  String cedula;
  String nombre;
  DateTime fecha;
  String estado;
  String antedentes;
  String comentario;

  factory TablasMantaConsulta.fromJson(Map<String, dynamic> map) =>
      TablasMantaConsulta(
        cedula: map["cedula"],
        nombre: map["nombre"],
        fecha: DateTime.parse(map["fecha"]),
        estado: map["estado"],
        antedentes: map["Antedentes"],
        comentario: map["Comentario"],
      );
}

Future<List<TablasMantaConsulta>> obtenerTablasMantaConsulta(
    {String? query}) async {
  final response = await http
      .get(Uri.parse("https://ransaapiecuador.azurewebsites.net/ingresoManta"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final TablasMantaConsultaMap = responseList
        .map((project) => TablasMantaConsulta.fromJson(project))
        .toList();
    if (query != null) {
      return TablasMantaConsultaMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return TablasMantaConsultaMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

//---------------Babahoyo-------------
class TablasBabahoyoConsulta {
  TablasBabahoyoConsulta({
    required this.cedula,
    required this.nombre,
    required this.fecha,
    required this.estado,
    required this.antedentes,
    required this.comentario,
  });

  String cedula;
  String nombre;
  DateTime fecha;
  String estado;
  String antedentes;
  String comentario;

  factory TablasBabahoyoConsulta.fromJson(Map<String, dynamic> map) =>
      TablasBabahoyoConsulta(
        cedula: map["cedula"],
        nombre: map["nombre"],
        fecha: DateTime.parse(map["fecha"]),
        estado: map["estado"],
        antedentes: map["Antedentes"],
        comentario: map["Comentario"],
      );
}

Future<List<TablasBabahoyoConsulta>> obtenerTablasBabahoyoConsulta(
    {String? query}) async {
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/ingresoBabahoyo"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final TablasBabahoyoConsultaMap = responseList
        .map((project) => TablasBabahoyoConsulta.fromJson(project))
        .toList();
    if (query != null) {
      return TablasBabahoyoConsultaMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return TablasBabahoyoConsultaMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

//---------------------Machala---------------------
class TablasMachalaConsulta {
  TablasMachalaConsulta({
    required this.cedula,
    required this.nombre,
    required this.fecha,
    required this.estado,
    required this.antedentes,
    required this.comentario,
  });

  String cedula;
  String nombre;
  DateTime fecha;
  String estado;
  String antedentes;
  String comentario;

  factory TablasMachalaConsulta.fromJson(Map<String, dynamic> map) =>
      TablasMachalaConsulta(
        cedula: map["cedula"],
        nombre: map["nombre"],
        fecha: DateTime.parse(map["fecha"]),
        estado: map["estado"],
        antedentes: map["Antedentes"],
        comentario: map["Comentario"],
      );
}

Future<List<TablasMachalaConsulta>> obtenerTablasMachalaConsulta(
    {String? query}) async {
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/ingresoMachala"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final TablasMachalaConsultaMap = responseList
        .map((project) => TablasMachalaConsulta.fromJson(project))
        .toList();
    if (query != null) {
      return TablasMachalaConsultaMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return TablasMachalaConsultaMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

class TablasMilagroConsulta {
  TablasMilagroConsulta({
    required this.cedula,
    required this.nombre,
    required this.fecha,
    required this.estado,
    required this.antedentes,
    required this.comentario,
  });

  String cedula;
  String nombre;
  DateTime fecha;
  String estado;
  String antedentes;
  String comentario;

  factory TablasMilagroConsulta.fromJson(Map<String, dynamic> map) =>
      TablasMilagroConsulta(
        cedula: map["cedula"],
        nombre: map["nombre"],
        fecha: DateTime.parse(map["fecha"]),
        estado: map["estado"],
        antedentes: map["Antedentes"],
        comentario: map["Comentario"],
      );
}

Future<List<TablasMilagroConsulta>> obtenerTablasMilagroConsulta(
    {String? query}) async {
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/ingresoMilagro"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final TablasMilagroConsultaMap = responseList
        .map((project) => TablasMilagroConsulta.fromJson(project))
        .toList();
    if (query != null) {
      return TablasMilagroConsultaMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return TablasMilagroConsultaMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future enviarEvaluacion(
    String respuesta1,
    String respuesta2,
    String respuesta3,
    String respuesta4,
    String respuesta5,
    String respuesta6,
    String respuesta7,
    String respuesta8,
    String respuesta9,
    String respuesta10,
    String fechaIngreso,
    String calificacion,
    String estado,
    String consultaAntecedentes,
    String cedula) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/actualizacionseguridad"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "pregunta1": respuesta1,
        "pregunta2": respuesta2,
        "pregunta3": respuesta3,
        "pregunta4": respuesta4,
        "pregunta5": respuesta5,
        "pregunta6": respuesta6,
        "pregunta7": respuesta7,
        "pregunta8": respuesta8,
        "pregunta9": respuesta9,
        "pregunta10": respuesta10,
        "fechaIngreso": fechaIngreso,
        "calificacion": calificacion,
        "estado": estado,
        "consultaAntecedentes": consultaAntecedentes,
        "cedula": cedula
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

Future enviarRegistro(
  String cedula,
  String nombre,
  String fecha,
  String cargo,
  String cd,
) async {
  final response = await http.post(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/insertseguridad"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "cedula": cedula,
        "nombre": nombre,
        "fecha": fecha,
        "cargo": cargo,
        "cd": cd,
      }));

  if (response.statusCode == 200) {
    print("Ingreso exitoso");
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    print("Error");
    throw Exception('Failed to post');
  }
}

/* Future enviarEvaluacion2() async {
  final response =
      await http.post(Uri.parse("http://10.132.38.29:8080/evaluacion"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            "pregunta1": "respuesta1",
            "pregunta2": "respuesta2",
            "pregunta3": "respuesta3",
            "pregunta4": "respuesta4",
            "pregunta5": "respuesta5",
            "pregunta6": "respuesta6",
            "pregunta7": "respuesta7",
            "pregunta8": "respuesta8",
            "pregunta9": "respuesta9",
            "pregunta10": "respuesta10"
          }));

  if (response.statusCode == 200) {
    print("Subida correctamente");
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
} */

class ProjectListAll {
  ProjectListAll(
      {required this.nombre,
      required this.cedula,
      required this.razonSocial,
      this.ruc,
      this.nombreDelEmpleador,
      this.ciudad,
      required this.fechaDeDocumentacion,
      required this.fechaHoraSistema,
      this.tipoDeNovedad,
      this.cargo,
      required this.estado,
      required this.antedentes,
      required this.comentario,
      required this.examenseguridad});

  String nombre;
  String cedula;
  String razonSocial;
  String? ruc;
  String? nombreDelEmpleador;
  String? ciudad;
  DateTime fechaDeDocumentacion;
  DateTime fechaHoraSistema;
  String? tipoDeNovedad;
  String? cargo;
  String estado;
  String antedentes;
  String comentario;
  String examenseguridad;

  factory ProjectListAll.fromJson(Map<String, dynamic> map) => ProjectListAll(
        nombre: map["Nombre"],
        cedula: map["Cedula"],
        razonSocial: map["Razon_Social"],
        ruc: map["RUC"],
        nombreDelEmpleador: map["Nombre_del_Empleador"],
        ciudad: map["Ciudad"],
        fechaDeDocumentacion: DateTime.parse(map["Fecha_de_documentacion"]),
        fechaHoraSistema: DateTime.parse(map["Fecha_hora_sistema"]),
        tipoDeNovedad: map["Tipo_de_novedad"],
        cargo: map["Cargo"],
        estado: map["Estado"],
        antedentes: map["Antedentes"],
        comentario: map["Comentario"],
        examenseguridad: map["Examen_seguridad"],
      );
}

Future<List<ProjectListAll>> obtenerSegurosTotales() async {
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/ConsultaPrincipal"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    print(responseList);
    final ProjectMapAll = responseList
        .map((project) => ProjectListAll.fromJson(project))
        .toList();
    return ProjectMapAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}
