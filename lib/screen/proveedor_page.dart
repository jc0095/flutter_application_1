import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/edit_product_screen.dart';
import 'package:flutter_application_1/screen/list_product_screen.dart';

class ProveedorScreen extends StatelessWidget {
  const ProveedorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('                   Proveedores'),
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
                  backgroundColor: Colors.blue, // Cambia el color del botón de Listar Proveedor
                ),
                child: const Text('Listar Proveedor'),
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
                  backgroundColor: Colors.orange, // Cambia el color del botón de Editar Proveedor
                ),
                child: const Text('Editar Proveedor'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}