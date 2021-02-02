import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tarea3_explicacion/provider/datos.dart';

import 'long_list.dart';

class FormValidate extends StatelessWidget {
  FormValidate({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _ctrlnombre = TextEditingController();
  final _ctrlapellido = TextEditingController();
  final _ctrledad = TextEditingController();
  // mapa de datos para guardar los valores de los edittext
  final Map<String, dynamic> nuevosDatos = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            _campoIngreso('Ingrese su Nombre' , _ctrlnombre , 'Por favor Ingrese  su nombre' ),
            _campoIngreso('Ingrese su Apellido' , _ctrlapellido , 'Por favor Ingrese  su apellido'),
            _campoIngreso('Ingrese su Edad' , _ctrledad , 'Por favor Ingrese  su edad' ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  nuevosDatos['Nombre'] = _ctrlnombre.text.toString();
                  nuevosDatos['Apellido'] = _ctrlapellido.text.toString();
                  nuevosDatos['Edad'] = _ctrledad.text.toString();
                  _ctrlnombre.clear();
                  _ctrlapellido.clear();
                  _ctrledad.clear();
                  _scaffoldKey.currentState
                      .showSnackBar(new SnackBar(content: new Text('Procesando info')));
                  Datos().agregarDatos(nuevosDatos);
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => LongList()));
                }
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }

  _campoIngreso(labelText ,  controller , mensaje){
    
    return TextFormField(
          decoration: InputDecoration(
              labelText: labelText ),
              controller: controller,
              validator: (value) {
                if (value.isEmpty) {
                  return mensaje;
                } else {
                  return null;
                }
              },
            );
  }


  
}
