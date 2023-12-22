import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class EppActivo {
  EppActivo({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.cedula,
    required this.fechaCompra,
    required this.fechaRenovar,
    required this.nombreEpp,
    required this.estado,
  });
  int id;
  String nombres;
  String apellidos;
  String cedula;
  DateTime fechaCompra;
  DateTime fechaRenovar;
  String nombreEpp;
  String estado;

  factory EppActivo.fromJson(Map<String, dynamic> map) => EppActivo(
        id: map["ID"],
        nombres: map["Nombres"],
        apellidos: map["Apellido"],
        cedula: map["Cedula"],
        fechaCompra: DateTime.parse(map["FechaCompra"]),
        fechaRenovar: DateTime.parse(map["FechaRenovar"]),
        nombreEpp: map["NombreEpp"],
        estado: map["Estado"],
      );
}

Future<List<EppActivo>> eppActivostotales() async {
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/Eppequiposactivos"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final EppActivoAll =
        responseList.map((project) => EppActivo.fromJson(project)).toList();

    return EppActivoAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<List<EppActivo>> eppActivosInventario({String? query}) async {
  final response = await http.get(Uri.parse(
      "https://ransaapiecuador.azurewebsites.net/EppequiposInventario"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final EppActivoMap =
        responseList.map((project) => EppActivo.fromJson(project)).toList();
    if (query != null) {
      return EppActivoMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return EppActivoMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<List<EppActivo>> eppRenovartotales() async {
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/EppequiposRenovar"));

  //Nombres,Apellido,Cedula,FechaCompra,FechaRenovar,NombreEpp,Renovar

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppActivoAll =
        responseList.map((project) => EppActivo.fromJson(project)).toList();

    return EppActivoAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

//--------------------------------------------------------------------------------------

class EppSinAsignar {
  EppSinAsignar({
    required this.id,
    required this.nombreEpp,
    required this.fechaCompra,
    required this.estado,
    required this.fechainventario,
  });

  int id;
  String nombreEpp;
  DateTime fechaCompra;
  String estado;
  DateTime fechainventario;

  factory EppSinAsignar.fromJson(Map<String, dynamic> map) => EppSinAsignar(
      id: map["ID"],
      nombreEpp: map["NombreEpp"],
      fechaCompra: DateTime.parse(map["FechaCompra"]),
      estado: map["Estado"],
      fechainventario: DateTime.parse(map["FechaenInventario"]));
}

Future<List<EppSinAsignar>> eppEquiposSinAsignar() async {
  final response = await http.get(Uri.parse(
      "https://ransaapiecuador.azurewebsites.net/EppequiposRenovarsinAsignar"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppSinAsignarAll =
        responseList.map((project) => EppSinAsignar.fromJson(project)).toList();

    return EppSinAsignarAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future enviarRenovacion(
  String nombreEpp,
  String estado,
  String cedula,
  String fechaRenovar,
  String fechaDeEntrega,
  String id,
) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/EppequiposUpdateRenovar"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "NombreEpp": nombreEpp,
        "Estado": estado,
        "Cedula": cedula,
        "FechaRenovar": fechaRenovar,
        "FechaDeEntrega": fechaDeEntrega,
        "ID": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

Future enviarRenovacionBaja(
  String estado,
  String fechabaja,
  String id,
) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/EppequiposRenovarBaja"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Estado": estado,
        "Fechabaja": fechabaja,
        "ID": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

Future insertRenovacionNuevoEquipo(
    String nombreepp,
    String fechaCompra,
    String estado,
    String cedula,
    String fechaRenovar,
    String fechaDeEntrega,
    String proveedor) async {
  final response = await http.post(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/insertequiposEpp"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "NombreEpp": nombreepp,
        "FechaCompra": fechaCompra,
        "Estado": estado,
        "Cedula": cedula,
        "FechaRenovar": fechaRenovar,
        "FechaDeEntrega": fechaDeEntrega,
        "Proveedor": proveedor
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

class EppSolicitudList {
  EppSolicitudList({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.cedula,
    required this.fechaCompra,
    required this.fechaDeEntrega,
    required this.nombreEpp,
    required this.estado,
    required this.motivo,
    required this.comentarios,
  });
  int id;
  String nombres;
  String apellidos;
  String cedula;
  DateTime fechaCompra;
  DateTime fechaDeEntrega;
  String nombreEpp;
  String estado;
  String motivo;
  String comentarios;
  factory EppSolicitudList.fromJson(Map<String, dynamic> map) =>
      EppSolicitudList(
        id: map["ID"],
        nombres: map["Nombres"],
        apellidos: map["Apellido"],
        cedula: map["Cedula"],
        fechaCompra: DateTime.parse(map["FechaCompra"]),
        fechaDeEntrega: DateTime.parse(map["FechaDeEntrega"]),
        nombreEpp: map["NombreEpp"],
        estado: map["Estado"],
        motivo: map["Motivo"],
        comentarios: map["Comentarios"],
      );
}

Future<List<EppSolicitudList>> eppSolicitudEppGH() async {
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/SelectGHsolicitud"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE     EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppSolicitudListAll = responseList
        .map((project) => EppSolicitudList.fromJson(project))
        .toList();

    return EppSolicitudListAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future<List<EppSolicitudList>> eppSolicitudEppGHRenovar() async {
  final response = await http.get(Uri.parse(
      "https://ransaapiecuador.azurewebsites.net/SelectGHsolicitudRenovar"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE     EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppSolicitudListAll = responseList
        .map((project) => EppSolicitudList.fromJson(project))
        .toList();

    return EppSolicitudListAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future insertGHsolicitud(String requrimiento, String solicitud, String motivo,
    String fechaSolicitud, String comentarios, String estado, String id) async {
  final response = await http.post(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/InsertGHsolicitud"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Requerimiento": requrimiento,
        "Solicitante": solicitud,
        "Motivo": motivo,
        "Fecha_Solicitud": fechaSolicitud,
        "Comentario": comentarios,
        "Estado": estado,
        "ID_Epp": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

Future actualizarGHsolicitud(
  String tieneSolicitud,
  String estado,
  String comentarios,
  String id,
) async {
  final response = await http.post(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/UpdateGHSolicitud"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "TieneSolicitud": tieneSolicitud,
        "Estado": estado,
        "Comentarios": comentarios,
        "ID": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

Future eppDarDeBaja(
  String tieneSolicitud,
  String estado,
  String fechaBaja,
  String id,
) async {
  final response = await http.post(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/EppDarDeBaja"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "TieneSolicitud": tieneSolicitud,
        "Estado": estado,
        "FechaBaja": fechaBaja,
        "ID": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

class EppSelectFirmaGH {
  EppSelectFirmaGH({
    required this.id,
    required this.nombres,
    required this.apellidos,
    required this.cedula,
    required this.nombreEpp,
    required this.estado,
    required this.firma,
    required this.numeroColaborador,
  });
  int id;
  String nombres;
  String apellidos;
  String cedula;
  String nombreEpp;
  String estado;
  String numeroColaborador;
  String firma;
  factory EppSelectFirmaGH.fromJson(Map<String, dynamic> map) =>
      EppSelectFirmaGH(
        id: map["ID"],
        nombres: map["Nombres"],
        apellidos: map["Apellido"],
        cedula: map["Cedula"],
        nombreEpp: map["NombreEpp"],
        estado: map["Estado"],
        numeroColaborador: map["Numero_Colaborador"],
        firma: map["Firma"],
      );
}

Future<List<EppSelectFirmaGH>> eppSelectFirmaGH() async {
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/SelectGhFirma"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE     EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppSelectFirmaGHAll = responseList
        .map((project) => EppSelectFirmaGH.fromJson(project))
        .toList();

    return EppSelectFirmaGHAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

//InsertActadeEntrega

class EppSelectActadeEntrega {
  EppSelectActadeEntrega(
      {required this.idepp,
      required this.nombres,
      required this.apellidos,
      required this.cedula,
      required this.firma,
      required this.estado,
      required this.epp,
      required this.codigoTrabajador});
  String idepp;
  String nombres;
  String apellidos;
  String cedula;
  String firma;
  String estado;
  String epp;
  String codigoTrabajador;
  factory EppSelectActadeEntrega.fromJson(Map<String, dynamic> map) =>
      EppSelectActadeEntrega(
        idepp: map["ID_epp"],
        nombres: map["Nombre"],
        apellidos: map["Apellidos"],
        cedula: map["Cedula"],
        firma: map["Firma"],
        estado: map["Estado"],
        epp: map["epp"],
        codigoTrabajador: map["CodigoTrabajador"],
      );
}

Future<List<EppSelectActadeEntrega>> eppSelectActadeEntrega() async {
  final response = await http.get(Uri.parse(
      "https://ransaapiecuador.azurewebsites.net/SelectAllActadeEntregaEpp"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE     EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;

    final EppSelectActadeEntregaAll = responseList
        .map((project) => EppSelectActadeEntrega.fromJson(project))
        .toList();

    return EppSelectActadeEntregaAll;
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

class TablasColFaltaFirmaSel {
  TablasColFaltaFirmaSel({
    required this.nombreEpp,
    required this.fechaCompra,
    required this.estado,
    required this.cedula,
    required this.fechaRenovar,
    required this.fechaDeEntrega,
    required this.id,
  });

  String nombreEpp;
  DateTime fechaCompra;
  String estado;
  String cedula;
  DateTime fechaRenovar;
  DateTime fechaDeEntrega;
  int id;

  factory TablasColFaltaFirmaSel.fromJson(Map<String, dynamic> map) =>
      TablasColFaltaFirmaSel(
        nombreEpp: map["NombreEpp"],
        fechaCompra: DateTime.parse(map["FechaCompra"]),
        estado: map["Estado"],
        cedula: map["Cedula"],
        fechaRenovar: DateTime.parse(map["FechaRenovar"]),
        fechaDeEntrega: DateTime.parse(map["FechaDeEntrega"]),
        id: map["ID"],
      );
}

Future<List<TablasColFaltaFirmaSel>> obtenerTablasColFaltaFirmaSel(
    {String? query}) async {
  final response = await http.get(Uri.parse(
      "https://ransaapiecuador.azurewebsites.net/ColFirmaFaltanteCedula"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final TablasColFaltaFirmaSelMap = responseList
        .map((project) => TablasColFaltaFirmaSel.fromJson(project))
        .toList();
    if (query != null) {
      return TablasColFaltaFirmaSelMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return TablasColFaltaFirmaSelMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future insertActadeEntregaEpp(
    String idepp,
    String nombre,
    String apellido,
    String cedula,
    String firma,
    String estado,
    String epp,
    String codigoTrabajador) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/InsertActadeEntregaEpp"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "ID_epp": idepp,
        "Nombre": nombre,
        "Apellidos": apellido,
        "Cedula": cedula,
        "Firma": firma,
        "Estado": estado,
        "epp": epp,
        "CodigoTrabajador": codigoTrabajador,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

Future colactualizarFirma(
  String firma,
  String estado,
  String id,
) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/ColUpdateFirmaFaltanteCedula"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Firma": firma,
        "Estado": estado,
        "ID": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

class TablasColSelectSolicitudEpp {
  TablasColSelectSolicitudEpp({
    required this.id,
    required this.cedula,
    required this.nombreEpp,
    required this.estado,
    required this.motivo,
    required this.tieneSolicitud,
    required this.comentario,
  });

  int id;
  String cedula;
  String nombreEpp;
  String estado;
  String motivo;
  String tieneSolicitud;
  String comentario;

  factory TablasColSelectSolicitudEpp.fromJson(Map<String, dynamic> map) =>
      TablasColSelectSolicitudEpp(
        id: map["ID"],
        cedula: map["Cedula"],
        nombreEpp: map["NombreEpp"],
        estado: map["Estado"],
        motivo: map["Motivo"],
        tieneSolicitud: map["TieneSolicitud"],
        comentario: map["Comentarios"],
      );
}

Future<List<TablasColSelectSolicitudEpp>> obtenerTablasColSelectSolicitudEpp(
    {String? query}) async {
  final response = await http.get(Uri.parse(
      "https://ransaapiecuador.azurewebsites.net/ColSelectSolicitudEpp"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final TablasColSelectSolicitudEppMap = responseList
        .map((project) => TablasColSelectSolicitudEpp.fromJson(project))
        .toList();
    if (query != null) {
      return TablasColSelectSolicitudEppMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return TablasColSelectSolicitudEppMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future colUpdateSolicitudEpp(
  String estado,
  String comentarios,
  String tienesSolicitud,
  String motivo,
  String id,
) async {
  final response = await http.post(
      Uri.parse(
          "https://ransaapiecuador.azurewebsites.net/ColUpdateSolicitudEpp"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Estado": estado,
        "Comentarios": comentarios,
        "TieneSolicitud": tienesSolicitud,
        "Motivo": motivo,
        "ID": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

class ColSelectActivoEpp {
  ColSelectActivoEpp({
    required this.nombreEpp,
    required this.id,
    required this.estado,
    required this.cedula,
    required this.fechaEntrega,
    required this.fechaRenovar,
    required this.firma,
    required this.tieneSolicitud,
  });

  String nombreEpp;
  int id;
  String estado;
  String cedula;
  DateTime fechaEntrega;
  DateTime fechaRenovar;
  String firma;
  String tieneSolicitud;

  factory ColSelectActivoEpp.fromJson(Map<String, dynamic> map) =>
      ColSelectActivoEpp(
        nombreEpp: map["NombreEpp"],
        id: map["ID"],
        estado: map["NombreEpp"],
        cedula: map["Cedula"],
        fechaEntrega: DateTime.parse(map["FechaDeEntrega"]),
        fechaRenovar: DateTime.parse(map["FechaRenovar"]),
        firma: map["Firma"],
        tieneSolicitud: map["TieneSolicitud"],
      );
}

Future<List<ColSelectActivoEpp>> obtenerColSelectActivoEpp(
    {String? query}) async {
  final response = await http.get(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/ColEppActivos"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final ColSelectActivoEppMap = responseList
        .map((project) => ColSelectActivoEpp.fromJson(project))
        .toList();
    if (query != null) {
      return ColSelectActivoEppMap.where((element) =>
          element.cedula.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return ColSelectActivoEppMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future insertColGH(
  String cedula,
  String nombre,
  String apellido,
  String areaTrabajo,
  String fechaIngreso,
  String roles,
  String cargo,
  String claveAcceso,
  String correo,
  String usuario,
  String idEmpresa,
  String fechaCreacion,
  String numeroColaborador,
) async {
  final response = await http.post(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/insertColaborador"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Cedula": cedula,
        "Nombres": nombre,
        "Apellido": apellido,
        "Area_Trabajo": areaTrabajo,
        "Fecha_Ingreso": fechaIngreso,
        "Roles": roles,
        "Cargo": cargo,
        "Clave_Acceso": claveAcceso,
        "Correo": correo,
        "Usuario": usuario,
        "ID_empresa": idEmpresa,
        "Fecha_Creacion": fechaCreacion,
        "Numero_Colaborador": numeroColaborador,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

class GhMatrisEpp {
  GhMatrisEpp({
    required this.id,
    required this.nombre,
    required this.dias,
  });

  int id;
  String nombre;
  int dias;

  factory GhMatrisEpp.fromJson(Map<String, dynamic> map) => GhMatrisEpp(
        id: map["id"],
        nombre: map["nombre"],
        dias: map["diasUtiles"],
      );
}

Future<List<GhMatrisEpp>> obtenerGhMatrisEpp({String? query}) async {
  final response = await http
      .get(Uri.parse("https://ransaapiecuador.azurewebsites.net/GhMatrisEpp"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final GhMatrisEppMap =
        responseList.map((project) => GhMatrisEpp.fromJson(project)).toList();
    if (query != null) {
      return GhMatrisEppMap.where((element) =>
          element.nombre.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return GhMatrisEppMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

class SelectNivelDeAcceso {
  SelectNivelDeAcceso({
    required this.cedula,
    required this.nombre,
    required this.apellido,
    required this.usuario,
    required this.claveAcceso,
    required this.nivelAcceso,
  });

  String cedula;
  String nombre;
  String apellido;
  String usuario;
  String claveAcceso;
  String nivelAcceso;

  factory SelectNivelDeAcceso.fromJson(Map<String, dynamic> map) =>
      SelectNivelDeAcceso(
        cedula: map["Cedula"],
        nombre: map["Nombres"],
        apellido: map["Apellido"],
        usuario: map["Usuario"],
        claveAcceso: map["Clave_Acceso"],
        nivelAcceso: map["NivelAcceso"],
      );
}

Future<List<SelectNivelDeAcceso>> obtenerNivelDeAcceso({String? query}) async {
  final response = await http.get(Uri.parse(
      "https://ransaapiecuador.azurewebsites.net/SelectNivelDeAcceso"));

  if (response.statusCode == 200) {
    //RESPONSE.BODY ME DEVUELVE EL TEXTO LITERAL DE LA CONSULTA
    final responseList = json.decode(response.body) as List;
    final SelectNivelDeAccesoMap = responseList
        .map((project) => SelectNivelDeAcceso.fromJson(project))
        .toList();
    if (query != null) {
      return SelectNivelDeAccesoMap.where((element) =>
          element.nombre.toLowerCase().contains(query.toLowerCase())).toList();
    } else {
      return SelectNivelDeAccesoMap;
    }
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to load post');
  }
}

Future ghUpdateInventario(
  String estado,
  String comentarios,
  String fechaenInventario,
  String id,
) async {
  final response = await http.post(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/GhUpdateInventario"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Estado": estado,
        "Comentarios": comentarios,
        "FechaenInventario": fechaenInventario,
        "ID": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}

Future ghUpdateBaja(
  String estado,
  String comentarios,
  String fechaBaja,
  String motivo,
  String id,
) async {
  final response = await http.post(
      Uri.parse("https://ransaapiecuador.azurewebsites.net/GhUpdateBaja"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "Estado": estado,
        "Comentarios": comentarios,
        "FechaBaja": fechaBaja,
        "Motivo": motivo,
        "ID": id,
      }));

  if (response.statusCode == 200) {
  } else {
    // Si la llamada no fue exitosa, lanza un error.
    throw Exception('Failed to post');
  }
}
