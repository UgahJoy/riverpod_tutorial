import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_project/providers/product_providers.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(sortProducts);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20),
              ...cartProducts.map((e) {
                return Container(
                  padding: EdgeInsets.only(bottom: 10, top: 10),
                  child: Row(
                    children: [
                      Image.asset(e.image, height: 50),
                      SizedBox(width: 12),
                      Expanded(child: Text("Name:  ${e.productName}")),

                      Text("Amount:  ₦${e.amount}"),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
