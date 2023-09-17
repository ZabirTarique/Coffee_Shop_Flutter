//
// import 'package:coffe_shop_app/pages/home_page.dart';
// import 'package:coffe_shop_app/pages/home_page_new.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       //home: HomePage(),
//       home: HomePageNew(),
//     );
//   }
// }

import 'package:coffe_shop_app/pages/home_page_new.dart';
import 'package:coffe_shop_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

 final  Map<int, Color> color =
  {
    50:const Color.fromRGBO(136,14,79, .1),

  };

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            //primarySwatch: MaterialColor(0xffF5C168,color),
            primarySwatch: Colors.orange,
          ),
          home: const HomePageNew(),
        );
      }),
    );
  }
}

