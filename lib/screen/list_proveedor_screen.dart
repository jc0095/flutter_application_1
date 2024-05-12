import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/proveedor_service.dart';
import 'package:flutter_application_1/models/proveedor.dart';
import 'package:flutter_application_1/services/services.dart';



class ListProviderScreen extends StatelessWidget {
  const ListProviderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProviderService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Proveedores'),
      ),
      body: providerService.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: providerService.providers.length,
              itemBuilder: (BuildContext context, int index) {
                final provider = providerService.providers[index];
                return ListTile(
                  title: Text(provider.providerName),
                  subtitle: Text(provider.providerMail),
                  onTap: () {
                    providerService.selectedProvider = provider;
                    Navigator.pushNamed(context, 'edit_provider');
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Eliminar Proveedor'),
                          content: Text('¿Estás seguro de eliminar a ${provider.providerName}?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Cancelar'),
                            ),
                            TextButton(
                              onPressed: () {
                                providerService.deleteProvider(provider.providerId);
                                Navigator.pop(context);
                              },
                              child: Text('Eliminar'),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, 'add_provider'),
        child: Icon(Icons.add),
      ),
    );
  }
}
