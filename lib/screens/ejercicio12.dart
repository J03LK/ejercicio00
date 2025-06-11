import 'package:flutter/material.dart';

class EntrevistaForm extends StatefulWidget {
  @override
  _EntrevistaFormState createState() => _EntrevistaFormState();
}

class _EntrevistaFormState extends State<EntrevistaForm> {
  final edadController = TextEditingController();
  final experienciaController = TextEditingController();
  String resultado = '';

  void evaluar() {
    final edad = int.tryParse(edadController.text);
    final experiencia = int.tryParse(experienciaController.text);

    if (edad == null || experiencia == null) {
      setState(() => resultado = 'Ingrese datos válidos');
      return;
    }

    if (edad >= 25 && edad <= 35 && experiencia >= 3) {
      setState(() => resultado = '✅ El aspirante puede ser seleccionado para entrevista');
    } else {
      setState(() => resultado = '❌ No cumple con los requisitos para la entrevista');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Text('Evaluar Candidato a Entrevista', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextField(
            controller: edadController,
            decoration: InputDecoration(labelText: 'Edad'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: experienciaController,
            decoration: InputDecoration(labelText: 'Años de experiencia'),
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
