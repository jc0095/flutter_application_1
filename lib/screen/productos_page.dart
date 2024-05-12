import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/edit_product_screen.dart';
import 'package:flutter_application_1/screen/list_product_screen.dart';
import 'package:flutter_application_1/screen/ver_product_screen.dart';

class ProductosScreen extends StatelessWidget {
  const ProductosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('                    Productos'),
        backgroundColor: Color.fromARGB(255, 0, 122, 204), // Cambia el color del AppBar
      ),
      backgroundColor: Color.fromARGB(255, 255, 224, 178), // Cambia el color de fondo de la pantalla
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListProductScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cambia el color del botón de Listar Producto
                ),
                child: const Text('Listar Producto'),
              ),
            ),
            const SizedBox(height: 16), // Margen entre los botones
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProductScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Cambia el color del botón de Editar Producto
                ),
                child: const Text('Editar Producto'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
