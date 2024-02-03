import 'package:flutter/material.dart';
import 'package:webtoon_app/models/webtoon_detail.dart';
import 'package:webtoon_app/models/webtoon_model.dart';
import 'package:webtoon_app/services/api_service.dart';

class WebtoonDetailScreen extends StatefulWidget {
  final WebtoonInfo webtoon;

  const WebtoonDetailScreen({
    super.key,
    required this.webtoon,
  });

  @override
  State<WebtoonDetailScreen> createState() => _WebtoonDetailScreenState();
}

class _WebtoonDetailScreenState extends State<WebtoonDetailScreen> {
  late final Future<WebtoonDetail> webtoonDetail;

  @override
  void initState() {
    super.initState();
    webtoonDetail = WebtoonApiService.getWebtoonDetailById(widget.webtoon.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.webtoon.title),
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: widget.webtoon.id,
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
                    width: 300,
                    child: Image.network(widget.webtoon.thumb),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: webtoonDetail,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data!;
                  return Column(
                    children: [
                      Text(data.about),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("${data.age} / ${data.genre}")
                    ],
                  );
                } else {
                  return const Text("...");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
