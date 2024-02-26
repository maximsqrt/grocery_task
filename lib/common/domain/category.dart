import 'package:cloud_firestore/cloud_firestore.dart';

class Category {
  const Category({
    required this.name,
    required this.iconAsset,
    required this.colorValue,
  });

  final String name;
  final String iconAsset;
  final int colorValue;

  factory Category.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;




    return Category(name: data['name'], iconAsset: data['iconAsset'], colorValue: data['colorValue']);

  }
}








