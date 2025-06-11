import 'package:flutter/material.dart';

class BecaForm extends StatefulWidget {
  @override
  _BecaFormState createState() => _BecaFormState();
}

class _BecaFormState extends State<BecaForm> {
  final promedioController = TextEditingController();
  final ingresoController = TextEditingController();
  String resultado = '';

  void evaluar() {
    final promedio = double.tryParse(promedioController.text);
    final ingreso = double.tryParse(ingresoController.text);

    if (promedio == null || ingreso == null) {
      setState(() => resultado = 'Ingrese datos válidos');
      return;
    }

    if (promedio >= 9 && ingreso < 3000) {
      setState(() => resultado = '✅ El estudiante es elegible para la beca');
    } else {
      setState(() => resultado = '❌ No es elegible para la beca');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Text('Evaluar Beca Universitaria', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextField(
            controller: promedioController,
            decoration: InputDecoration(labelText: 'Promedio de calificaciones'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: ingresoController,
            decoration: InputDecoration(labelText: 'Ingreso mensual familiar'),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(onPressed: evaluar, child: Text('Evaluar')),
          SizedBox(height: 20),
          Text(resultado, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
