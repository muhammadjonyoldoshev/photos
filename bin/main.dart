import 'package:photos/model/photos_model.dart';
import 'package:photos/service/photos_service.dart';

void main() async {
  String body = await PhotoService.GET(PhotoService.apiPhoto, PhotoService.headers);
  List<Photo?> photos = PhotoService.parsePhotoList(body);
  print(photos);

  Photo photos1 = Photo(albumId: 12, id: 7, title: 'name', url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952");
  String response = await PhotoService.POST(PhotoService.apiPhoto, PhotoService.headers, photos1.toJson());
  print("post: $response");


  String response1 = await PhotoService.GET(PhotoService.apiPhoto + photos1.id.toString(), PhotoService.headers);
  print("get: $response1");

  String response2 = await PhotoService.PUT(PhotoService.apiPhoto + photos1.id.toString(), PhotoService.headers, photos1.toJson());
  print("put: $response2");

  String response4 = await PhotoService.PATCH(PhotoService.apiPhoto + photos1.id.toString(), PhotoService.headers,{'title': "flutter"});
  print("patch: $response4");

  String response3 = await PhotoService.DELETE(PhotoService.apiPhoto + photos1.id.toString(),PhotoService.headers);
  print("delete: $response3");
}
