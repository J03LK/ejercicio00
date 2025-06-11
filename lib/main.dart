import 'package:flutter/material.dart';
import 'screens/ejecicio10.dart';
import 'screens/ejercicio11.dart';
import 'screens/ejercicio12.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejercicios 00 - Stack',
      debugShowCheckedModeBanner: false,
      home: StackScreen(),
    );
  }
}

class StackScreen extends StatefulWidget {
  @override
  _StackScreenState createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  int selectedForm = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejercicios')),
      body: Stack(
        children: [
          Visibility(
            visible: selectedForm == 0,
            child: IntercambioForm(),
          ),
          Visibility(
            visible: selectedForm == 1,
            child: BecaForm(),
          ),
          Visibility(
            visible: selectedForm == 2,
            child: EntrevistaForm(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedForm,
        onTap: (index) => setState(() => selectedForm = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Intercambio'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Beca'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Entrevista'),
        ],
      ),
    );
  }
}
