import 'package:flutter/material.dart';
import 'package:webtoon_app/models/webtoon_model.dart';
import 'package:webtoon_app/services/api_service.dart';
import 'package:webtoon_app/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final Future<List<WebtoonInfo>> webtoons = WebtoonApiService.getWebtoons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("오늘의 웹툰"),
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 2,
      ),
      body: Center(
        child: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                child: makeWebtoonList(snapshot),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  ListView makeWebtoonList(AsyncSnapshot<List<WebtoonInfo>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      itemBuilder: (context, index) {
        var webtoon = snapshot.data![index];
        return WebtoonCard(webtoon: webtoon);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          width: 50,
        );
      },
    );
  }
}
