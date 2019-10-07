

class ItemModel {
  int _page;
  int _totalResults;
  int _totalPages;
  List<_Result> _results = [];


  ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];

    List<_Result> results = [];
    for(int i = 0; i < parsedJson['results'].length; i++) {
      _Result result = _Result(parsedJson['results'][i]);
      results.add(result);
    }
    _results = results;
  }

  int get page => _page;
  int get totalResults => _totalResults;
  int get totalPages => _totalPages;
  List<_Result> get results => _results;
}

class _Result {
  int _id;
  String _createdAt;
  String _updatedAt;
  int _width;
  int _height;
  String _color;
  String _description;
  String _altDescription;
  _Url _urls;
  _Links _links;
  int _likes;

  _Result(result) {
    _id = result['id'];
    _createdAt = result['created_at'];
    _updatedAt = result['updated_at'];
    _width = result['width'];
    _height = result['height'];
    _color = result['color'];
    _description = result['description'];
    _altDescription = result['alt_description'];
    _urls = _Url(result['urls']);
    _links = _Links(result['links']);
    _likes = result['likes'];
  }

  int get id => _id;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get width => _width;
  int get height => _height;
  String get color => _color;
  String get description => _description;
  String get altDescription => _altDescription;
  _Url get urls => _urls;
  _Links get links => _links;
  int get likes => _likes;

}

class _Url {
  String _raw;
  String _full;
  String _regular;
  String _small;
  String _thumb;

  _Url(urls) {
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

class _Links {
  String _self;
  String _html;
  String _download;
  String _download_location;

  _Links(links) {
    _self = links['self'];
    _html = links['html'];
    _download = links['download'];
    _download_location = links['download_location'];
  }

  String get self => _self;
  String get html => _html;
  String get download => _download;
  String get downloadLocation => _download_location;
}