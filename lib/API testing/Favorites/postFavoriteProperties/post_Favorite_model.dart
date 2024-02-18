class FavoriteProperty {
  final String user_id;
  final String property_id;
  // Add more properties as needed

  FavoriteProperty({required this.user_id, required  this.property_id, });

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'property_id': property_id,
      // Add more properties as needed
    };
  }
}