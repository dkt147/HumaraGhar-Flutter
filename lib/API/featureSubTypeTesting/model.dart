// feature_subtype.dart

class FeatureSubType {
  final String sName;
  final String sId;

  FeatureSubType({required this.sName, required this.sId});

  factory FeatureSubType.fromJson(Map<String, dynamic> json) {
    return FeatureSubType(
      sName: json['s_name'],
      sId: json['s_id'],
    );
  }
}

class Property {
  final List<FeatureSubType> featureSubTypes;

  Property({required this.featureSubTypes});

  factory Property.fromJson(Map<String, dynamic> json) {
    List<FeatureSubType> subTypes = [];
    json.forEach((key, value) {
      List<dynamic> subTypeList = value;
      subTypes.addAll(subTypeList.map((e) => FeatureSubType.fromJson(e)).toList());
    });
    return Property(featureSubTypes: subTypes);
  }
}
