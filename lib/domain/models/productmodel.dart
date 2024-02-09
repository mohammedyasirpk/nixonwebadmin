class ProductModel {
  final String productName;
  final int productCount;
  final int maxSoldCount;
  final String? uid;
  

  ProductModel({
    this.uid,
    required this.productName,
    required this.productCount,
    required this.maxSoldCount
  });
}
