class ProductModel {
  final String sku;
  final String name;

  const ProductModel({
    required this.sku,
    required this.name,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sku: json['sku'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
    'sku': sku,
    'name': name,
  };
}