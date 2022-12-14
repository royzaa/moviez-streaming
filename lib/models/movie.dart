import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../api_key.dart';

enum Type {
  top250,
  popular,
}

class Movie {
  final String title, crew, rating, imageUrl;
  const Movie({
    required this.crew,
    required this.imageUrl,
    required this.rating,
    required this.title,
  });

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      crew: map['crew'],
      imageUrl: map['image'],
      rating: map['imDbRating'],
      title: map['title'],
    );
  }

  /// IMDB API limit: 100 request per day
  static Future<List<Movie>> getData(Type type) async {
    final url = type == Type.top250
        ? 'https://imdb-api.com/en/API/Top250Movies/$apiKey'
        : 'https://imdb-api.com/en/API/MostPopularMovies/$apiKey';
    final uri = Uri.parse(url);

    final List<Movie> list = [];

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final List<dynamic> data = jsonData['items'];
      final String errorMsg = jsonData['errorMessage'];
      for (var e in data.sublist(0, 15)) {
        list.add(Movie.fromJson(e));
      }
      debugPrint(errorMsg);
    } else {
      debugPrint(response.statusCode.toString());
    }

    return list;
  }
}
