import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ColDropdownService with ChangeNotifier {
  var motivoDropdownList = ['Incidencia', 'Deterioro', 'Robo'];
  var motivoselected;
  setMotivoValue(value) {
    motivoselected = value;
    notifyListeners();
  }
}

class ColVariables with ChangeNotifier {
  String _idInic = "";
  String _nombres = "";
  get idInic {
    return _idInic;
  }

  set idInicfun(String idInic) {
    _idInic = idInic;
    notifyListeners();
  }

  get nombres {
    return _nombres;
  }

  set nombresfun(String nombres) {
    _nombres = nombres;
    notifyListeners();
  }
}

class VariablesExtCol extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  List _selectEpp = [];
  String _idInic = "";
  String _nombres = "";
  String _apellido = "";
  String _epp = "";
  String _id = "";
  String _fechaCompra = "";
  String _fechaEntrega = "";
  String _fechaRenovar = "";
  String _cedula = "";

  var fechacompraA;
  var fechaControllerA = TextEditingController();

  var fechaEntregaA;
  var fechaEntregaController = TextEditingController();

  get selectEpp {
    return _selectEpp;
  }

  set selectEppfun(List selectEpp) {
    this._selectEpp = selectEpp;
    notifyListeners();
  }

  get idInic {
    return _idInic;
  }

  set idInicfun(String idInic) {
    this._idInic = idInic;
    notifyListeners();
  }

  get nombres {
    return _nombres;
  }

  set nombresfun(String nombres) {
    this._nombres = nombres;
    notifyListeners();
  }

  get apellido {
    return _apellido;
  }

  set apellidofun(String apellido) {
    this._apellido = apellido;
    notifyListeners();
  }

  get epp {
    return _epp;
  }

  set eppfun(String epp) {
    this._epp = epp;
    notifyListeners();
  }

  get id {
    return _id;
  }

  set idfun(String id) {
    this._id = id;
    notifyListeners();
  }

  get fechaCompra {
    return _fechaCompra;
  }

  set fechaComprafun(String fechaCompra) {
    this._fechaCompra = fechaCompra;
    notifyListeners();
  }

  get fechaEntrega {
    return _fechaEntrega;
  }

  set fechaEntregafun(String fechaEntrega) {
    this._fechaEntrega = fechaEntrega;
    notifyListeners();
  }

  get fechaRenovar {
    return _fechaRenovar;
  }

  set fechaRenovarfun(String fechaRenovar) {
    this._fechaEntrega = fechaRenovar;
    notifyListeners();
  }

  get cedula {
    return _cedula;
  }

  set cedulafun(String cedula) {
    this._cedula = cedula;
    notifyListeners();
  }
}
