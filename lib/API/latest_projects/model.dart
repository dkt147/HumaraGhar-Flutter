
/**
class LatestProjectModel {
  int? status;
  String? message;
  List<Projects>? projects;

  LatestProjectModel({this.status, this.message, this.projects});

  LatestProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  String? id;
  String? name;
  String? price;
  String? agencyId;
  String? propertyAreaId;
  String? propertyCategoryId;
  String? propertyLocationId;
  String? propertyDeveloperId;
  String? propertyHouseTypeId;
  String? propertyTypeId;
  String? isSold;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  Projects(
      {this.id,
      this.name,
      this.price,
      this.agencyId,
      this.propertyAreaId,
      this.propertyCategoryId,
      this.propertyLocationId,
      this.propertyDeveloperId,
      this.propertyHouseTypeId,
      this.propertyTypeId,
      this.isSold,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    agencyId = json['agency_id'];
    propertyAreaId = json['property_area_id'];
    propertyCategoryId = json['property_category_id'];
    propertyLocationId = json['property_location_id'];
    propertyDeveloperId = json['property_developer_id'];
    propertyHouseTypeId = json['property_house_type_id'];
    propertyTypeId = json['property_type_id'];
    isSold = json['is_sold'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['agency_id'] = this.agencyId;
    data['property_area_id'] = this.propertyAreaId;
    data['property_category_id'] = this.propertyCategoryId;
    data['property_location_id'] = this.propertyLocationId;
    data['property_developer_id'] = this.propertyDeveloperId;
    data['property_house_type_id'] = this.propertyHouseTypeId;
    data['property_type_id'] = this.propertyTypeId;
    data['is_sold'] = this.isSold;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
 */


//

class LatestProjectModel {
  int? status;
  String? message;
  List<Project>? response;

  LatestProjectModel({this.status, this.message, this.response});

  LatestProjectModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['response'] != null) {
      response = <Project>[];
      json['response'].forEach((v) {
        response!.add(Project.fromJson(v));
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

class Project {
  String? id;
  String? userId;
  String? userName;
  String? propertyId;
  String? name;
  String? price;
  String? attachmentType;
  String? attachmentSize;
  String? attachmentUrl;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Project({
    this.id,
    this.userId,
    this.userName,
    this.propertyId,
    this.name,
    this.price,
    this.attachmentType,
    this.attachmentSize,
    this.attachmentUrl,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userName = json['user_name'];
    propertyId = json['property_id'];
    name = json['name'];
    price = json['price'];
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
    data['name'] = this.name;
    data['price'] = this.price;
    data['attachment_type'] = this.attachmentType;
    data['attachment_size'] = this.attachmentSize;
    data['attachment_url'] = this.attachmentUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
