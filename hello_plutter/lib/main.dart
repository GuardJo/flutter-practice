import 'package:flutter/material.dart';
import 'package:hello_plutter/widgets/button.dart';
import 'package:hello_plutter/widgets/card.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff181818),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          "Hey Kyeongho",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Welcom Back",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "\$5 194 382",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const MainButton(
                      bgColor: Colors.amber,
                      text: "Transfer",
                      textColor: Colors.black,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    MainButton(
                      bgColor: Colors.white.withOpacity(0.1),
                      text: "Request",
                      textColor: Colors.white.withOpacity(0.9),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const MoneyCard(
                  moneyType: "Euro",
                  moneyValue: "6 428",
                  moneyCode: "EUR",
                  iconData: Icons.euro_sharp,
                  isReversed: false,
                  order: 0,
                ),
                const MoneyCard(
                  moneyType: "dollar",
                  moneyValue: "3 250",
                  moneyCode: "USD",
                  iconData: Icons.attach_money,
                  isReversed: true,
                  order: 1,
                ),
                const MoneyCard(
                  moneyType: "bitcoin",
                  moneyValue: "6 213",
                  moneyCode: "BT",
                  iconData: Icons.currency_bitcoin,
                  isReversed: false,
                  order: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
