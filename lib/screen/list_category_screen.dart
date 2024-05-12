import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/category_service.dart';
import 'package:provider/provider.dart';

class ListCategoryScreen extends StatelessWidget {
  const ListCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryService = Provider.of<CategoryService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Categorías'),
      ),
      body: categoryService.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: categoryService.categories.length,
              itemBuilder: (BuildContext context, index) {
                final category = categoryService.categories[index];
                return ListTile(
                  title: Text(category.categoryName),
                  onTap: () {
                    categoryService.selectedCategory = category;
                    Navigator.pushNamed(context, 'edit_category');
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          categoryService.selectedCategory = null;
          Navigator.pushNamed(context, 'edit_category');
        },
      ),
    );
  }
}