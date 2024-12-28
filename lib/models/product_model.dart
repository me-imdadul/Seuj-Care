class ProductModel {
  final String title;
  final String description;
  final String price;

  ProductModel(
      {required this.title, required this.description, required this.price});
}

List<ProductModel> myLocalProducts = [
  ProductModel(title: 'Product 1', description: 'Lorem Ipsum 1', price: '120'),
  ProductModel(title: 'Product 2', description: 'Lorem Ipsum 2', price: '500'),
];
