import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final api_key = 'AIzaSyCeGr4nkZeZ8lGRBL1O1Xjz72KJZwOBoEc';
  Future<List<dynamic>> fetchNearbyRestaurants(
      double latitude, double longitude, String apiKey) async {
    final String baseUrl =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json';

    final String url =
        '$baseUrl?location=$latitude,$longitude&type=restaurant&radius=5000&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'] as List<dynamic>;
      return results;
    } else {
      throw Exception('Failed to fetch restaurants');
    }
  }

  void getNearbyRestaurants() async {
    try {
      final apiKey = api_key;
      final latitude =
          37.7749; // Example latitude (e.g., user's current location)
      final longitude =
          -122.4194; // Example longitude (e.g., user's current location)

      final restaurants =
          await fetchNearbyRestaurants(latitude, longitude, apiKey);

      // Process the restaurant data as needed
      for (var restaurant in restaurants) {
        final name = restaurant['name'];
        final rating = restaurant['rating'];
        // ...
        print('Name: $name, Rating: $rating');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> testApiKey(String apiKey) async {
    final String testUrl =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=test&key=$apiKey';

    final response = await http.get(Uri.parse(testUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final status = jsonData['status'];

      if (status == 'OK') {
        print('API key is working correctly!');
      } else {
        print('API key is invalid or not working.');
      }
    } else {
      print('Failed to connect to the API.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          onPressed: () {
            // getNearbyRestaurants();
            testApiKey('AIzaSyCeGr4nkZeZ8lGRBL1O1Xjz72KJZwOBoEc');
          },
          child: Text('Get Nearby Restaurants'),
        ),
      )),
    );
  }
}

src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAgj69_zJEaXh3bJuWPeNIX4TGFe4YqBfA&callback=initMap"