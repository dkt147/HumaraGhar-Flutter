class SinglePropertyModel {
  String id;
  String name;
  String price;
  String agencyId;
  String propertyAreaId;
  String propertyCategoryId;
  String propertyLocationId;
  String propertyDeveloperId;
  String propertyHouseTypeId;
  String propertyTypeId;
  String isSold;
  String createdBy;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  List<PropertyAttachment> propertyAttachments;
  PropertyCity propertyCity;
  Map<String, List<FeaturesSubType>> featuresSubType;
  List<PropertyNearbyLocation> propertyNearbyLocations;
  List<FloorPlan> floorPlans;
  List<Agency> agencies;
  List<PropertyArea> propertyArea;
  List<PropertyCategory> propertyCategory;
  List<PropertyLocation> propertyLocation;
  List<PropertyDeveloper> propertyDeveloper;
  List<PropertyHouseType> propertyHouseType;
  List<PropertyType> propertyType;

  SinglePropertyModel({
    required this.id,
    required this.name,
    required this.price,
    required this.agencyId,
    required this.propertyAreaId,
    required this.propertyCategoryId,
    required this.propertyLocationId,
    required this.propertyDeveloperId,
    required this.propertyHouseTypeId,
    required this.propertyTypeId,
    required this.isSold,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.propertyAttachments,
    required this.propertyCity,
    required this.featuresSubType,
    required this.propertyNearbyLocations,
    required this.floorPlans,
    required this.agencies,
    required this.propertyArea,
    required this.propertyCategory,
    required this.propertyLocation,
    required this.propertyDeveloper,
    required this.propertyHouseType,
    required this.propertyType,
  });

  factory SinglePropertyModel.fromJson(Map<String, dynamic> json) {
    var attachmentsList = json['property_attachments'] as List;
    List<PropertyAttachment> attachments =
        attachmentsList.map((i) => PropertyAttachment.fromJson(i)).toList();

    var nearbyLocationsList = json['property_nearby_locations'] as List;
    List<PropertyNearbyLocation> nearbyLocations = nearbyLocationsList
        .map((i) => PropertyNearbyLocation.fromJson(i))
        .toList();

    var floorPlansList = json['floor_plans'] as List;
    List<FloorPlan> floorPlans =
        floorPlansList.map((i) => FloorPlan.fromJson(i)).toList();

    var agenciesList = json['agencies'] as List;
    List<Agency> agencies = agenciesList.map((i) => Agency.fromJson(i)).toList();

    var propertyAreaList = json['property_area'] as List;
    List<PropertyArea> propertyArea =
        propertyAreaList.map((i) => PropertyArea.fromJson(i)).toList();

    var propertyCategoryList = json['property_category'] as List;
    List<PropertyCategory> propertyCategory = propertyCategoryList
        .map((i) => PropertyCategory.fromJson(i))
        .toList();

    var propertyLocationList = json['property_location'] as List;
    List<PropertyLocation> propertyLocation = propertyLocationList
        .map((i) => PropertyLocation.fromJson(i))
        .toList();

    var propertyDeveloperList = json['property_developer'] as List;
    List<PropertyDeveloper> propertyDeveloper = propertyDeveloperList
        .map((i) => PropertyDeveloper.fromJson(i))
        .toList();

    var propertyHouseTypeList = json['property_house_type'] as List;
    List<PropertyHouseType> propertyHouseType = propertyHouseTypeList
        .map((i) => PropertyHouseType.fromJson(i))
        .toList();

    var propertyTypeList = json['property_type'] as List;
    List<PropertyType> propertyType =
        propertyTypeList.map((i) => PropertyType.fromJson(i)).toList();

    return SinglePropertyModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      agencyId: json['agency_id'],
      propertyAreaId: json['property_area_id'],
      propertyCategoryId: json['property_category_id'],
      propertyLocationId: json['property_location_id'],
      propertyDeveloperId: json['property_developer_id'],
      propertyHouseTypeId: json['property_house_type_id'],
      propertyTypeId: json['property_type_id'],
      isSold: json['is_sold'],
      createdBy: json['created_by'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      propertyAttachments: attachments,
      propertyCity: PropertyCity.fromJson(json['property_city']),
      featuresSubType: Map.from(json['features_sub_type']).map((k, v) => MapEntry<String, List<FeaturesSubType>>(
          k, List<FeaturesSubType>.from(v.map((x) => FeaturesSubType.fromJson(x))))),
      propertyNearbyLocations: nearbyLocations,
      floorPlans: floorPlans,
      agencies: agencies,
      propertyArea: propertyArea,
      propertyCategory: propertyCategory,
      propertyLocation: propertyLocation,
      propertyDeveloper: propertyDeveloper,
      propertyHouseType: propertyHouseType,
      propertyType: propertyType,
    );
  }
}

