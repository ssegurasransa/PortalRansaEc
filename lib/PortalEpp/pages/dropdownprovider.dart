import 'package:portaltransportistas/PortalEpp/provider/col_registerNew.dart';
import 'package:portaltransportistas/PortalEpp/provider/gh_registerNew.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

class DropdowntextArea extends StatefulWidget {
  const DropdowntextArea({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextArea> createState() => _DropdowntextAreaState();
}

class _DropdowntextAreaState extends State<DropdowntextArea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.areaselected,
                  items: value.areaDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setAreaValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextRol extends StatefulWidget {
  const DropdowntextRol({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextRol> createState() => _DropdowntextRolState();
}

class _DropdowntextRolState extends State<DropdowntextRol> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.rolselected,
                  items: value.rolDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setRolValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextNivel extends StatefulWidget {
  const DropdowntextNivel({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextNivel> createState() => _DropdowntextNivelState();
}

class _DropdowntextNivelState extends State<DropdowntextNivel> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.nivelselected,
                  items: value.nivelDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setNivelValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextEmpresa extends StatefulWidget {
  const DropdowntextEmpresa({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextEmpresa> createState() => _DropdowntextEmpresaState();
}

class _DropdowntextEmpresaState extends State<DropdowntextEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.empresaselected,
                  items: value.empresaDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setEmpresaValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextPais extends StatefulWidget {
  const DropdowntextPais({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextPais> createState() => _DropdowntextPaisState();
}

class _DropdowntextPaisState extends State<DropdowntextPais> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.paisselected,
                  items: value.paisDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setPaisValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextBotas extends StatefulWidget {
  const DropdowntextBotas({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextBotas> createState() => _DropdowntextBotasState();
}

class _DropdowntextBotasState extends State<DropdowntextBotas> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.botasselected,
                  items: value.sinoDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setBotasValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextBotasEstado extends StatefulWidget {
  const DropdowntextBotasEstado({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextBotasEstado> createState() =>
      _DropdowntextBotasEstadoState();
}

class _DropdowntextBotasEstadoState extends State<DropdowntextBotasEstado> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.botasEstado,
                  items: value.estadoEpplist
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setBotasEstado(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextCasco extends StatefulWidget {
  const DropdowntextCasco({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextCasco> createState() => _DropdowntextCascosState();
}

class _DropdowntextCascosState extends State<DropdowntextCasco> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.cascoselected,
                  items: value.sinoDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setCascoValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextCascoEstado extends StatefulWidget {
  const DropdowntextCascoEstado({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextCascoEstado> createState() =>
      _DropdowntextCascoEstadoState();
}

class _DropdowntextCascoEstadoState extends State<DropdowntextCascoEstado> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.cascosEstado,
                  items: value.estadoEpplist
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setCascosEstado(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextCamisetas extends StatefulWidget {
  const DropdowntextCamisetas({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextCamisetas> createState() => _DropdowntextCamisetasState();
}

class _DropdowntextCamisetasState extends State<DropdowntextCamisetas> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.camisetasselected,
                  items: value.sinoDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setCamisetasValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextCamisetasEstado extends StatefulWidget {
  const DropdowntextCamisetasEstado({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextCamisetasEstado> createState() =>
      _DropdowntextCamisetasEstadoState();
}

class _DropdowntextCamisetasEstadoState
    extends State<DropdowntextCamisetasEstado> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.camisetasEstado,
                  items: value.estadoEpplist
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setCamisetasEstado(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextCamisas extends StatefulWidget {
  const DropdowntextCamisas({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextCamisas> createState() => _DropdowntextCamisasState();
}

class _DropdowntextCamisasState extends State<DropdowntextCamisas> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.camisasselected,
                  items: value.sinoDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setCamisasValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextCamisasEstado extends StatefulWidget {
  const DropdowntextCamisasEstado({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextCamisasEstado> createState() =>
      _DropdowntextCamisasEstadoState();
}

class _DropdowntextCamisasEstadoState extends State<DropdowntextCamisasEstado> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.camisasEstado,
                  items: value.estadoEpplist
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setCamisasEstado(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextChaleco extends StatefulWidget {
  const DropdowntextChaleco({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextChaleco> createState() => _DropdowntextChalecoState();
}

class _DropdowntextChalecoState extends State<DropdowntextChaleco> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.chalecoselected,
                  items: value.sinoDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setChalecoValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdowntextChalecoEstado extends StatefulWidget {
  const DropdowntextChalecoEstado({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdowntextChalecoEstado> createState() =>
      _DropdowntextChalecoEstadoState();
}

class _DropdowntextChalecoEstadoState extends State<DropdowntextChalecoEstado> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.chalecosEstado,
                  items: value.estadoEpplist
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setChalecossEstado(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownRenovarEquipo extends StatefulWidget {
  const DropdownRenovarEquipo({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdownRenovarEquipo> createState() => _DropdownRenovarEquipoState();
}

class _DropdownRenovarEquipoState extends State<DropdownRenovarEquipo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<DropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButton<String>(
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  underline: SizedBox(),
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.renovarSelect,
                  items: value.renovarlista
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setrenovarSelect(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropdownColSolicitudMotivo extends StatefulWidget {
  const DropdownColSolicitudMotivo({super.key, required this.titulo});
  final String titulo;
  @override
  State<DropdownColSolicitudMotivo> createState() =>
      _DropdownColSolicitudMotivoState();
}

class _DropdownColSolicitudMotivoState
    extends State<DropdownColSolicitudMotivo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextContainer(
          titulo: widget.titulo,
        ),
        Container(
          child: Consumer<ColDropdownService>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 5),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 300,
                child: DropdownButtonFormField<String>(
                  focusColor: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  isExpanded: true,
                  validator: (value) =>
                      value == null ? 'Llene este campo' : null,
                  dropdownColor: Colors.white,
                  icon: Icon(Icons.arrow_drop_down),
                  value: value.motivoselected,
                  items: value.motivoDropdownList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? v) {
                    value.setMotivoValue(v);
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextContainer extends StatefulWidget {
  const TextContainer({
    super.key,
    required this.titulo,
  });
  final String titulo;

  @override
  State<TextContainer> createState() => _TextContainerState();
}

class _TextContainerState extends State<TextContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: TextWidget(
        text: widget.titulo,
        fontWeight: FontWeight.normal,
        textcolor: Color.fromARGB(255, 110, 110, 110),
        textsize: 16,
        textAlignt: TextAlign.left,
      ),
    );
  }
}
