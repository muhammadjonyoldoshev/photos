class Photo {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photo({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  Photo.fromJson(Map<String, dynamic> json){
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }

  Map<String, dynamic> toJson () => {
    'albumId': albumId,
    'id': id,
    'title': title,
    'url': url,
    'thumbnailUrl': thumbnailUrl,
  };

  @override
  String toString() {
    // TODO: implement toString
    return "AlbumId: $albumId\nId: $id\nTitle: $title\nUrl: $url\nThumbnailUrl: $thumbnailUrl";
  }
}