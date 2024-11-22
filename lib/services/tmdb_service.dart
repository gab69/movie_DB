import 'dart:convert';
import 'package:http/http.dart' as http;

class TMDBService {
  final String apiKey = '1dedc2d8bdb74b49db7b45a74d438476';
  final String baseUrl = 'https://api.themoviedb.org/3';

  Future<List<dynamic>> getPopularMovies() async {
    final response =
    await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Error al obtener las películas populares');
    }
  }
}
