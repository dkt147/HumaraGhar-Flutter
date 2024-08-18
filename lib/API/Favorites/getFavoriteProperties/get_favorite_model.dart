class FavoritePropertiesModel {
  int? status;
  String? message;
  List<Response>? response;

  FavoritePropertiesModel({this.status, this.message, this.response});

  FavoritePropertiesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['response'] != null) {
      response = <Response>[];
      json['response'].forEach((v) {
        response!.add(new Response.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Response {
  String? id;
  String? userId;
  String? userName;
  String? propertyId;
  String? propertyName;
  String? attachmentType;
  String? attachmentSize;
  String? attachmentUrl;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  Response(
      {this.id,
      this.userId,
      this.userName,
      this.propertyId,
      this.propertyName,
      this.attachmentType,
      this.attachmentSize,
      this.attachmentUrl,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Response.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    propertyId = json['property_id'];
    propertyName = json['property_name'];
    attachmentType = json['attachment_type'];
    attachmentSize = json['attachment_size'];
    attachmentUrl = json['attachment_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['property_id'] = this.propertyId;
    data['property_name'] = this.propertyName;
    data['attachment_type'] = this.attachmentType;
    data['attachment_size'] = this.attachmentSize;
    data['attachment_url'] = this.attachmentUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
