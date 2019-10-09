import 'package:meta/meta.dart';

class PhotoDbModel {
  @required
  final int surrogateId;
  @required
  final String id;
  @required
  final String createdAt;
  @required
  final String updatedAt;
  @required
  final int width;
  @required
  final int height;
  @required
  final String color;
  @required
  final String description;
  @required
  final String altDescription;
  @required
  final String rawUrl;
  @required
  final String fullUrl;
  @required
  final String regularUrl;
  @required
  final String smallUrl;
  @required
  final String thumbUrl;
  @required
  final String selfLink;
  @required
  final String htmlLink;
  @required
  final String download;
  @required
  final String downloadLocation;
  @required
  final int likes;

  PhotoDbModel({
    this.surrogateId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.width,
    this.height,
    this.color,
    this.description,
    this.altDescription,
    this.rawUrl,
    this.fullUrl,
    this.regularUrl,
    this.smallUrl,
    this.thumbUrl,
    this.selfLink,
    this.htmlLink,
    this.download,
    this.downloadLocation,
    this.likes
  });

  PhotoDbModel.fromDb(Map<String, dynamic> map)
    : surrogateId = map['surrogate_id'],
      id = map['id'],
      createdAt = map['created_at'],
      updatedAt = map['updated_at'],
      width = map['width'],
      height = map['height'],
      color = map['color'],
      description = map['description'],
      altDescription = map['alt_description'],
      rawUrl = map['raw_url'],
      fullUrl = map['full_url'],
      regularUrl = map['regular_url'],
      smallUrl = map['small_url'],
      thumbUrl = map['thumb_url'],
      selfLink = map['self_link'],
      htmlLink = map['html_link'],
      download = map['download'],
      downloadLocation = map['download_location'],
      likes = map['likes'];

  Map<String, dynamic> toMapForDb() {
    var map = Map<String, dynamic>();
    map['surrogate_id'] = surrogateId;
    map['id'] = id;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['width'] = width;
    map['height'] = height;
    map['color'] = color;
    map['description'] = description;
    map['alt_description'] = altDescription;
    map['raw_url'] = rawUrl;
    map['full_url'] = fullUrl;
    map['regular_url'] = regularUrl;
    map['small_url'] = smallUrl;
    map['thumb_url'] = thumbUrl;
    map['self_link'] = selfLink;
    map['html_link'] = htmlLink;
    map['download'] = download;
    map['download_location'] = downloadLocation;
    map['likes'] = likes;
    return map;
  }

}