class ProductModel {
  final String productName;
  final num productPrice;

  ProductModel({required this.productName, required this.productPrice});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    productName: json["productName"],
    productPrice: json["productPrice"],
  );
}
