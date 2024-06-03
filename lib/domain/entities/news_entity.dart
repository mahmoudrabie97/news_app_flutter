class NewsEntity {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;
  final SourceEntity source;

  NewsEntity({required this.author, required this.title, required this.description, required this.url, required this.urlToImage, required this.publishedAt, required this.content, required this.source});
}

class SourceEntity {
  final String id;
  final String name;

  SourceEntity({required this.id, required this.name});
}
