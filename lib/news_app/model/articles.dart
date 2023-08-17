class Article {
  final String? author;
  final String title;
  final String urlToImage;
  final String url;
  final String content;
  final String publishedAt;

  const Article(
      {this.author,
      required this.title,
      required this.urlToImage,
      required this.url,
      required this.content,
      required this.publishedAt});
  factory Article.fromJson(Map map) {
    return Article(
        title: map['title'] ?? "",
        author: map['author'] ?? "",
        urlToImage: map['urlToImage'] ?? "",
        url: map['url'] ?? "",
        content: map['content'] ?? "",
        publishedAt: map['publishedAt'] ?? "");
  }
}
// {
// -"source": {
// "id": "reuters",
// "name": "Reuters"
// },
// "author": "Kane Wu",
// "title": "Asian stocks slip as China data continues to disappoint - Reuters",
// "description": "Asian stocks stumbled on Wednesday, as more disappointing Chinese economic data and the absence of meaningful stimulus from Beijing continued to weigh on investor sentiment.",
// "url": "https://www.reuters.com/markets/global-markets-wrapup-1-2023-08-16/",
// "urlToImage": "https://www.reuters.com/resizer/ip8qer8P1SG6nQSdSAe_7e_D1iE=/1200x628/smart/filters:quality(80)/cloudfront-us-east-2.images.arcpublishing.com/reuters/JAQ6SVUAKRKMXCEYFJ5WFEQQXQ.jpg",
// "publishedAt": "2023-08-16T06:16:08Z",
// "content": "HONG KONG, Aug 16 (Reuters) - Asian stocks stumbled on Wednesday, as more disappointing Chinese economic data and the absence of meaningful stimulus from Beijing continued to weigh on investor sentim… [+3311 chars]"
// }