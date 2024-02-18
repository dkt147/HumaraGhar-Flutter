class Property {
  final String id;
  final String name;
  final String price;
  final List<PropertyAttachment> propertyAttachments;
  final PropertyCity propertyCity;
  // Add more fields as needed

  Property({
    required this.id,
    required this.name,
    required this.price,
    required this.propertyAttachments,
    required this.propertyCity,
    // Add more fields as needed
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      propertyAttachments: (json['property_attachments'] as List)
          .map((attachmentJson) => PropertyAttachment.fromJson(attachmentJson))
          .toList(),
      propertyCity: PropertyCity.fromJson(json['property_city']),
      // Parse more fields as needed
    );
  }
}

class PropertyAttachment {
  final String id;
  final String type;
  final String size;
  final String url;

  PropertyAttachment({
    required this.id,
    required this.type,
    required this.size,
    required this.url,
  });

  factory PropertyAttachment.fromJson(Map<String, dynamic> json) {
    return PropertyAttachment(
      id: json['id'],
      type: json['type'],
      size: json['size'],
      url: json['url'],
    );
  }
}

class PropertyCity {
  final String id;
  final String name;

  PropertyCity({
    required this.id,
    required this.name,
  });

  factory PropertyCity.fromJson(Map<String, dynamic> json) {
    return PropertyCity(
      id: json['id'],
      name: json['name'],
    );
  }
}
