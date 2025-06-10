import 'package:flutter/material.dart';

// EJERCICIO 11
class Ejercicio11Screen extends StatefulWidget {
  @override
  _Ejercicio11ScreenState createState() => _Ejercicio11ScreenState();
}

class _Ejercicio11ScreenState extends State<Ejercicio11Screen> {
  final TextEditingController promedioController = TextEditingController();
  final TextEditingController ingresoController = TextEditingController();
  String resultado = '';

  void evaluarBeca() {
    try {
      double promedio = double.parse(promedioController.text);
      double ingreso = double.parse(ingresoController.text);

      if (promedio >= 9.0 && ingreso < 3000) {
        setState(() {
          resultado = 'El estudiante es elegible para la beca';
        });
      } else {
        setState(() {
          resultado = 'Lo siento, el estudiante no es elegible para la beca';
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
      promedioController.clear();
      ingresoController.clear();
      resultado = '';
    });
  }

  String obtenerDetalleEvaluacion() {
    try {
      double promedio = double.parse(promedioController.text);
      double ingreso = double.parse(ingresoController.text);
      
      String detalle = 'Evaluación detallada:\n';
      detalle += '• Promedio: $promedio ${promedio >= 9.0 ? '✓' : '✗'} (Requerido: ≥ 9.0)\n';
      detalle += '• Ingreso familiar: \$${ingreso.toStringAsFixed(0)} ${ingreso < 3000 ? '✓' : '✗'} (Requerido: < \$3,000)';
      
      return detalle;
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejercicio 11'),
        backgroundColor: Colors.orange[700],
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
                      Icons.school_outlined,
                      size: 50,
                      color: Colors.orange[700],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Evaluación para Beca Universitaria',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Requisitos: Promedio ≥ 9.0 e Ingreso familiar < \$3,000 USD',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            
            TextField(
              controller: promedioController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Promedio de Calificaciones',
                hintText: 'Escala del 0 al 10',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.grade),
                suffixText: '/10',
              ),
            ),
            SizedBox(height: 20),
            
            TextField(
              controller: ingresoController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Ingreso Mensual Familiar',
                hintText: 'Ingreso en dólares USD',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
                prefixText: '\$ ',
                suffixText: 'USD',
              ),
            ),
            SizedBox(height: 30),
            
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: evaluarBeca,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
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
                    color: resultado.contains('elegible para la beca') 
                        ? Colors.green[50] 
                        : Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Icon(
                        resultado.contains('elegible para la beca') 
                            ? Icons.check_circle 
                            : Icons.cancel,
                        size: 40,
                        color: resultado.contains('elegible para la beca') 
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
                          color: resultado.contains('elegible para la beca') 
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
    promedioController.dispose();
    ingresoController.dispose();
    super.dispose();
  }
}