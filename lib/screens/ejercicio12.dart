import 'package:flutter/material.dart';

// EJERCICIO 12
class Ejercicio12Screen extends StatefulWidget {
  @override
  _Ejercicio12ScreenState createState() => _Ejercicio12ScreenState();
}

class _Ejercicio12ScreenState extends State<Ejercicio12Screen> {
  final TextEditingController edadController = TextEditingController();
  final TextEditingController experienciaController = TextEditingController();
  String resultado = '';

  void evaluarEntrevista() {
    try {
      int edad = int.parse(edadController.text);
      int experiencia = int.parse(experienciaController.text);

      bool edadApta = edad >= 25 && edad <= 35;
      bool experienciaApta = experiencia >= 3;

      if (edadApta && experienciaApta) {
        setState(() {
          resultado = 'El aspirante puede ser seleccionado para una entrevista';
        });
      } else {
        setState(() {
          resultado = 'Lo siento, el aspirante no cumple con los requisitos para la entrevista';
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
      experienciaController.clear();
      resultado = '';
    });
  }

  String obtenerDetalleEvaluacion() {
    try {
      int edad = int.parse(edadController.text);
      int experiencia = int.parse(experienciaController.text);
      
      String detalle = 'Evaluación detallada:\n';
      detalle += '• Edad: $edad años ${edad >= 25 && edad <= 35 ? '✓' : '✗'} (Requerido: 25-35 años)\n';
      detalle += '• Experiencia: $experiencia años ${experiencia >= 3 ? '✓' : '✗'} (Requerido: ≥ 3 años)';
      
      return detalle;
    } catch (e) {
      return '';
    }
  }

  Color obtenerColorPorEdad(int edad) {
    if (edad >= 25 && edad <= 35) {
      return Colors.green;
    } else if (edad >= 22 && edad <= 38) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 12'),
        backgroundColor: Colors.purple[700],
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
                      Icons.work_outline,
                      size: 50,
                      color: Colors.purple[700],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Evaluación para Entrevista de Trabajo',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Requisitos: Edad 25-35 años y Experiencia ≥ 3 años',
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
                suffixText: 'años',
              ),
            ),
            SizedBox(height: 20),
            
            TextField(
              controller: experienciaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Años de Experiencia Laboral',
                hintText: 'Años de experiencia',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.work),
                suffixText: 'años',
              ),
            ),
            SizedBox(height: 30),
            
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: evaluarEntrevista,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
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
                    color: resultado.contains('puede ser seleccionado') 
                        ? Colors.green[50] 
                        : Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        resultado.contains('puede ser seleccionado') 
                            ? Icons.check_circle 
                            : Icons.cancel,
                        size: 40,
                        color: resultado.contains('puede ser seleccionado') 
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
                          color: resultado.contains('puede ser seleccionado') 
                              ? Colors.green[800] 
                              : Colors.red[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (obtenerDetalleEvaluacion().isNotEmpty) ...[
                        SizedBox(height: 15),
                        Divider(),
                        Text(
                          obtenerDetalleEvaluacion(),
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                        ),
                      ],
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
    experienciaController.dispose();
    super.dispose();
  }
}
                