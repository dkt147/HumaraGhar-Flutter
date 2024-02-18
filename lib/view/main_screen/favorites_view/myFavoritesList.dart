// ignore_for_file: public_member_api_docs, sort_constructors_first
class MyFavorites {
   List<String> imageList;
    String title;
   String rentOrPrice;
    String location;
    String ownerContactInfo;
   String description;
   bool isFavorite;


  MyFavorites({
    required this.imageList,
    required this.title,
    required this.rentOrPrice,
    required this.location,
    required this.ownerContactInfo,
    required this.description,
    this.isFavorite = false,
  });
}
