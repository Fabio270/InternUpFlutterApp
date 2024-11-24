import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:app/model/user_post_model.dart';

class Data {
  static Future<List<UserPostModel>> fetchPosts() async {
    final url = Uri.parse("https://internup.com.br/api/positions?search=developer&location=Old+Toronto%2C+Ontario");

    // Cria um HttpClient que ignora a validação SSL
    final httpClient = HttpClient()
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

    // Cria um IOClient usando o HttpClient personalizado
    final IOClient client = IOClient(httpClient);

    try {
      // Faz a requisição
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        
        // A chave "data" contém a lista de posts
        final List<dynamic> jsonList = jsonResponse['results'] as List<dynamic>;

        return jsonList
            .map((json) => UserPostModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception("Failed to load posts: ${response.statusCode}");
      }
    } finally {
      // Fecha o cliente para liberar recursos
      client.close();
    }
  }
}
