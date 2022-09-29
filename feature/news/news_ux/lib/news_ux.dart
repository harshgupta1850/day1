library news_ux;

// /// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }

import 'package:flutter/material.dart';
import 'package:mystiq_types/feature_manifest.dart';
import 'package:news_api/news_api.dart';

final mainfest =
    FeatureManifest(title: 'News', namespace: 'news', cardVariants: {
  'summary': (context, model) {
    NewsAPI().fetchArticles();
    return ListTile(
      tileColor: Colors.green,
      title: Text(model.title ?? ''),
      subtitle: Text(model.description ?? ''),
    );
  }
});
