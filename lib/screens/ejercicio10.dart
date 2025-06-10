import 'package:flutter/material.dart';

// EJERCICIO 10
class Ejercicio10Screen extends StatefulWidget {
  @override
  _Ejercicio10ScreenState createState() => _Ejercicio10ScreenState();
}

class _Ejercicio10ScreenState extends State<Ejercicio10Screen> {
  final TextEditingController edadController = TextEditingController();
  final TextEditingController promedioController = TextEditingController();
  String nivelIngles = 'Básico';
  String resultado = '';

  void evaluarIntercambio() {
    try {
      int edad = int.parse(edadController.text);
      double promedio = double.parse(promedioController.text);

      bool edadApta = edad >= 16 && edad <= 25;
      bool inglesApto = nivelIngles == 'Intermedio' || nivelIngles == 'Avanzado';
      bool promedioApto = promedio >= 8.0;

      if (edadApta && inglesApto && promedioApto) {
        setState(() {
          resultado = 'El estudiante es apto para participar en el programa de intercambio';
        });
      } else {
        setState(() {
          resultado = 'Lo siento, el estudiante no cumple con los requisitos para el programa de intercambio';
        });
      }
    } catch (e) {
      setState(() {
        resultado = 'Por favor, ingresa valores válidos';
      });
    }
  }

  void limpiarCampos() {
    setState(() {
      edadController.clear();
      promedioController.clear();
      nivelIngles = 'Básico';
      resultado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 10'),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(
                      Icons.school,
                      size: 50,
                      color: Colors.green[700],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Evaluación para Intercambio Estudiantil',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Requisitos: Edad 16-25 años, Inglés intermedio/avanzado, Promedio ≥ 8',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            
            TextField(
              controller: edadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Edad',
                hintText: 'Ingresa tu edad',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 20),
            
            DropdownButtonFormField<String>(
              value: nivelIngles,
              decoration: InputDecoration(
                labelText: 'Nivel de Inglés',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.language),
              ),
              items: ['Básico', 'Intermedio', 'Avanzado']
                  .map((nivel) => DropdownMenuItem(
                        value: nivel,
                        child: Text(nivel),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  nivelIngles = value!;
                });
              },
            ),
            SizedBox(height: 20),
            
            TextField(
              controller: promedioController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Promedio de Calificaciones',
                hintText: 'Escala del 0 al 10',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.grade),
              ),
            ),
            SizedBox(height: 30),
            
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: evaluarIntercambio,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Evaluar Elegibilidad',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: limpiarCampos,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      'Limpiar',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            
            if (resultado.isNotEmpty)
              Card(
                elevation: 4,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: resultado.contains('apto para participar') 
                        ? Colors.green[50] 
                        : Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        resultado.contains('apto para participar') 
                            ? Icons.check_circle 
                            : Icons.cancel,
                        size: 40,
                        color: resultado.contains('apto para participar') 
                            ? Colors.green[700] 
                            : Colors.red[700],
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Resultado:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        resultado,
                        style: TextStyle(
                          fontSize: 16,
                          color: resultado.contains('apto para participar') 
                              ? Colors.green[800] 
                              : Colors.red[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    edadController.dispose();
    promedioController.dispose();
    super.dispose();
  }
}