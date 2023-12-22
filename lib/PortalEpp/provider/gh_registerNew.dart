import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String nombre = "Nombre";
  String fecha = "01-01-2023";
  String apellido = "";
  String cedula = "";
  String? areadetrabajo;
  String? rolasignado;
  String cargo = "";
  String? niveldedotacion;
  String? empresa;
  String ciudad = "";
  String? pais;
  String nombreTabla = "Nombre";

  get nombreTablaText {
    return nombreTabla;
  }

  validateForm() {
    if (formKey.currentState!.validate()) {
      print("Funciono");
    } else {
      print("No funciono");
    }
  }
}

class DropdownService with ChangeNotifier {
  String nombreTabla = "Nombre";

  var areaDropdownList = [
    'Almacenes',
    'Distribución ',
    'Administración',
    'Seguridad'
  ];
  var nombreSelect;
  setnombreSelect(value) {
    nombreSelect = value;
    notifyListeners();
  }

  var apellidoSelect;
  setapellidoSelect(value) {
    nombreSelect = value;
    notifyListeners();
  }

  var cedulaSelect;
  setcedulaSelect(value) {
    cedulaSelect = value;
    notifyListeners();
  }

  var cargoSelect;
  setcargoSelect(value) {
    cargoSelect = value;
    notifyListeners();
  }

  var ciudadSelect;
  setciudadSelect(value) {
    ciudadSelect = value;
    notifyListeners();
  }

  var areaselected;
  setAreaValue(value) {
    areaselected = value;
    notifyListeners();
  }

  var rolDropdownList = ['Operario', 'Supervisor'];
  var rolselected;
  setRolValue(value) {
    rolselected = value;
    notifyListeners();
  }

  var nivelDropdownList = [
    'Nivel 1',
    'Nivel 2',
    'Nivel 3',
    'Nivel 4',
    'Nivel 5'
  ];
  var nivelselected;
  setNivelValue(value) {
    nivelselected = value;
    notifyListeners();
  }

  var empresaDropdownList = ['Logiran S.A', 'Transpenac S.A'];
  var empresaselected;
  setEmpresaValue(value) {
    empresaselected = value;
    notifyListeners();
  }

  var paisDropdownList = ['Ecuador'];
  var paisselected;
  setPaisValue(value) {
    paisselected = value;
    notifyListeners();
  }

  var sinoDropdownList = ['Si', 'No'];
  var estadoEpplist = ['Entregado', 'Pendiente'];
  var botasDropdownList = ['Si', 'No'];

  //Botas--------------------------------------------
  var botasselected;
  setBotasValue(value) {
    botasselected = value;
    notifyListeners();
  }

  var botasCantidad;
  setBotasCantidad(value) {
    botasCantidad = value;
    notifyListeners();
  }

  var botasProveedor;
  setBotasProveedor(value) {
    botasProveedor = value;
    notifyListeners();
  }

  var botasEstado;
  var botasfecharenovar;
  var botasfechacompra;
  setbotasfechacompra(value) {
    botasfechacompra = value;
    notifyListeners();
  }

  setbotasfecharenovar(value) {
    botasfecharenovar = value;
    notifyListeners();
  }

  var botasfechaController = TextEditingController();
  setBotasEstado(value) {
    botasEstado = value;
    notifyListeners();
  }

  //Casco-------------

  var cascoselected;
  setCascoValue(value) {
    cascoselected = value;
    notifyListeners();
  }

  var cascosCantidad;
  setCascoCantidad(value) {
    cascosCantidad = value;
    notifyListeners();
  }

  var cascosProveedor;
  setCascoProveedor(value) {
    cascosProveedor = value;
    notifyListeners();
  }

  var cascosEstado;
  var cascosFecharenovar;
  var cascosfechacompra;
  var cascosfechaController = TextEditingController();
  setCascosEstado(value) {
    cascosEstado = value;
    notifyListeners();
  }

  setcascosFecharenovar(value) {
    cascosFecharenovar = value;
    notifyListeners();
  }

  setCascofechacompra(value) {
    cascosfechacompra = value;
    notifyListeners();
  }

  //Camisetas-----------

  var camisetasselected;
  setCamisetasValue(value) {
    camisetasselected = value;
    notifyListeners();
  }

  var camisetasCantidad;
  setCamisetasCantidad(value) {
    camisetasCantidad = value;
    notifyListeners();
  }

  var camisetasProveedor;
  setCamisetasProveedor(value) {
    camisetasProveedor = value;
    notifyListeners();
  }

  var camisetasEstado;
  var camisetasfecharenovar;
  var camisetasfechacompra;
  var camisetasfechaController = TextEditingController();
  setCamisetasEstado(value) {
    camisetasEstado = value;
    notifyListeners();
  }

  setcamisetasfecharenovar(value) {
    camisetasfecharenovar = value;
    notifyListeners();
  }

  setcamisetasfechacompra(value) {
    camisetasfechacompra = value;
    notifyListeners();
  }

//Camisas variable

  var camisasselected;
  setCamisasValue(value) {
    camisasselected = value;
    notifyListeners();
  }

  var camisasCantidad;
  setCamisasCantidad(value) {
    camisasCantidad = value;
    notifyListeners();
  }

  var camisasProveedor;
  setCamisasProveedor(value) {
    camisasProveedor = value;
    notifyListeners();
  }

  var camisasEstado;
  var camisasfechacompra;
  var camisasfecharenovar;
  var camisasfechaController = TextEditingController();
  setCamisasEstado(value) {
    camisasEstado = value;
    notifyListeners();
  }

  setcamisasfecharenovar(value) {
    camisasfecharenovar = value;
    notifyListeners();
  }

  setcamisasfechacompra(value) {
    camisasfechacompra = value;
    notifyListeners();
  }

//Chalecos variables
  var chalecoselected;
  setChalecoValue(value) {
    chalecoselected = value;
    notifyListeners();
  }

  var chalecosCantidad;
  setChalecossCanitdad(value) {
    chalecosCantidad = value;
    notifyListeners();
  }

  var chalecosProveedor;
  setChalecosProveedor(value) {
    chalecosProveedor = value;
    notifyListeners();
  }

  var chalecosfechacompra;
  var chalecosfechaController = TextEditingController();

  var fechacompraA;
  var fechaControllerA = TextEditingController();

  var fechaEntrega;
  var fechaEntregaController = TextEditingController();

  var chalecosEstado;
  setChalecossEstado(value) {
    chalecosEstado = value;
    notifyListeners();
  }

  setchalecosfechacompra(value) {
    chalecosfechacompra = value;
    notifyListeners();
  }

  var chalecosfecharenovar;
  setchalecosfecharenovar(value) {
    chalecosfecharenovar = value;
    notifyListeners();
  }

  var renovarlista = ['Asignar de inventario', 'Asignar nuevo equipo'];
  var renovarSelect;
  setrenovarSelect(value) {
    renovarSelect = value;
    notifyListeners();
  }
}

class VariablesExt extends ChangeNotifier {
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
