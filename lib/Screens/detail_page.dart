import 'package:flutter/material.dart';
import 'package:newsapp/Widgets/build_icon.dart';

class DetailPage extends StatelessWidget {
  final String head;
  final String image;
  final String content;

  const DetailPage(
      {super.key,
      required this.head,
      required this.image,
      required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF32373f),
      appBar: AppBar(
        backgroundColor: const Color(0xFF32373f),
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: BuildIcon(
              icon: Icons.arrow_back_ios_new,
              size: 28,
              color: Colors.grey,
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 60,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 35, left: 20),
          child: Image.asset(
            'assets/images/cbs_news_white.png',
            fit: BoxFit.contain,
            height: 60,
            width: 230,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                head,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Image.network(image),
              const SizedBox(height: 20),
              Text(
                content,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
