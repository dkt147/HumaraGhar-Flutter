import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class FavoritePropertyIcon extends StatefulWidget {
  final String userId;
  final String propertyId;

  const FavoritePropertyIcon({
    required this.userId,
    required this.propertyId,
  });

  @override
  _FavoritePropertyIconState createState() => _FavoritePropertyIconState();
}

class _FavoritePropertyIconState extends State<FavoritePropertyIcon> {
  bool isFavorite = false; // Initialize to false initially

  @override
  void initState() {
    super.initState();
    // Check if the property is already in favorites when the widget initializes
    checkFavoriteStatus();
  }

// Function to check the initial favorite status
  Future<void> checkFavoriteStatus() async {
    try {
      final response = await http.post(
        Uri.parse('https://cybernsoft.com/hg/my_favourite_property.php'),
        body: {
          'user_id': widget.userId,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        // Check if the propertyId exists in the list of favorite properties
        setState(() {
          isFavorite = data['response'].any((property) => property['property_id'] == widget.propertyId);
        });
      }
    } catch (error) {
      print('Error: $error');
    }
  }

 
  // Function to toggle property favorite status
  Future<void> toggleFavoriteStatus() async {
    try {
      final response = await http.post(
        Uri.parse('https://cybernsoft.com/hg/add_to_favourite.php'),
        body: {
          'user_id': widget.userId,
          'property_id': widget.propertyId,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data[0]['status'] == 1) {
          setState(() {
            isFavorite = !isFavorite; // Toggle favorite status
          });
        } else {
          print('Failed to toggle favorite status');
        }
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
        size: 35,
      ),
      onTap: toggleFavoriteStatus,
    );
  }
}


class IconView extends StatefulWidget {
  const IconView({super.key});

  @override
  State<IconView> createState() => _IconViewState();
}

class _IconViewState extends State<IconView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FavoritePropertyIcon(userId: '1', propertyId: '2'),
      ),
    );
  }
}