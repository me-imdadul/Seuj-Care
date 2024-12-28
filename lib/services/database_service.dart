import 'package:hive/hive.dart';

class DatabaseServices {
  var box = Hive.box('myBox');

  Future<void> insertProduct(Map<String, dynamic> data) async {
    List<Map<String, dynamic>> cart = box.get('myProduct', defaultValue: [])!;
    cart.add(data);
    await box.put('myProduct', cart);
  }

  void deleteProduct(int index) async {
    List<Map<String, dynamic>> cart = box.get('myProduct', defaultValue: [])!;
    cart.removeAt(index);
    await box.put('myProduct', cart);
  }

  List<Map<String, dynamic>> get productList {
    return box.get('myProduct', defaultValue: [])!;
  }

  Future<void> updateProduct(
      int index, Map<String, dynamic> updatedProduct) async {
    List<Map<String, dynamic>> cart = box.get('myProduct', defaultValue: [])!;
    cart[index] = updatedProduct;
    await box.put('myProduct', cart);
  }

  //
}
