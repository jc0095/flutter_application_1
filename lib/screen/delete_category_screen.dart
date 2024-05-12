import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/category_service.dart';
import 'package:provider/provider.dart';

class DeleteCategoryScreen extends StatelessWidget {
  const DeleteCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);
    final category = categoryService.selectedCategory;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliminar Categoría'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                '¿Estás seguro de eliminar la categoría ${category!.categoryName}?'),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                categoryService.deleteCategory(category.categoryId);
                Navigator.popUntil(
                    context, ModalRoute.withName('list_category'));
              },
              child: const Text('Eliminar'),
            ),
          ],
        ),
      ),
    );
  }
}