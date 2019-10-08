import 'dart:async';
import 'dart:io';
import 'package:coffee_table/auth/keys.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'responses/search_response.dart';

class UnsplashApiProvider {

  Client client = Client();
  final String _baseUrl = "https://api.unsplash.com";

  Future<SearchResponse> fetchPhotoList() async {
    print("entered");

    final secret = await SecretLoader(secretPath: "assets/secrets/secrets.json").load();
    final apiKey = secret.apiKey;

    final response = await client
      .get("$_baseUrl/search/photos?query=coffee",
      headers: {
        HttpHeaders.acceptHeader: "v1",
        "Authorization": "Client-ID $apiKey"
      }
    );

    print(response.body.toString());
    if(response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return SearchResponse.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error..
      throw Exception('Failed to load post');
    }
  }

}

// headers
// Accept-Version: v1
// Authorization: Client-ID 02dfe251d1949e00dfdd5112ba0ab2ee273b1775ef0dbb9cdb1faf3634c2fa9a

// query
// query: coffee