library news_api;

import 'dart:io';
import 'package:mystiq_types/mystiq_types.dart';

/// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }

class NewsAPI {
  Future<void> fetchArticles() async {
    print('random');
    final response = await mystiq.network.get(Uri.parse(
        'https://newsapi.org/v2/everything?apiKey=083fc1fcd23a4aeb88577f1a27d6abe1&q=sports&pageSize=10'));
    if (response.statusCode == HttpStatus.ok) {
      print('hello');
      print(response.body);
    } else {
      print('hello');
      throw Exception('API failed');
    }
  }
}
