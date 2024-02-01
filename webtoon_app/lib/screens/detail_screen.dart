import 'package:flutter/material.dart';
import 'package:webtoon_app/models/webtoon_model.dart';

class WebtoonDetailScreen extends StatelessWidget {
  final WebtoonInfo webtoon;
  const WebtoonDetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(webtoon.title),
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
                width: 300,
                child: Image.network(webtoon.thumb),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
