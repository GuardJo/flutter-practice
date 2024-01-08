import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo((size.width - 50), 0);
    path.lineTo(size.width, 50);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

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
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          decoration: BoxDecoration(
            color: isReversed ? Colors.white : _baseColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
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
      ),
    );
  }
}
