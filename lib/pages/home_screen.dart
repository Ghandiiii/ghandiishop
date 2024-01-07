import 'package:flutter/material.dart';
import 'package:modi_shop/product_card.dart';
import 'product.dart';
import 'details_screen.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> _products = [];
  List<Product> _products2 = [];
  List<Product> _products3 = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
    fetchProducts2();
    fetchProducts3();
  }

  Future<void> fetchProducts() async {
    try {
      List<Product> products = await Product.fetchProducts();
      setState(() {
        _products = products;
      });
    } catch (e) {
      print(e);
    }
  }



  Future<void> fetchProducts2() async {
    try {
      List<Product> products2 = await Product.fetchProducts2();
      setState(() {
        _products2 = products2;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> fetchProducts3() async {
    try {
      List<Product> products3 = await Product.fetchProducts3();
      setState(() {
        _products3 = products3;
      });
    } catch (e) {
      print(e);
    }
  }

  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "Our Products",
            style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildProductCategory(index: 0, name: "All Products"),
              _buildProductCategory(index: 1, name: "Jackets"),
              _buildProductCategory(index: 2, name: "Sneakers"),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: isSelected ==0
                ? _buildAllPorducts()
                : isSelected ==1
                ? _buildJackets()
                : _buildSneakers(),
          ),
        ],
      ),
    );


  }

  _buildProductCategory({required int index, required String? name}) =>
      GestureDetector(
        onTap: () => setState(() => isSelected = index),
        child: Container(
          width: 100,
          height: 40,
          margin: const EdgeInsets.only(top: 10, right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isSelected == index ? Colors.blue : Colors.blue.shade300,
              borderRadius: BorderRadius.circular(8)
          ),
          child:  Text(
            name!,
            style:  TextStyle(color: Colors.white),
          ),
        ),
      );


  _buildAllPorducts() => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100 / 140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: _products.length,
    itemBuilder: (context, index){
      final allProducts = _products[index];
      return GestureDetector(
        onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(product: allProducts),
          ),
        ),
        child: ProductCard(product: allProducts),
      );

    },
  );

  _buildJackets() => GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100 / 140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: _products2.length,
    itemBuilder: (context, index){
      final jacketsList = _products2[index];
      return GestureDetector(
        onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(product: jacketsList
            ),
          ),
        ),
        child: ProductCard(product: jacketsList),
      );
    },
  );

  _buildSneakers()=> GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: (100 / 140),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    ),
    scrollDirection: Axis.vertical,
    itemCount: _products3.length,
    itemBuilder: (context,  index ){
      final sneakersList = _products3[index];
      return GestureDetector(
        onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(product: sneakersList
            ),
          ),
        ),
        child: ProductCard(product: sneakersList
        ),
      );
    },
  );

}
