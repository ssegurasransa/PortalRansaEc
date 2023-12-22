import 'dart:async';
import 'package:flutter/material.dart';

import 'package:portaltransportistas/api/provider.dart';
import '../widget/tabla.dart';

class MyAppConsulta extends StatelessWidget {
  String query;

  MyAppConsulta(
    this.query, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<ProjectList>> dataLista = obtenerSeguros(query: query);
    TextEditingController _textoController = TextEditingController(text: "");

    return Scaffold(
      appBar: AppBar(
        title: Text('Portal de acceso Consulta Ransa'),
        actions: [
          IconButton(
            icon: Image.asset('assets/Logo_Ransa_Blanco.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          Card(
            child: ListTile(
                leading: Icon(Icons.search),
                title: TextField(
                    controller: _textoController,
                    decoration: InputDecoration(
                        hintText: 'Buscar por número de cedula',
                        border: InputBorder.none),
                    onChanged: (value) {}),
                trailing: IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) =>
                                  MyAppConsulta(_textoController.text))));
                    })),
          ),
          Center(
            child: FutureBuilder<List<ProjectList>>(
              future: dataLista,
              builder: (context, snapshot) {
                var filterData = snapshot.data;

                if (snapshot.hasData) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    verticalDirection: VerticalDirection.down,
                    children: <Widget>[
                      SizedBox(
                        height: 50,
                      ),
//
//
//------Tabla----------------------------------
//
//

                      Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: tablaBody(filterData)),
                      )
                    ],
                  );
/*                 return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(snapshot.data![index].cedula));
                          }); */
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // Por defecto, muestra un loading spinner
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
