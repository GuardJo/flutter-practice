import 'package:flutter/material.dart';

class MoneyCard extends StatelessWidget {
  final String moneyType;
  final String moneyValue;
  final String moneyCode;
  final IconData iconData;
  final bool isReversed;
  final int order;

  final Color _baseColor = const Color.fromARGB(255, 29, 29, 29);

  const MoneyCard({
    super.key,
    required this.moneyType,
    required this.moneyValue,
    required this.moneyCode,
    required this.iconData,
    required this.isReversed,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, (order * -20)),
      child: Container(
        decoration: BoxDecoration(
          color: isReversed ? Colors.white : _baseColor,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 25,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    moneyType,
                    style: TextStyle(
                      color: isReversed ? _baseColor : Colors.white,
                      fontSize: 38,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        moneyValue,
                        style: TextStyle(
                          color: isReversed ? _baseColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        moneyCode,
                        style: TextStyle(
                          color: isReversed ? _baseColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                scale: 2.5,
                child: Transform.translate(
                  offset: const Offset(0, 10),
                  child: Icon(
                    iconData,
                    color: isReversed ? _baseColor : Colors.white,
                    size: 70,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
