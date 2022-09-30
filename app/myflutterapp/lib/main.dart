import 'package:mystiq/manifest.dart' as core;
import 'package:mystiq/mystiq.dart' as mystiq;
import 'package:mystiq_plugin_get_it/mystiq_plugin_get_it.dart';
import 'package:mystiq_plugin_hive/mystiq_plugin_hive.dart';
import 'package:mystiq_plugin_sanity/mystiq_plugin_sanity.dart';
import 'package:mystiq_plugin_shared_preferences/mystiq_plugin_shared_preferences.dart';
import 'package:mystiq_uikit/mystiq_uikit.dart' as ui;
import 'package:news_ux/news_ux.dart' as news;

void main() {
  final content = SanityContentPlugin(
      dataset: 'production',
      projectId: 'yhevzxbn',
      token:
          'skbIxneio3iufdDkzDXKF8kwskE3uUSOaxzjafXzELTubTU0ev2ohbavD3XlUUrtgVZVZk52B974Y1v8ssLpV0LFYWnBqvT2v3ZDUSKJfwqbUvnd05p3AxU6VJiMECJI17RbMQtMP1DIWwHv8Jc1VMaheWazOnsCm03Isjry4NO2rPTiN1kv');

  final storage = HiveStoragePlugin(keySpace: 'myflutterapp');

  final secureStorage =
      SharedPreferencesStoragePlugin(keySpace: 'myflutterapp');

  final depandancy = GetItDependencyInjectionPlugin();

  mystiq.runApp(
      features: [core.manifest, news.manifest],
      contentPlugin: content,
      storagePlugin: storage,
      secureStoragePlugin: secureStorage,
      dependencyInjectionPlugin: depandancy,
      routeMapBuilder: () => mystiq.MystiqRouteMap(routes: {
            '/': (route) => ui.ContentPage(
                  path: '/home',
                ),
          }));
}
