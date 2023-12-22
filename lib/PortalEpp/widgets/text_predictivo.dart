import 'dart:convert';
import 'dart:js_interop';
import 'package:meta/meta.dart';
import 'package:portaltransportistas/PortalEpp/provider/gh_registerNew.dart';
import 'package:portaltransportistas/PortalEpp/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:portaltransportistas/PortalEpp/provider/providerEPP.dart';

class AutocompleteWidget extends StatefulWidget {
  dynamic setfunction;
  AutocompleteWidget(this.setfunction, {super.key});

  @override
  _AutocompleteWidgetState createState() => _AutocompleteWidgetState();
}

class _AutocompleteWidgetState extends State<AutocompleteWidget> {
  Future<List<EppActivo>> dataLista = eppActivostotales();
  List<String> _suggestions = [
    "0922002175",
    "0967096783",
    "1397896780",
    "1209830022",
    "0969900045"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      child: Column(
        children: [
          Container(
            width: 950,
            child: TextWidget(
              text: "Cedula:",
              textAlignt: TextAlign.left,
              fontWeight: FontWeight.normal,
              textcolor: Color.fromARGB(255, 110, 110, 110),
              textsize: 16,
            ),
          ),
          Container(
            height: 5,
          ),
          Container(
            child: Consumer<DropdownService>(builder: (context, valor, child) {
              return Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return _suggestions
                      .where((String option) => option
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()))
                      .toList();
                },
                onSelected: (String selection) {
                  valor.cedulaSelect = selection;
                  print('Seleccionado: $selection');
                },
                fieldViewBuilder: (BuildContext context,
                    TextEditingController textEditingController,
                    FocusNode focusNode,
                    VoidCallback onFieldSubmitted) {
                  return TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "Llene este campo";
                      return null;
                    },
                    controller: textEditingController,
                    focusNode: focusNode,
                    onChanged: (value) {
                      valor.setcedulaSelect(value);
                      _fetchSuggestions(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
                optionsViewBuilder: (BuildContext context,
                    AutocompleteOnSelected<String> onSelected,
                    Iterable<String> options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: Container(
                        constraints: BoxConstraints(maxHeight: 200),
                        child: ListView(
                          padding: EdgeInsets.all(8.0),
                          children: options
                              .map(
                                (String option) => GestureDetector(
                                  onTap: () {
                                    onSelected(option);
                                  },
                                  child: ListTile(
                                    title: Text(option),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Future<void> _fetchSuggestions(String query) async {
    final response = await http.get(Uri.parse(
        'https://ransaapiecuador.azurewebsites.net/GesSoloCedula')); // Reemplaza esto con la URL de tu API

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      setState(() {
        _suggestions = data
            .map((item) =>
                item.toString().replaceAll("[", "").replaceAll("]", ""))
            .toList();
      });
    } else {
      throw Exception('Error al obtener sugerencias desde la API');
    }
  }
}
