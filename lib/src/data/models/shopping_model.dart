class ShoppingModel {
  final String image;
  final String brandName;
  final String productName;
  final String type;
  final bool isDiscounted;
  final String discountAmount;
  final String amount;
  final String discountPercentage;
  final String likes;
  final String currency;

  ShoppingModel({
    required this.amount,
    required this.brandName,
    required this.discountAmount,
    required this.discountPercentage,
    required this.isDiscounted,
    required this.image,
    required this.likes,
    required this.productName,
    required this.type,
    required this.currency,
  });
}
