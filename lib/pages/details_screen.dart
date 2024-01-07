import 'package:flutter/material.dart';
import 'package:modi_shop/product.dart';
import 'available_size.dart';
import 'cart_provider.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("details"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 36,),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 220,
                  height: 220,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade100,
                  ),
                  child:
                  Image.asset(product.image,fit: BoxFit.cover,),
                ),
              ]
          ),
          const SizedBox(height: 36,),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            height: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                )
            ),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '\$' '${product.price}',
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ]
                ),
                const SizedBox(height: 14,),
                Text(
                  product.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Available Size",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 8,),
                const Row(
                  children: [
                    AvailableSize(size: "us 6"),
                    AvailableSize(size: "us 7"),
                    AvailableSize(size: "us 8"),
                    AvailableSize(size: "us 9"),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Available colors",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
                const Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.red,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.blue,
                    ),
                    SizedBox(width: 8,),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.green,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      bottomSheet: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            width: double.infinity,
            height: MediaQuery.of(context).size.height /10,
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10)
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$' '${product.price}',
                  style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),
                ElevatedButton.icon(
                    onPressed:  (){
                      provider.toggleProduct(product);
                    },
                    icon: const Icon(Icons.send),
                    label: const Text("Add to Cart"))
              ],
            ),
          )
      ),
    );
  }
}








