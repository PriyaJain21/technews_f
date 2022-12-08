import 'dart:convert';

import 'package:http/http.dart' as http;

import '../components/searchbar.dart';
import '../utils/key.dart';

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=us&apiKey=${Key.key}'),
  );
  Map result = jsonDecode(response.body);


  return (result['articles']);
}

Future<List> searchNews(String search) async {
  print(search);
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/everything?apiKey=${Key.key}&q=$search'),
  );

  Map result = jsonDecode(response.body);

  print(result);
  return (result['articles']);
}