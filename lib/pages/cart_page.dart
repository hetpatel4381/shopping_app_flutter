import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
// import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    // final cart = context.watch<CartProvider>().cart;  short alternative of the below line.
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return ListTile(
              leading: CircleAvatar(
                // backgroundColor: Colors.grey,
                backgroundImage: AssetImage(cartItem['imageUrl'] as String),
                radius: 30,
              ),
              title: Text(
                cartItem['title'].toString(),
                style: Theme.of(context).textTheme.bodySmall,
              ),
              subtitle: Text("Size: ${cartItem['size']}"),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                      // barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Delete Product",
                              style: Theme.of(context).textTheme.titleMedium),
                          content: const Text(
                              "Are you sure you want to remove the product from your cart?"),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("No",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold))),
                            TextButton(
                                onPressed: () {
                                  // context
                                  //     .read<CartProvider>()
                                  //     .removeProduct(cartItem);
                                  // short syntax of the below line.
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeProduct(cartItem);
                                  Navigator.pop(context);
                                },
                                child: const Text("Yes",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold))),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            );
          }),
    );
  }
}
