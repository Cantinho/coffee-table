

import 'package:coffee_table/src/data/repositories/photo_repository.dart';
import 'package:coffee_table/src/data/services/unsplash_api/responses/search_response.dart';
import 'package:rxdart/rxdart.dart';

class PhotosBloc {
  final _repository = PhotoRepository();
  final _photosFetcher = PublishSubject<SearchResponse>();

  Observable<SearchResponse> get allPhotos =>_photosFetcher.stream;

  fetchAllPhotos() async {
    SearchResponse searchResponse = await _repository.fetchAllPhotos();
    _photosFetcher.sink.add((searchResponse));
  }

  dispose() {
    _photosFetcher.close();
  }
}

final bloc = PhotosBloc();