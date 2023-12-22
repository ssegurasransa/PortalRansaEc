import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:portaltransportistas/PortalEpp/widgets/text_widget.dart';

class DateForm extends StatefulWidget {
  dynamic fechavalue;
  dynamic fechaControler;
  DateForm(
    this.fechavalue,
    this.fechaControler, {
    super.key,
  });

  @override
  State<DateForm> createState() => _DateFormState();
}

class _DateFormState extends State<DateForm> {
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
        SizedBox(
          width: 300,
          child: TextFormField(
            //initialValue: DateFormat("dd-MM-yyyy").format(DateTime.now()),
            onChanged: (value) => widget.fechavalue = value,
            controller: widget.fechaControler,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onTap: (() async {
              DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100));
              if (pickeddate != null) {
                setState(() {
                  widget.fechaControler.text =
                      DateFormat("dd-MM-yyyy").format(pickeddate);
                });
              }
            }),
            onSaved: (value) {
              widget.fechavalue = DateFormat("dd-MM-yyyy")
                  .format(DateFormat('dd-MM-yyyy').parse(value!));
            },
            validator: ((value) {
              if (value!.isEmpty) {
                return "Llene este campo";
              }
            }),
          ),
        ),
      ],
    );
  }
}
