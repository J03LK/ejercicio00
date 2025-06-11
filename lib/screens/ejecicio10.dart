import 'package:flutter/material.dart';

class IntercambioForm extends StatefulWidget {
  @override
  _IntercambioFormState createState() => _IntercambioFormState();
}

class _IntercambioFormState extends State<IntercambioForm> {
  final edadController = TextEditingController();
  final promedioController = TextEditingController();
  String nivelIngles = 'Básico';
  String resultado = '';

  void evaluar() {
    final edad = int.tryParse(edadController.text);
    final promedio = double.tryParse(promedioController.text);

    if (edad == null || promedio == null) {
      setState(() => resultado = 'Ingrese datos válidos');
      return;
    }

    if (edad >= 16 &&
        edad <= 25 &&
        (nivelIngles == 'Intermedio' || nivelIngles == 'Avanzado') &&
        promedio >= 8) {
      setState(() => resultado = '✅ El estudiante es apto para el programa de intercambio');
    } else {
      setState(() => resultado = '❌ Lo siento, no cumple con los requisitos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Text('Evaluar Programa de Intercambio', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TextField(
            controller: edadController,
            decoration: InputDecoration(labelText: 'Edad'),
            keyboardType: TextInputType.number,
          ),
          DropdownButton<String>(
            value: nivelIngles,
            onChanged: (value) => setState(() => nivelIngles = value!),
            items: ['Básico', 'Intermedio', 'Avanzado'].map((nivel) {
              return DropdownMenuItem(value: nivel, child: Text(nivel));
            }).toList(),
          ),
          TextField(
            controller: promedioController,
            decoration: InputDecoration(labelText: 'Promedio'),
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
