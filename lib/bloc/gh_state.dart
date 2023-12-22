part of 'gh_bloc.dart';

class GHState {
  final String nombre;
  final String apellido;
  final String cedula;
  final String fechaIngreso;
  final String areadetrabajo;
  final String rolAsignado;
  final String cargo;
  final String niveldedotacion;
  final String empresa;
  final String ciudad;
  final String pais;

  GHState(
      {this.nombre = "Freddy",
      this.apellido = "",
      this.cedula = "",
      this.fechaIngreso = "",
      this.areadetrabajo = "",
      this.rolAsignado = "",
      this.cargo = "",
      this.niveldedotacion = "",
      this.empresa = "",
      this.ciudad = "",
      this.pais = ""});
}
