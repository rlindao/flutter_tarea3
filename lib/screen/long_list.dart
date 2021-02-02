import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea3_explicacion/provider/datos.dart';

import 'form_validate.dart';

class LongList extends StatelessWidget {
  const LongList({Key key}) : super(key: key);
  static final nombrePagina = "Listado";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas en Flutter'),
      ),
            body: (Datos().datos.isNotEmpty)
            ? ListView(children: _crearItem())
            : Center(
              child: Text("Los datos no han sido agregados"),
            ),
            floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(context, CupertinoPageRoute(builder: (context) => FormValidate()));
        },
        child: Icon(Icons.add_outlined  ),
        backgroundColor: Colors.green,
      ), 
    );
  }






  List<Widget> _crearItem() {
    List<Widget> temporal = [];
    for ( Map<String, dynamic> dato in Datos().datos) {
      Widget item = ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black12,
          child: Icon(Icons.person, color: Colors.black),
        ),
        title: Text(
    " Nombre: ${dato['Nombre']} , Apellido: ${dato['Apellido']}, Edad: ${dato['Edad']}"),
      );
      temporal.add(item);
    }
    return temporal;
  }


}
