import 'package:flutter/material.dart';

class MonthlyCoffeeWidget extends StatelessWidget {
  const MonthlyCoffeeWidget({Key? key, this.flag}) : super(key: key);
  final String? flag;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 30),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            height: 150,
            decoration: const BoxDecoration(
                color: Color(0xffF5F0E6),
                borderRadius: BorderRadius.only(topRight: Radius.circular(30))),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Monthly\nCoffee",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const Spacer(),
                Row(
                  children: [
                    if (flag == '1') const Text(
                      "\$12.9",
                      style: TextStyle(
                        color: Color(0xffE4886C),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    )   else if (flag == '3') const Text(
                      "\$20.9",
                      style: TextStyle(
                        color: Color(0xffE4886C),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    )else const Text(
                      "\$14.9",
                      style: TextStyle(
                        color: Color(0xffE4886C),
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const Text(
                      "/month",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: -25,
            //child: Image.asset("assets/box.png"),
            child: flag == '1' ? Image.asset("assets/box.png") : flag == '3' ? Image.asset("assets/10.png") :Image.asset("assets/12.png"),
          ),
        ],
      ),
    );
  }
}
