class Image_model {
  late int id;
  late String url;
  late String title;

  Image_model(this.id, this.url, this.title);

  Image_model.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}
