import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/proveedor_service.dart';
import 'package:flutter_application_1/models/proveedor.dart';


class EditProviderScreen extends StatefulWidget {
  const EditProviderScreen({Key? key}) : super(key: key);

  @override
  _EditProviderScreenState createState() => _EditProviderScreenState();
}

class _EditProviderScreenState extends State<EditProviderScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _mailController;
  late TextEditingController _stateController;

  @override
  void initState() {
    super.initState();
    final providerService = Provider.of<ProviderService>(context, listen: false);
    final selectedProvider = providerService.selectedProvider;
    _nameController = TextEditingController(text: selectedProvider?.providerName ?? '');
    _lastNameController = TextEditingController(text: selectedProvider?.providerLastName ?? '');
    _mailController = TextEditingController(text: selectedProvider?.providerMail ?? '');
    _stateController = TextEditingController(text: selectedProvider?.providerState ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _mailController.dispose();
    _stateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final providerService = Provider.of<ProviderService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(providerService.isEditCreate ? 'Editar Proveedor' : 'Agregar Proveedor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              TextFormField(
                controller: _mailController,
                decoration: InputDecoration(labelText: 'Correo'),
              ),
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(labelText: 'Estado'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newProvider = Provider(
                      providerId: providerService.selectedProvider?.providerId ?? 0,
                      providerName: _nameController.text,
                      providerLastName: _lastNameController.text,
                      providerMail: _mailController.text,
                      providerState: _stateController.text,
                    );
                    if (providerService.isEditCreate) {
                      providerService.updateProvider(newProvider);
                    } else {
                      providerService.createProvider(newProvider);
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(providerService.isEditCreate ? 'Editar' : 'Agregar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
