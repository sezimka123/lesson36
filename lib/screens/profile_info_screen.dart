import 'package:flutter/material.dart';

class ProfileInfoScreen extends StatelessWidget {
  final String name;
  final String age;
  final String imageUrl;

  const ProfileInfoScreen({
    super.key,
    required this.name,
    required this.age,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(name),
          Text(age),
          Image.network(imageUrl),
        ],
      ),
    );
  }
}
