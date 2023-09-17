
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_tabs_flutter/vertical_tabs.dart';

import '../provider/cart_provider.dart';
import '../screens/cart_screen.dart';
import '../widgets/montly_coffee_widget.dart';
import '../widgets/product_widget.dart';
import 'details_page.dart';
import 'details_page_pine_blend.dart';
import 'details_page_trending.dart';

class HomePageNew extends StatelessWidget {
  const HomePageNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  color: const Color(0xffF5C168),
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(7,30,7,30),
                    child: Text('Zabir\n World',style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),),
                  ),
                Expanded(
                  child: Column(
                    children: [

                     // const SizedBox(height: 15),
                      Container(
                        color: const Color(0xffF5F0E6),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 70,
                                //width: 70,
                                child: Image.asset("assets/1.png")),
                            SizedBox(
                                height: 70,
                                //width: 70,
                                child: Image.asset("assets/10.png")),
                            SizedBox(
                                height: 70,
                                //width: 70,
                                child: Image.asset("assets/4.png")),
                            SizedBox(
                                height: 70,
                                //width: 70,
                                child: Image.asset("assets/11.png")),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 10, right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Coffee",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset("assets/16.png")),
                            const Spacer(),
                            const Icon(Icons.search, size: 30,),
                            //Image.asset("assets/search.png"),
                            const SizedBox(height: 15),
                            Image.asset("assets/filter.png"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height,
              child: VerticalTabs(
                //tabBackgroundColor: Colors.amber.shade50,
                tabBackgroundColor: const Color(0xffF5F0E6),

                indicatorWidth: 10,
                //selectedTabBackgroundColor: Colors.amber.shade50,

                indicatorColor: Colors.purple.shade100,
                tabsWidth: 85,
                tabsShadowColor: Colors.black,
                tabs:  <Tab>[
                  const Tab(icon: Icon(Icons.phone), child: RotatedBox(
                      quarterTurns: 3,
                      child: Center(child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Top Pick',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                      )))),
                  const Tab(icon: Icon(Icons.phone), child: RotatedBox(
                      quarterTurns: 3,
                      child: Center(child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Trending',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                      )))),
                  const Tab(icon: Icon(Icons.phone), child: RotatedBox(
                      quarterTurns: 3,
                      child: Center(child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Latest',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                      )))),
                  Tab(icon: const Icon(Icons.shopping_cart_outlined, color: Colors.amber,size: 20,), child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        badges.Badge(
                          badgeContent: Consumer<CartProvider>(
                            builder: (context, value, child) {
                              return Text(
                                value.getCounter().toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontWeight: FontWeight.bold),
                              );
                            },
                          ),
                          //position: const BadgePosition(start: 30, bottom: 30),
                          position: badges.BadgePosition.topEnd(top: -8, end: 15),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const CartScreen()));
                            },
                            icon: const Icon(Icons.shopping_cart),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                      ],
                    ),
                    // child: Container(
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //
                    //     child: const Padding(
                    //   padding: EdgeInsets.all(10.0),
                    //   child: Icon(Icons.shopping_cart_outlined, size: 30,),
                    // )),
                  ))),
                ],
                contents: <Widget>[
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const MonthlyCoffeeWidget(flag: '1',),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPagePineBlend(),
                                        ),
                                      );
                                    },
                                    child: const ProductWidget(
                                      price: "5.2",
                                      country: "Lembank",
                                      name: "Pine Blend",
                                      shape: "assets/shapes1.png",
                                      heroTag: "pine",
                                      productImage: "assets/pocket 1.png",
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(),
                                        ),
                                      );
                                    },
                                    child: const ProductWidget(
                                      price: "6.8",
                                      country: "Indonesia",
                                      name: "Kapal Air",
                                      shape: "assets/shapes2.png",
                                      heroTag: "kapal",
                                      productImage: "assets/pocket 2.png",
                                    ),
                                  ),
                                  const ProductWidget(
                                    price: "5.7",
                                    country: "Japan",
                                    name: "JCO Orginal",
                                    shape: "assets/shapes3.png",
                                    heroTag: "ico",
                                    productImage: "assets/pocket 3.png",
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const MonthlyCoffeeWidget(flag: '2',),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPageTrending(flag: '1',),
                                        ),
                                      );
                                    },
                                    child: const ProductWidget(
                                      price: "5.2",
                                      country: "Philipine",
                                      name: "Golden Beans",
                                      shape: "assets/shapes1.png",
                                      heroTag: "pine",
                                      productImage: "assets/6.png",
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPageTrending(flag: '2',),
                                        ),
                                      );
                                    },
                                    child: const ProductWidget(
                                      price: "6.8",
                                      country: "Indonesia",
                                      name: "Fix Coffee",
                                      shape: "assets/shapes2.png",
                                      heroTag: "kapal",
                                      productImage: "assets/11.png",
                                    ),
                                  ),
                                  const ProductWidget(
                                    price: "5.7",
                                    country: "Japan",
                                    name: "JCO Orginal",
                                    shape: "assets/shapes3.png",
                                    heroTag: "ico",
                                    productImage: "assets/pocket 3.png",
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const MonthlyCoffeeWidget(flag: '3',),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPagePineBlend(),
                                        ),
                                      );
                                    },
                                    child: const ProductWidget(
                                      price: "8.2",
                                      country: "Lembank",
                                      name: "Espresso",
                                      shape: "assets/shapes1.png",
                                      heroTag: "pine",
                                      productImage: "assets/13.png",
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(),
                                        ),
                                      );
                                    },
                                    child: const ProductWidget(
                                      price: "9.8",
                                      country: "Indonesia",
                                      name: "Americano",
                                      shape: "assets/shapes2.png",
                                      heroTag: "kapal",
                                      productImage: "assets/14.png",
                                    ),
                                  ),
                                  const ProductWidget(
                                    price: "5.7",
                                    country: "Japan",
                                    name: "JCO Orginal",
                                    shape: "assets/shapes3.png",
                                    heroTag: "ico",
                                    productImage: "assets/15.png",
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: Container(
                              margin:
                              const EdgeInsets.symmetric(horizontal: 3, vertical: 40),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  const MonthlyCoffeeWidget(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPagePineBlend(),
                                        ),
                                      );
                                    },
                                    child: const ProductWidget(
                                      price: "5.2",
                                      country: "Lembank",
                                      name: "Pine Blend",
                                      shape: "assets/shapes1.png",
                                      heroTag: "pine",
                                      productImage: "assets/pocket 1.png",
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DetailsPage(),
                                        ),
                                      );
                                    },
                                    child: const ProductWidget(
                                      price: "6.8",
                                      country: "Indonesia",
                                      name: "Kapal Air",
                                      shape: "assets/shapes2.png",
                                      heroTag: "kapal",
                                      productImage: "assets/pocket 2.png",
                                    ),
                                  ),
                                  const ProductWidget(
                                    price: "5.7",
                                    country: "Japan",
                                    name: "JCO Orginal",
                                    shape: "assets/shapes3.png",
                                    heroTag: "ico",
                                    productImage: "assets/pocket 3.png",
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
