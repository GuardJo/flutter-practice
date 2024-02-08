import 'package:flutter/material.dart';
import 'package:webtoon_app/models/webtoon_model.dart';
import 'package:webtoon_app/screens/detail_screen.dart';

class WebtoonCard extends StatelessWidget {
  final WebtoonInfo webtoon;

  const WebtoonCard({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return WebtoonDetailScreen(webtoon: webtoon);
            },
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: webtoon.id,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(10, -10),
                    blurRadius: 15,
                  ),
                ],
              ),
              clipBehavior: Clip.hardEdge,
              width: 200,
              child: Image.network(webtoon.thumb),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            webtoon.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
