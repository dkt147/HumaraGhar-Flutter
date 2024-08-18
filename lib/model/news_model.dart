/* 
class NewsModel {
  int? status;
  String? message;
  List<Null>? news;

  NewsModel({this.status, this.message, this.news});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['news'] != null) {
      news = <Null>[];
      json['news'].forEach((v) {
        // news!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.news != null) {
      // data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

*/
////////////////////////


class NewsModel {
  int? status;
  String? message;
  List<News>? news;

  NewsModel({this.status, this.message, this.news});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(News.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class News {
  String? id;
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Content>? content;

  News(
      {this.id,
      this.title,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.content});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(Content.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Content {
  String? heading;
  String? body;

  Content({this.heading, this.body});

  Content.fromJson(Map<String, dynamic> json) {
    heading = json['heading'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['heading'] = this.heading;
    data['body'] = this.body;
    return data;
  }
}
