import 'package:hive/hive.dart';
import 'package:seujcare/models/category_model.dart';

class CategoryRepository {
  final Box box = Hive.box('myBox');

  /// Insert a new category
  Future<String?> insertCategory(CategoryModel category) async {
    try {
      List<Map<String, dynamic>> categories = List<Map<String, dynamic>>.from(
          box.get('myCategories', defaultValue: [])!);

      categories.add(category.toMap());

      await box.put('myCategories', categories);
      return null;
    } catch (e) {
      return "Error: $e";
    }
  }

  /// Delete a category by index
  Future<String?> deleteCategory(int index) async {
    try {
      List<Map<String, dynamic>> categories = List<Map<String, dynamic>>.from(
          box.get('myCategories', defaultValue: [])!);

      categories.removeAt(index);
      await box.put('myCategories', categories);
      return null;
    } catch (e) {
      return "Error: $e";
    }
  }

  /// Retrieve all categories
  List<CategoryModel> get categoryList {
    try {
      List<Map<String, dynamic>> categories = List<Map<String, dynamic>>.from(
          box.get('myCategories', defaultValue: [])!);

      return categories.map((map) => CategoryModel.fromMap(map)).toList();
    } catch (e) {
      return [];
    }
  }

  /// Update a category by index
  Future<String?> updateCategory(
      int index, CategoryModel updatedCategory) async {
    try {
      List<Map<String, dynamic>> categories = List<Map<String, dynamic>>.from(
          box.get('myCategories', defaultValue: [])!);
      categories[index] = updatedCategory.toMap();
      await box.put('myCategories', categories);
      return null;
    } catch (e) {
      return "Something went wrong!";
    }
  }
}
