import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../database/db_helper.dart';
import '../model/cart_model.dart';
import '../provider/cart_provider.dart';
import '../widgets/overview_widget.dart';
import '../widgets/title_widget.dart';

class DetailsPageTrending extends StatelessWidget {
   DetailsPageTrending({Key? key, this.flag}) : super(key: key);
  final String? flag;
  final DBHelper dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    void saveData(int index, String? prodName, int? initPrice, int? prodPrice, String? unit, String? img) {
      dbHelper
          .insert(
        Cart(
          id: index,
          productId: index.toString(),
          productName: prodName,
          initialPrice: initPrice,
          productPrice: prodPrice,
          quantity: ValueNotifier(1),
          unitTag: unit,
          image: img,
        ),
      )
          .then((value) {
        cart.addTotalPrice(prodPrice!.toDouble());
        cart.addCounter();
        print('Product Added to cart');
      }).onError((error, stackTrace) {
        Alert(
          context: context,
          type: AlertType.info,
          title: "Cart Info",
          desc: "This item is already added in the cart",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: const Text(
                "ok",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
        print("error.toString()");
        print(error.toString());
      });
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 399,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 310,
                      height: 399,
                      decoration: const BoxDecoration(
                        color: Color(0xffF5F0E6),
                        image: DecorationImage(
                          image: AssetImage("assets/lines.png"),
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: 30),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  "Indonesia",
                                  style: TextStyle(fontSize: 20),
                                ),
                                const SizedBox(height: 10),
                                flag == '1' ? const Text(
                                  "Golden Beans",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ): const Text(
                                  "Fix Coffee",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),

                                const SizedBox(height: 25),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffF5C168),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: const Text(
                                    "Robusta Gold",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 35),
                                const Text(
                                  "\$6.5",
                                  style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: -70,
                            right: -30,
                            child: Hero(
                                tag: "kapal",
                                child: flag == '1' ? Image.asset(
                                  "assets/6.1.png",
                                ) : Image.asset(
                                 "assets/11.1.png",
                                )),
                          ),
                          Positioned(
                            bottom: -20,
                            right: 180,
                            child: GestureDetector(
                              onTap: (){
                                flag == '1' ? saveData(3,"Golden Beans",6,30,'Kg','assets/6.png') : saveData(4,"Fix Coffee",6,40,'Kg','assets/11.png');
                                //void saveData(int index, String? prodName, int? initPrice, int? prodPrice, String? unit, String? img)

                                print('working');
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Add",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 25),
                                    Image.asset("assets/add-to-cart.png"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 310,
                      child: const Padding(
                        padding: EdgeInsets.only(),
                        child: Row(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                child: Column(
                  children: [
                    TitleWidget(title: "Overview"),
                    SizedBox(height: 50),
                    Row(
                      children: [
                        OverviewWidget(
                          title: "1100-1650m",
                          subtitle: "Altitude",
                          imagePath: "assets/subject1.png",
                        ),
                        SizedBox(width: 20),
                        OverviewWidget(
                          title: "Washed",
                          subtitle: "Processing",
                          imagePath: "assets/subject2.png",
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        OverviewWidget(
                          title: "Parongpong",
                          subtitle: "Location",
                          imagePath: "assets/subject3.png",
                        ),
                        SizedBox(width: 20),
                        OverviewWidget(
                          title: "SLN9",
                          subtitle: "Varietal",
                          imagePath: "assets/subject5.png",
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    TitleWidget(title: "Description"),
                    SizedBox(height: 20),
                    Text(
                      "This whole coffee bean has hazelnut, honey, and grapes taste siap lah kumaha maneh weh nya nu penting ieu kaeusian paragraphna contoh aja biar kalo panjang keliatan.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
