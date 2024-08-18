

class NewProjectDetails{
 final List<String> imageList;
   String title;
   String rentOrPrice;
   String location;
   String ownerContactInfo;
   String description;
  bool isFavorite; // New property

  NewProjectDetails({
    required this.imageList,
    required this.title,
    required this.description,
    required this.rentOrPrice,
    required this.location,
    required this.ownerContactInfo,
    this.isFavorite = false, // Default to not being a favorite
  });
}