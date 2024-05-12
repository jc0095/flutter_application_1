import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_application_1/services/category_service.dart';

class EditCategoryScreen extends StatefulWidget {
  const EditCategoryScreen({Key? key}) : super(key: key);

  @override
  _EditCategoryScreenState createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    final category = categoryService.selectedCategory;

    if (category != null) {
      _nameController.text = category.categoryName;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(category != null ? 'Editar Categoría' : 'Crear Categoría'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un nombre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (category != null) {
                      await categoryService.updateCategory(Category(
                        categoryId: category.categoryId,
                        categoryName: _nameController.text,
                        categoryState: category.categoryState,
                      ));
                    } else {
                      await categoryService.createCategory(Category(
                        categoryId: 0, 
                        categoryName: _nameController.text,
                        categoryState: 'Activa', // Default state
                      ));
                    }
                    Navigator.pop(context);
                  }
                },
                child: Text(category != null ? 'Actualizar' : 'Crear'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}