
class Product {

  int id;
  String name;

  Product(this.id, this.name);

  static List<Product> getProducts() {
    return <Product>[
      Product(1, 'Arroz'),
      Product(2, 'Feijão'),
      Product(3, 'Sal'),
    ];
  }
}