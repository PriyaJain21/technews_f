import 'package:flutter/material.dart';
import '../backend/functions.dart';
import '../components/appbar.dart';
import '../components/newsbox.dart';
import '../components/searchbar.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<dynamic>> news;

  handleSearchBtnClicked(String search) {
    news = searchNews(search);
  }


  @override
  void initState() {
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: appbar(),
        body: Column(
          children: [
            SearchBar(handleSearch: handleSearchBtnClicked,),
            Expanded(
              child: Container(
                  width: w,
                  child: FutureBuilder<List>(
                    future:news,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                imageurl:
                                snapshot.data![index]['urlToImage'] ?? Constants.imageurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]
                                ['description']
                                    .toString(),
                              );
                            });
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      // By default, show a loading spinner.
                      return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ));
                    },
                  ) ,
            ),
            ),
          ],
        ));
  }
}