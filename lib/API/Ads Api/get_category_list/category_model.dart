

class PropertyAdsCategoryModel {
  int? status;
  String? message;
  PropertyData? data;

  PropertyAdsCategoryModel({this.status, this.message, this.data});

  PropertyAdsCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? PropertyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PropertyData {
  List<PropertyCategory>? house;
  List<PropertyCategory>? plot;
  List<PropertyCategory>? commercial;

  PropertyData({this.house, this.plot, this.commercial});

  PropertyData.fromJson(Map<String, dynamic> json) {
    if (json['House'] != null) {
      house = <PropertyCategory>[];
      json['House'].forEach((v) {
        house!.add(PropertyCategory.fromJson(v));
      });
    }
    if (json['Plot'] != null) {
      plot = <PropertyCategory>[];
      json['Plot'].forEach((v) {
        plot!.add(PropertyCategory.fromJson(v));
      });
    }
    if (json['Commercial'] != null) {
      commercial = <PropertyCategory>[];
      json['Commercial'].forEach((v) {
        commercial!.add(PropertyCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (house != null) {
      data['House'] = house!.map((v) => v.toJson()).toList();
    }
    if (plot != null) {
      data['Plot'] = plot!.map((v) => v.toJson()).toList();
    }
    if (commercial != null) {
      data['Commercial'] = commercial!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PropertyCategory {
  String? id;
  String? propertyCategoryId;
  String? name;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? categoryName;

  PropertyCategory({
    this.id,
    this.propertyCategoryId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.categoryName,
  });

  PropertyCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    propertyCategoryId = json['property_category_id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['property_category_id'] = propertyCategoryId;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['category_name'] = categoryName;
    return data;
  }
}
