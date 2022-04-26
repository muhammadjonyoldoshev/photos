import 'dart:convert';

import 'package:http/http.dart';
import 'package:photos/model/photos_model.dart';

class PhotoService{
  static const baseUrl = "jsonplaceholder.typicode.com";

  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8',
  };

  static const String apiPhotos = "/photos";
  static const String apiPhoto = "/photos/";

  static Future GET(String api, Map<String, String> headers) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await get(uri, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception("error");
    }
  }

  static Future<String> POST(String api, Map<String, String> headers, Map<String, dynamic> body) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await post(uri, headers: headers, body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception("error");
    }
  }

  static Future<String> PATCH(String api, Map<String, String> headers, Map<String, dynamic> body) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await patch(uri, headers: headers, body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception("error");
    }
  }

  static Future<String> PUT(String api, Map<String, String> headers, Map<String, dynamic> body) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await put(uri, headers: headers, body: jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception("error");
    }
  }

  static Future<String> DELETE(String api, Map<String, String> headers) async {
    Uri uri = Uri.https(baseUrl, api);
    Response response = await delete(uri, headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201){
      return response.body;
    }else{
      throw Exception("error");
    }
  }

  static List<Photo?> parsePhotoList(String body){
    List json = jsonDecode(body);
    List<Photo> todos = json.map((map) => Photo.fromJson(map)).toList();
    return todos;
  }

  static Photo parsePhoto(String body){
    Map<String, dynamic> json = jsonDecode(body);
    Photo photo = Photo.fromJson(json);
    return photo;
  }
}