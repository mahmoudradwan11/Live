class SearchModel {
  String? status;
  int? totalResults;
  List<ArticlesSearchModel> articles = [];
  SearchModel({required this.status, required this.totalResults, required this.articles});

  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <ArticlesSearchModel>[];
      json['articles'].forEach((v) {
        articles.add(ArticlesSearchModel.fromJson(v));
      });
    }
  }
}
class ArticlesSearchModel{
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage ;
  String? publishedAt;
  String? content;

  ArticlesSearchModel(
      {required this.source,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content});

  ArticlesSearchModel.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ?Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}
class Source {
  String? id;
  String? name;
  Source({required this.id, required this.name});
  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}