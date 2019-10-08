

class SearchResponse {
  int _page;
  int _totalResults;
  int _totalPages;
  List<UnsplashPhoto> _results = [];


  SearchResponse.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];

    List<UnsplashPhoto> results = [];
    for(int i = 0; i < parsedJson['results'].length; i++) {
      UnsplashPhoto result = UnsplashPhoto(parsedJson['results'][i]);
      results.add(result);
    }
    _results = results;
  }

  int get page => _page;
  int get totalResults => _totalResults;
  int get totalPages => _totalPages;
  List<UnsplashPhoto> get results => _results;
}

class UnsplashPhoto {
  String _id;
  String _createdAt;
  String _updatedAt;
  int _width;
  int _height;
  String _color;
  String _description;
  String _altDescription;
  Urls _urls;
  Links _links;
  int _likes;

  UnsplashPhoto(result) {
    _id = result['id'];
    _createdAt = result['created_at'];
    _updatedAt = result['updated_at'];
    _width = result['width'];
    _height = result['height'];
    _color = result['color'];
    _description = result['description'];
    _altDescription = result['alt_description'];
    _urls = Urls(result['urls']);
    _links = Links(result['links']);
    _likes = result['likes'];
  }

  String get id => _id;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get width => _width;
  int get height => _height;
  String get color => _color;
  String get description => _description;
  String get altDescription => _altDescription;
  Urls get urls => _urls;
  Links get links => _links;
  int get likes => _likes;

}

class Urls {
  String _raw;
  String _full;
  String _regular;
  String _small;
  String _thumb;

  Urls(urls) {
    _raw = urls['raw'];
    _full = urls['full'];
    _regular = urls['regular'];
    _small = urls['small'];
    _thumb = urls['thumb'];
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

  Links(links) {
    _self = links['self'];
    _html = links['html'];
    _download = links['download'];
    _downloadLocation = links['download_location'];
  }

  String get self => _self;
  String get html => _html;
  String get download => _download;
  String get downloadLocation => _downloadLocation;
}