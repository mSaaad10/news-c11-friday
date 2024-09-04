import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_c11_friday/api_manager/model/SourcesResponse.dart';

//https://newsapi.org/v2/top-headlines/sources?apiKey=be69a84c535c43928fdad67c7cd21548

class ApiManager {
  static const String baseUrl = 'newsapi.org';
  static const String apiKey = 'be69a84c535c43928fdad67c7cd21548';

  static Future<SourcesResponse> getSources(
    String categoryId,
  ) async {
    var url = Uri.https(baseUrl, 'v2/top-headlines/sources',
        {'apiKey': apiKey, 'category': categoryId});
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
}