class PropertyAttachment {
  String id;
  String propertyId;
  String type;
  String size;
  String url;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  PropertyAttachment({
    required this.id,
    required this.propertyId,
    required this.type,
    required this.size,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PropertyAttachment.fromJson(Map<String, dynamic> json) {
    return PropertyAttachment(
      id: json['id'],
      propertyId: json['property_id'],
      type: json['type'],
      size: json['size'],
      url: json['url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class PropertyCity {
  String id;
  String name;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  PropertyCity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PropertyCity.fromJson(Map<String, dynamic> json) {
    return PropertyCity(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class FeaturesSubType {
  String sName;
  String sId;

  FeaturesSubType({
    required this.sName,
    required this.sId,
  });

  factory FeaturesSubType.fromJson(Map<String, dynamic> json) {
    return FeaturesSubType(
      sName: json['s_name'],
      sId: json['s_id'],
    );
  }
}

class PropertyNearbyLocation {
  String id;
  String nearbyType;
  String propertyId;
  String location;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  PropertyNearbyLocation({
    required this.id,
    required this.nearbyType,
    required this.propertyId,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PropertyNearbyLocation.fromJson(Map<String, dynamic> json) {
    return PropertyNearbyLocation(
      id: json['id'],
      nearbyType: json['nearby_type'],
      propertyId: json['property_id'],
      location: json['location'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class FloorPlan {
  String id;
  String propertyId;
  String title;
  String url;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  FloorPlan({
    required this.id,
    required this.propertyId,
    required this.title,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory FloorPlan.fromJson(Map<String, dynamic> json) {
    return FloorPlan(
      id: json['id'],
      propertyId: json['property_id'],
      title: json['title'],
      url: json['url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class Agency {
  String id;
  String name;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  Agency({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory Agency.fromJson(Map<String, dynamic> json) {
    return Agency(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class PropertyArea {
  String id;
  String name;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  PropertyArea({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PropertyArea.fromJson(Map<String, dynamic> json) {
    return PropertyArea(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class PropertyCategory {
  String id;
  String name;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  PropertyCategory({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PropertyCategory.fromJson(Map<String, dynamic> json) {
    return PropertyCategory(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class PropertyLocation {
  String id;
  String propertyCityId;
  String name;
  String location;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  PropertyLocation({
    required this.id,
    required this.propertyCityId,
    required this.name,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PropertyLocation.fromJson(Map<String, dynamic> json) {
    return PropertyLocation(
      id: json['id'],
      propertyCityId: json['property_city_id'],
      name: json['name'],
      location: json['location'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class PropertyDeveloper {
  String id;
  String name;
  String email;
  String phone;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  PropertyDeveloper({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PropertyDeveloper.fromJson(Map<String, dynamic> json) {
    return PropertyDeveloper(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class PropertyHouseType {
  String id;
  String propertyCategoryId;
  String name;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  PropertyHouseType({
    required this.id,
    required this.propertyCategoryId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PropertyHouseType.fromJson(Map<String, dynamic> json) {
    return PropertyHouseType(
      id: json['id'],
      propertyCategoryId: json['property_category_id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}

class PropertyType {
  String id;
  String name;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  PropertyType({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  factory PropertyType.fromJson(Map<String, dynamic> json) {
    return PropertyType(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}
