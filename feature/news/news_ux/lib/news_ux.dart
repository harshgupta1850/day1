library news_ux;

// /// A Calculator.
// class Calculator {
//   /// Returns [value] plus 1.
//   int addOne(int value) => value + 1;
// }

// import 'package:flutter/material.dart';
// import 'package:mystiq_types/feature_manifest.dart';
// import 'package:mystiq_types/mystiq_types.dart' as type;
// // import 'package:mystiq_types/platform.dart';
// // import 'package:mystiq_uikit/container/index.dart';
// // import 'package:news_api/news_api.dart';
// import 'content_models/index.dart' as cm;
// import 'stores/news_store.dart';

// final mainfest =
//     FeatureManifest(title: 'News', namespace: 'news', cardVariants: {
//   'summary': (context, model) {
//     NewsAPI().fetchArticles();
//     return ListTile(
//       tileColor: Colors.green,
//       title: Text(model.title ?? ''),
//       subtitle: Text(model.description ?? ''),
//     );
//   }
// });

// final manifest = FeatureManifest(
//   title: 'News Feature',
//   namespace: 'newsFeature',
//   customContentConfigurations: {
//     'custom.news': cm.NewsConfiguration.fromJson,
//   },
//   customVariants: {
//     'custom.news': (context, model) {
//       final query = (model.configuration as cm.NewsConfiguration).query;

//       Future<type.ContentItem> contentBuilder() =>
//           mystiq.di.get<NewsStore>().fetchContentModel(query);
//       return NetworkContent(contentBuilder: contentBuilder, model: model);
//     }
//   },
//   dataStoreConfigurations: {'store.news': cm.NewsStoreConfiguration.fromJson},
//   pageDataStores: {
//     'store.news': (model) async =>
//         type.mystiq.registerStore<NewsStore>(NewsStore(
//           configuration: model.configuration as cm.NewsStoreConfiguration,
//         )),
//   },
// );

import 'package:mystiq_types/mystiq_types.dart' as type;
import 'package:mystiq_types/platform.dart';
import 'package:mystiq_uikit/container/index.dart';
import 'content_models/index.dart' as cm;
import 'stores/news_store.dart';

final manifest = type.FeatureManifest(
  namespace: 'newsFeature',
  title: 'News Feature',
  customContentConfigurations: {
    'custom.news': cm.NewsConfiguration.fromJson,
  },
  customVariants: {
    'custom.news': (context, model) {
      final query = (model.configuration as cm.NewsConfiguration).query;

      Future<type.ContentItem> contentBuilder() =>
          mystiq.di.get<NewsStore>().fetchContentModel(query);

      return NetworkContent(contentBuilder: contentBuilder, model: model);
    }
  },
  dataStoreConfigurations: {'store.news': cm.NewsStoreConfiguration.fromJson},
  pageDataStores: {
    'store.news': (model) async =>
        type.mystiq.registerStore<NewsStore>(NewsStore(
          configuration: model.configuration as cm.NewsStoreConfiguration,
        )),
  },
);
