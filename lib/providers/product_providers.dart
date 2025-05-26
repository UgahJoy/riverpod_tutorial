import 'package:provider_project/model/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// part 'model/product_model.dart.g.dart';

final productProvider = Provider((ref) => allProducts);

final sortProducts = Provider((p) {
  return allProducts
      .where((product) => (int.tryParse(product.amount) ?? 0) < 1000)
      .toList();
});
@riverpod
List<ProductModel> products(ref) {
  return allProducts;
}
