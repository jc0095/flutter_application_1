import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/categoria_page.dart';
import 'package:flutter_application_1/screen/productos_page.dart';
import 'package:flutter_application_1/screen/proveedor_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '                           Menu Principal',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 122, 204),
        actions: [
          IconButton(
            onPressed: () {
              // Acción al presionar el ícono de menú
            },
            icon: Icon(Icons.menu, color: Colors.white),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 224, 178),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildButton(
            Icons.shopping_cart,
            'Producto',
            Colors.teal,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductosScreen()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildButton(
            Icons.category,
            'Categoría',
            Colors.deepOrange,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoriaScreen()),
              );
            },
          ),
          const SizedBox(height: 16),
          _buildButton(
            Icons.store,
            'Proveedor',
            Colors.purple,
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProveedorScreen()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildButton(IconData icon, String label, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color, // Cambia el color del botón
        minimumSize: Size(double.infinity, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 8.0),
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}