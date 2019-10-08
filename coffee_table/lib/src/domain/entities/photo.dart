
import 'package:coffee_table/src/data/services/unsplash_api/responses/search_response.dart';
import 'package:coffee_table/src/data/services/unsplash_api/responses/search_response.dart' as unsplash;

class Photo {

  int _id;
  String _createdAt;
  String _updatedAt;
  int _width;
  int _height;
  String _color;
  String _description;
  String _altDescription;
  Url _urls;
  Links _links;
  int _likes;

  Photo(UnsplashPhoto _unsplashPhoto) {

  }

}

class Url {
  String _raw;
  String _full;
  String _regular;
  String _small;
  String _thumb;

  Url(unsplash.Urls urls) {
    _raw = urls.raw;
    _full = urls.full;
    _regular = urls.regular;
    _small = urls.small;
    _thumb = urls.thumb;
  }

  String get raw => _raw;
  String get full => _full;
  String get regular => _regular;
  String get small => _small;
  String get thumb => _thumb;
}

class Links {
  String _self;
  String _html;
  String _download;
  String _downloadLocation;

  Links(unsplash.Links links) {
    _self = links.self;
    _html = links.html;
    _download = links.download;
    _downloadLocation = links.downloadLocation;
  }

  String get self => _self;
  String get html => _html;
  String get download => _download;
  String get downloadLocation => _downloadLocation;
}