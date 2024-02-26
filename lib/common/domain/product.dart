import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_task/common/domain/category.dart';
import 'package:grocery_task/common/domain/product_badge.dart';

class Product {
  const Product({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
    required this.colorValue,
    this.category,
    this.badge,
  });

  final String name;
  final String description;
  final double price;
  final Category? category;

  final String imageAsset;

  final int colorValue;

  final ProductBadge? badge;
    
    
    


/*Ein DocumentSnapshot ist ein Objekt in der Firebase Firestore-Bibliothek,
 das ein einzelnes Dokument in einer Firestore-Sammlung repräsentiert. 
 Ein DocumentSnapshot enthält die Daten des Dokuments 
 sowie Metadaten wie die ID des Dokuments und Informationen darüber, ob das Dokument existiert oder nicht.*/ 
  factory Product.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    /*Ein Factory-Konstruktor ist ein spezieller Typ von Konstruktor,
     der nicht notwendigerweise eine neue Instanz der Klasse erzeugt, 
     sondern möglicherweise eine andere Instanz zurückgibt, je nach Implementierung. 
    In diesem Fall wird der Factory-Konstruktor verwendet, um eine Instanz der Product-Klasse aus Firestore-Daten zu erstellen.*/
    return Product(
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      price: (data['price'] ?? 0.0).toDouble(),
      imageAsset: data['imageAsset'] ?? '',
      colorValue: data['colorValue'] ?? 0,
      category: data['category'] != null ? Category.fromFirestore(data['category']) : null,
      badge: data['badge'] != null ? ProductBadge.fromFirestore(data['badge']) : null,
    );
  }
}









