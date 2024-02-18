class GetFavoriteProperty {
  final String id;
  final String userId;
  final String propertyId;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;
  final String userName;
  final String propertyName;

  GetFavoriteProperty({
    required this.id,
    required this.userId,
    required this.propertyId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.userName,
    required this.propertyName,
  });

  factory GetFavoriteProperty.fromJson(Map<String, dynamic> json) {
    return GetFavoriteProperty(
      id: json['id'],
      userId: json['user_id'],
      propertyId: json['property_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      userName: json['user_name'],
      propertyName: json['property_name'],
    );
  }
}
