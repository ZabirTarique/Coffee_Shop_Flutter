import 'package:flutter/material.dart';
import '../widgets/overview_widget.dart';
import '../widgets/title_widget.dart';

class DetailsPageTrending extends StatelessWidget {
  const DetailsPageTrending({Key? key, this.flag}) : super(key: key);
  final String? flag;

  @override
  Widget build(BuildContext context) {
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
