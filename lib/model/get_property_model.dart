class PropertyAttachment {
  final String id;
  final String propertyId;
  final String type;
  final String size;
  final String url;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  PropertyAttachment({
    required this.id,
    required this.propertyId,
    required this.type,
    required this.size,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  PropertyCity({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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

class FeatureSubType {
  final String sName;
  final String sId;

  FeatureSubType({
    required this.sName,
    required this.sId,
  });

  factory FeatureSubType.fromJson(Map<String, dynamic> json) {
    return FeatureSubType(
      sName: json['s_name'],
      sId: json['s_id'],
    );
  }
}

class PropertyNearbyLocation {
  final String id;
  final String nearbyType;
  final String propertyId;
  final String location;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  PropertyNearbyLocation({
    required this.id,
    required this.nearbyType,
    required this.propertyId,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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
  final String id;
  final String propertyId;
  final String title;
  final String url;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  FloorPlan({
    required this.id,
    required this.propertyId,
    required this.title,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  Agency({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  PropertyArea({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  PropertyCategory({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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
  final String id;
  final String propertyCityId;
  final String name;
  final String location;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  PropertyLocation({
    required this.id,
    required this.propertyCityId,
    required this.name,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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
  final String id;
  final String name;
  final String email;
  final String phone;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  PropertyDeveloper({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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
  final String id;
  final String propertyCategoryId;
  final String name;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  PropertyHouseType({
    required this.id,
    required this.propertyCategoryId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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
  final String id;
  final String name;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;

  PropertyType({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
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

class Property {
  final String id;
  final String name;
  final String price;
  final String agencyId;
  final String propertyAreaId;
  final String propertyCategoryId;
  final String propertyLocationId;
  final String propertyDeveloperId;
  final String propertyHouseTypeId;
  final String propertyTypeId;
  final String isSold;
  final String createdBy;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt;
  final List<PropertyAttachment> propertyAttachments;
  final PropertyCity propertyCity;
  // final Map<String, List<FeatureSubType>> featuresSubType;
  final List<PropertyNearbyLocation> propertyNearbyLocations;
  final List<FloorPlan> floorPlans;
  final List<Agency> agencies;
  final List<PropertyArea> propertyAreas;
  final List<PropertyCategory> propertyCategories;
  final List<PropertyLocation> propertyLocations;
  final List<PropertyDeveloper> propertyDevelopers;
  final List<PropertyHouseType> propertyHouseTypes;
  final List<PropertyType> propertyTypes;

  Property({
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
    this.deletedAt,
    required this.propertyAttachments,
    required this.propertyCity,
    // required this.featuresSubType,
    required this.propertyNearbyLocations,
    required this.floorPlans,
    required this.agencies,
    required this.propertyAreas,
    required this.propertyCategories,
    required this.propertyLocations,
    required this.propertyDevelopers,
    required this.propertyHouseTypes,
    required this.propertyTypes,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
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
      propertyAttachments: (json['property_attachments'] as List)
          .map((attachment) => PropertyAttachment.fromJson(attachment))
          .toList(),
      propertyCity: PropertyCity.fromJson(json['property_city']),
      // featuresSubType: Map<String, List<FeatureSubType>>.from(json['features_sub_type'] ?? {})
      //     .map((key, value) => MapEntry<String, List<FeatureSubType>>(
      //           key,
      //           (value as List).map((subType) => FeatureSubType.fromJson(subType)).toList(),
      //         )),
      propertyNearbyLocations: (json['property_nearby_locations'] as List)
          .map((location) => PropertyNearbyLocation.fromJson(location))
          .toList(),
      floorPlans: (json['floor_plans'] as List)
          .map((plan) => FloorPlan.fromJson(plan))
          .toList(),
      agencies: (json['agencies'] as List)
          .map((agency) => Agency.fromJson(agency))
          .toList(),
      propertyAreas: (json['property_area'] as List)
          .map((area) => PropertyArea.fromJson(area))
          .toList(),
      propertyCategories: (json['property_category'] as List)
          .map((category) => PropertyCategory.fromJson(category))
          .toList(),
      propertyLocations: (json['property_location'] as List)
          .map((location) => PropertyLocation.fromJson(location))
          .toList(),
      propertyDevelopers: (json['property_developer'] as List)
          .map((developer) => PropertyDeveloper.fromJson(developer))
          .toList(),
      propertyHouseTypes: (json['property_house_type'] as List)
          .map((houseType) => PropertyHouseType.fromJson(houseType))
          .toList(),
      propertyTypes: (json['property_type'] as List)
          .map((type) => PropertyType.fromJson(type))
          .toList(),
    );
  }

  
}

class PropertyListModel {
  final int status;
  final String message;
  final List<Property> data;

  PropertyListModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory PropertyListModel.fromJson(Map<String, dynamic> json) {
    return PropertyListModel(
      status: json['status'],
      message: json['message'],
      data: (json['data'] as List).map((property) => Property.fromJson(property)).toList(),
    );
  }
}

