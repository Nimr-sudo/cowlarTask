import 'dart:convert';

import '../Utilities/configuration.dart';
import 'package:http/http.dart'as http;
class Movies {
  String name;
  String id;
  String backDrop;
  String poster;
  String overView;
  String releaseDate;
  List genres=[];
  String trailerKey = '';
  Map nextArgs={};
  Movies({
    this.name='',
    this.id = '',
    this.backDrop='',
    this.poster='',
    this.overView='',
    this.releaseDate=''
  });
  Future<Map<String, dynamic>> getMovieDetails(String movieID) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieID?api_key=$apiKey'));
      var result = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print('get movie details');

        genres = result['genres'];
        print(genres);
        return result as Map<String, dynamic>;
      } else {
        print('exception in move details');
        return result as Map<String, dynamic>;
      }
    } catch (e) {
      // handle error
      print('Error: $e');
      return {};
    }
  }
  Future<Map<String, dynamic>> getMovieVideos(String movieID) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/movie/${movieID}/videos?api_key=$apiKey&type=Trailer'));
    if (response.statusCode == 200) {
      print('get movie videos');
      print(json.decode(response.body));
      var resp = json.decode(response.body);
      final teaser = resp['results'].firstWhere(
            (result) => result['type'] == 'Trailer',
        orElse: () => '',
      );
      print('printing teaset');

      print(teaser);
      trailerKey = teaser != '' ? teaser['key'] : teaser['key'];
      nextArgs = {
        'trailerKey': trailerKey,
      };
      print("Trailer Key: $trailerKey");
      return json.decode(response.body);
    } else {
      //throw Exception('Failed to load movie images');
      print('exception in movie player');
      return json.decode(response.body);
    }
  }
  ///////////
  Future<List<Movies>> fetchMoviesFromApi(int page) async {
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=05dee23f86abf205d7c36db7af088b8e&page=$page');

    var response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    ///////////decode
    var result = jsonDecode(response.body);
    print(result);
    List<Movies> movies = [];
    for (var item in result['results']) {  /////////// iterate thru the list
      ///////////for each item in the list we are creating an instance of movies model and adding it to the movies list.
      movies.add(Movies(
          name: item['original_title'],
          id: item['id'].toString(),
          backDrop: 'https://image.tmdb.org/t/p/w500${item['backdrop_path']}',
          poster: "https://image.tmdb.org/t/p/w500${item['poster_path']}",
          overView: item['overview'],
          releaseDate: item['release_date']));
    }
    return movies;
  }
}
// 'https://api.themoviedb.org/3/movie/${args.movieId}?api_key=$apiKey'));
// 'https://api.themoviedb.org/3/movie/${args.movieId}/videos?api_key=$apiKey&type=Trailer'));