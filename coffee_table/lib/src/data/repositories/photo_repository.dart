import 'package:coffee_table/src/data/services/unsplash_api/responses/search_response.dart';
import 'package:coffee_table/src/data/services/unsplash_api/unsplash_api_provider.dart';

class PhotoRepository {
  final photosApiProvider = UnsplashApiProvider();

  Future<SearchResponse> fetchAllPhotos() => photosApiProvider.fetchPhotoList();

}