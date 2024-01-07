
import 'dart:convert';
import 'package:http/http.dart' as http;
// main URL for REST pages
class Product{
 int id;
 String name;
   String description;
   double price;
  int quantity;
  String image;
   String category;





  Product(  {
  required this.id,
  required this.name,
  required this.category,
  required this.description,
  required this.price,
  required this.quantity,
  required this.image
});

 static Future<List<Product>> fetchProducts() async {
  final response = await http.get(
   Uri.parse('https://salloumd3aybes.000webhostapp.com/getAllProducts.php'),
  );

  if (response.statusCode == 200) {
   List jsonResponse = json.decode(response.body);
   return jsonResponse.map((product) => Product(
    id: int.parse(product['all_productID']),
    name: product['name'],
    description: product['description'],
    price: double.parse(product['price']),
    quantity:int.parse(product['quantity']) ,
    image: product['imageURL'],
    category: product['category'],
   )).toList();
  } else {
   throw Exception('Failed to load products');
  }
 }

 static Future<List<Product>> fetchProducts2() async {
  final response = await http.get(
   Uri.parse('https://salloumd3aybes.000webhostapp.com/getJacketProducts.php'),
  );

  if (response.statusCode == 200) {
   List jsonResponse = json.decode(response.body);
   return jsonResponse.map((product) => Product(
    id: int.parse(product['jacket_productID']),
    name: product['jaket_name'],
    description: product['jacket_description'],
    price: double.parse(product['jacket_price']),
    quantity:int.parse(product['jacket_quantity']) ,
    image: product['jacket_imageURL'],
    category: product['jacket_category'],
   )).toList();
  } else {
   throw Exception('Failed to load products');
  }
 }

 static Future<List<Product>> fetchProducts3() async {
  final response = await http.get(
   Uri.parse('https://salloumd3aybes.000webhostapp.com/getSneakersProducts.php'),
  );

  if (response.statusCode == 200) {
   List jsonResponse = json.decode(response.body);
   return jsonResponse.map((product) => Product(
    id: int.parse(product['sneakers_productID']),
    name: product['sneaker_name'],
    description: product['sneaker_description'],
    price: double.parse(product['sneaker_price']),
    quantity:int.parse(product['sneaker_quantity']) ,
    image: product['sneaker_imageURL'],
    category: product['sneaker_category'],
   )).toList();
  } else {
   throw Exception('Failed to load products');
  }
 }

 }



