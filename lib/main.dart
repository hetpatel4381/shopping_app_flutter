import 'package:flutter/material.dart';
import 'package:shop_app/pages/bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
// import 'package:shop_app/cart_page.dart';
import 'package:shop_app/providers/cart_provider.dart';
// import 'package:shop_app/global_variables.dart';
// import 'package:shop_app/home_page.dart';
// import 'package:shop_app/home_page.dart';
// import 'package:shop_app/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //for using multiple provider in the app we use multiprovider.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
    // return ChangeNotifierProvider(
      // create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping App",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(254, 206, 1, 1),
              primary: const Color.fromRGBO(254, 206, 1, 1)),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          useMaterial3: true,
          fontFamily: 'Lato',
        ),
        home: const BottonNavigation(),
        // home: ProductDetailsPage(
        //   product: products[0],
        // ),
        // home: const HomePage(),
      ),
    );
  }
}
