import 'package:flutter/material.dart';
import 'package:ghandiishop/pages/cart_details.dart';
import 'package:ghandiishop/pages/favorite_screen.dart';
import 'package:ghandiishop/pages/home_screen.dart';
import 'package:ghandiishop/pages/profile_screen.dart';
import 'package:ghandiishop/providers/cart_provider.dart';
import 'package:ghandiishop/providers/favorite_provider.dart';
import 'package:provider/provider.dart';


void main()=> runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FavoriteProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
    ],
    child: MaterialApp(
      title: "ghandii's shop",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        scaffoldBackgroundColor: Colors.grey.shade100,
      ),
      home: const HomePage(),
    ),
  );
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  List screen = [
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ghandii's Shop"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> const CartDetails(),
                ),
              ),
              icon: const Icon(Icons.add_shopping_cart)
          ),
        ],
      ),
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value){
          setState(() => currentIndex = value);
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items : const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Favorite",
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}