import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/cart_screen.dart';
import 'package:provider_project/providers/product_providers.dart';

class MyHomePage extends ConsumerWidget {
  final String title;
  const MyHomePage({super.key, required this.title});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: Text("Beginning Riverpod")),
                  InkWell(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CartScreen()),
                        ),
                    child: Badge(
                      backgroundColor: Colors.lightBlueAccent,
                      smallSize: 12,
                      child: Icon(Icons.shopping_bag_outlined),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                  itemCount: allProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 3 / 2,
                  ),
                  itemBuilder:
                      (context, index) => ProductItem(
                        productID: allProducts[index].id,
                        productImage: allProducts[index].image,
                        productName: allProducts[index].productName,
                        productPrice: allProducts[index].amount,
                        onTap: () {},
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productID;
  final String productPrice;
  final Function() onTap;
  const ProductItem({
    super.key,
    required this.productID,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(productImage, height: 50),
            ),
            SizedBox(height: 4),
            Text(productName, style: TextStyle(fontSize: 16)),
            SizedBox(height: 4),
            Text(
              "₦$productPrice",
              style: TextStyle(fontSize: 12, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
