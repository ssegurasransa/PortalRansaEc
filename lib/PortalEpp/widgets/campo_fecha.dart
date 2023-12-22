import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portaltransportistas/PortalEpp/widgets/text_widget.dart';

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
    return Column(
      children: [
        Container(
          width: 300,
          child: TextWidget(
            text: "Fecha:",
            fontWeight: FontWeight.normal,
            textcolor: Color.fromARGB(255, 110, 110, 110),
            textsize: 16,
            textAlignt: TextAlign.left,
          ),
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
