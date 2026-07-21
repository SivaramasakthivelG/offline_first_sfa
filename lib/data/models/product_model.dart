class ProductModel {
  final String sku;
  final String name;
  final int quantity;

  const ProductModel({
    required this.sku,
    required this.name,
    this.quantity = 0,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sku: json['sku'],
      name: json['name'],
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'sku': sku,
    'name': name,
    'quantity': quantity,
  };

  ProductModel copyWith({
    String? sku,
    String? name,
    int? quantity,
  }) {
    return ProductModel(
      sku: sku ?? this.sku,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }
}