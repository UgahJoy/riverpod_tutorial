class ProductModel {
  String productName;
  String amount;
  String id;
  String image;
  ProductModel({
    required this.productName,
    required this.amount,
    required this.id,
    required this.image,
  });
}

List<ProductModel> allProducts = [
  ProductModel(
    amount: "200",
    id: "1",
    image: "assest/ball.png",
    productName: "Ball",
  ),
  ProductModel(
    amount: "500",
    id: "2",
    image: "assest/book.png",
    productName: "Book",
  ),
  ProductModel(
    amount: "1000",
    id: "3",
    image: "assest/gift.png",
    productName: "Gift",
  ),
  ProductModel(
    amount: "20000",
    id: "4",
    image: "assest/person.png",
    productName: "Sales Man",
  ),
  ProductModel(
    amount: "2000",
    id: "5",
    image: "assest/round.png",
    productName: "Big Gift",
  ),
  ProductModel(
    amount: "12000",
    id: "6",
    image: "assest/tv.png",
    productName: "Tv",
  ),
];
