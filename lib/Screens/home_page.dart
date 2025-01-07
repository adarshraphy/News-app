import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Screens/detail_page.dart';
import 'package:newsapp/Widgets/build_icon.dart';
import 'package:newsapp/Widgets/build_text.dart';
import 'package:newsapp/models/news_response_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;
  Dio dio = Dio();
  NewsResponseModel? newsResponseModel;

  getNews() async {
    final response = await dio.get(
        "https://gnews.io/api/v4/top-headlines?category=general&lang=en&country=kerala&max=10&apikey=a58bbd55973122cdee012ec31707307b");
    print(response);
    print(response.data["articles"][0]["title"]);
    if (response.statusCode == 200) {
      newsResponseModel = NewsResponseModel.fromJson(response.data);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF32373f),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 95, top: 10),
                      child: Image.asset(
                        "assets/images/cbs_news_white.png",
                        width: 230,
                        height: 100,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 28, top: 20),
                  child: Row(
                    children: [
                      BuildText(
                        text1: "Top news",
                        color: Colors.grey,
                        weight: FontWeight.w400,
                        size: 20,
                      ),
                      BuildIcon(
                        icon: Icons.local_fire_department,
                        size: 28,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Expanded(
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, top: 25),
                                child: BuildText(
                                  text1: newsResponseModel
                                          ?.articles?[index].title ??
                                      "",
                                  color: Colors.white,
                                  weight: FontWeight.bold,
                                  size: 20,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Image.network(
                                    newsResponseModel!.articles![index].image!),
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: BuildText(
                                  text1: newsResponseModel!.articles![index].content!.substring(0,
                                      newsResponseModel!.articles![index].content!.length > 100 ? 100 : newsResponseModel!.articles![index].content!.length) +
                                      (newsResponseModel!.articles![index].content!.length > 100 ? '...' : ''),
                                  color: Colors.white,
                                  weight: FontWeight.w500,
                                  size: 12,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 28, left: 15),
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      child: Row(
                                        children: [
                                          BuildText(
                                            text1: "Learn More",
                                            color: Colors.grey,
                                            weight: FontWeight.w400,
                                            size: 15,
                                          ),
                                          BuildIcon(
                                            icon: Icons.arrow_forward_ios,
                                            size: 18,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetailPage(
                                              head: newsResponseModel!
                                                  .articles![index].title!,
                                              image: newsResponseModel!
                                                  .articles![index].image!,
                                              content: newsResponseModel!.articles![index].content!,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    const SizedBox(width: 160),
                                    // BuildIcon(
                                    // icon: Icons.visibility,
                                    //size: 18,
                                    //color: Colors.grey,
                                    //),
                                    //const SizedBox(width: 3),
                                    //BuildText(
                                    // text1: newslist[index].views,
                                    //color: Colors.grey,
                                    //weight: FontWeight.w400,
                                    //size: 12,
                                    //  ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 8.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFF394048),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
