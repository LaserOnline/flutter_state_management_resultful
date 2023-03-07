class Product {
  int Product_ID;
  String Product_Name;
  String Product_Price;
  String Product_Images;

  Product({
    required this.Product_ID,
    required this.Product_Name,
    required this.Product_Price,
    required this.Product_Images,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      Product_ID: json["Product_ID"] ?? 0,
      Product_Name: json["Product_Name"] ?? "",
      Product_Price: json["Product_Price"] ?? "",
      Product_Images: json["Product_Images"] ?? "",
    );
  }
}
