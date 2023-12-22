import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portaltransportistas/PortalEpp/provider/gh_registerNew.dart';
import 'package:portaltransportistas/PortalEpp/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class CampoTexto extends StatefulWidget {
  dynamic titleinput;
  dynamic varController;
  CampoTexto(this.titleinput, this.varController, {super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            child: TextWidget(
              text: widget.titleinput,
              fontWeight: FontWeight.normal,
              textcolor: Color.fromARGB(255, 110, 110, 110),
              textsize: 16,
              textAlignt: TextAlign.left,
            ),
          ),
        ),
        Container(
          height: 3,
        ),
        TextFormField(
          controller: widget.varController,
          validator: (value) {
            if (value == null || value.isEmpty) return "Llene este campo";
            return null;
          },
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
      ],
    );
    ;
  }
}

class FechaCampo extends StatefulWidget {
  dynamic fechavalue;
  dynamic fechaController;
  FechaCampo(this.fechavalue, this.fechaController, {super.key});

  @override
  State<FechaCampo> createState() => _FechaCampoState();
}

class _FechaCampoState extends State<FechaCampo> {
  @override
  Widget build(BuildContext context) {
    final datainventario = Provider.of<VariablesExt>(context, listen: false);

    return Column(
      children: [
        Row(
          children: [
            TextWidget(
              text: "Fecha de compra:",
              fontWeight: FontWeight.normal,
              textcolor: Color.fromARGB(255, 110, 110, 110),
              textsize: 16,
              textAlignt: TextAlign.left,
            ),
          ],
        ),
        Container(
          height: 3,
        ),
        Container(
          child: DateForm(context, widget.fechavalue, widget.fechaController),
          width: 300,
        ),
      ],
    );
  }

  TextFormField DateForm(BuildContext context, fechavalue, fechaControler) {
    return TextFormField(
      onChanged: (value) => fechavalue = value,
      controller: fechaControler,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onTap: (() async {
        DateTime? pickeddate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100));
        if (pickeddate != null) {
          setState(() {
            fechaControler.text = DateFormat("yyyy-MM-dd").format(pickeddate);
          });
        }
      }),
      onSaved: (value) {
        fechavalue = DateFormat("yyyy-MM-dd")
            .format(DateFormat('yyyy-MM-dd').parse(value!));
      },
      validator: ((value) {
        if (value!.isEmpty) {
          return "Llene este campo";
        }
      }),
    );
  }
}
