import 'package:coffee_table/src/app/pages/photos/photos_bloc.dart';
import 'package:coffee_table/src/data/services/unsplash_api/responses/search_response.dart';
import 'package:flutter/material.dart';

class PhotoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllPhotos();
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee Table"),
      ),
      body: StreamBuilder(
        stream: bloc.allPhotos,
        builder: (context, AsyncSnapshot<SearchResponse> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  buildList(AsyncSnapshot<SearchResponse> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.results.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(snapshot.data.results[index].urls.thumb,
            fit: BoxFit.cover,);
        });
  }

}