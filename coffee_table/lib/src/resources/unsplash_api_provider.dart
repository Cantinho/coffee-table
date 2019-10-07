import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class UnsplashApiProvider {

  Client client = Client();
  final _apiKey = 'your_api_key';

}