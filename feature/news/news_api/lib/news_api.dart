library news_api;

import 'dart:convert';
import 'dart:io';

import 'package:mystiq_types/mystiq_types.dart';

import 'model/article.dart';

class NewsAPI {
  final String apiKey;

  NewsAPI({required this.apiKey});

  Future<List<Article>> fetchArticles({required String query}) async {
    final url = Uri.https('newsapi.org', '/v2/everything',
        <String, String>{'q': query, 'apiKey': apiKey});

    final response = await mystiq.network.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final newsPayload = NewsResponsePayload.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
      return newsPayload.articles;
    } else {
      throw Exception('API Failed');
    }
  }
}

// import 'dart:io';
// import 'package:mystiq_types/mystiq_types.dart';

// /// A Calculator.
// // class Calculator {
// //   /// Returns [value] plus 1.
// //   int addOne(int value) => value + 1;
// // }

// class NewsAPI {
//   Future<void> fetchArticles() async {
//     print('random');
//     final response = await mystiq.network.get(Uri.parse(
//         'https://newsapi.org/v2/everything?apiKey=083fc1fcd23a4aeb88577f1a27d6abe1&q=sports&pageSize=10'));
//     if (response.statusCode == HttpStatus.ok) {
//       print('hello');
//       print(response.body);
//     } else {
//       print('hello');
//       throw Exception('API failed');
//     }
//   }
// }
