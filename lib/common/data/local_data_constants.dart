import 'package:cloud_firestore/cloud_firestore.dart';

// const List<Category> mockCategories = [
//   Category(
//     name: 'Vegetable',
//     iconAsset: 'assets/icons/vegetables.png',
//     colorValue: 0xff28B446,
//   ),
//   Category(
//     name: 'Fruits',
//     iconAsset: 'assets/icons/fruits.png',
//     colorValue: 0xffF8644A,
//   ),
//   Category(
//     name: 'Beverages',
//     iconAsset: 'assets/icons/beverages.png',
//     colorValue: 0xffF5BA3C,
//   ),
//   Category(
//     name: 'Grocery',
//     iconAsset: 'assets/icons/grocery.png',
//     colorValue: 0xffAE80FF,
//   ),
//   Category(
//     name: 'Edible Oil',
//     iconAsset: 'assets/icons/edible_oil.png',
//     colorValue: 0xff0CD4DC,
//   ),
//   Category(
//     name: 'Household',
//     iconAsset: 'assets/icons/vacuum.png',
//     colorValue: 0xffFF7EB6,
//   ),
// ];

// final List<Product> mockProducts = [
//   const Product(
//     name: 'Fresh Peach',
//     description: 'dozen',
//     price: 8.00,
//     imageAsset: 'assets/images/peach.png',
//     colorValue: 0xffFFCEC1,
//   ),
//   const Product(
//     name: 'Avocado',
//     description: '2.0 lbs',
//     price: 7.00,
//     imageAsset: 'assets/images/avocado.png',
//     colorValue: 0xffFCFFD9,
//     badge: ProductBadge(
//       name: 'New',
//       colorValue: 0xffE8AD41,
//     ),
//   ),
//   const Product(
//     name: 'Pineapple',
//     description: '1.15 lbs',
//     price: 9.90,
//     imageAsset: 'assets/images/pineapple.png',
//     colorValue: 0xffFFE6C2,
//   ),
//   const Product(
//     name: 'Black grapes',
//     description: '5 lbs',
//     price: 7.05,
//     imageAsset: 'assets/images/grapes.png',
//     colorValue: 0xffFEE1ED,
//     badge: ProductBadge(
//       name: '-16%',
//       colorValue: 0xffF56262,
//     ),
//   ),
//   const Product(
//     name: 'Pomegranate',
//     description: '1.50 lbs',
//     price: 2.09,
//     imageAsset: 'assets/images/pomegranate.png',
//     colorValue: 0xffFFE3E2,
//     badge: ProductBadge(
//       name: 'New',
//       colorValue: 0xffE8AD41,
//     ),
//   ),
//   const Product(
//     name: 'Fresh Green Broccoli',
//     description: '3 lbs',
//     price: 1,
//     imageAsset: 'assets/images/broccoli.png',
//     colorValue: 0xffD2FFD0,
//   ),
// ];



// Genereische Methode zum Abrufen aller Produkte/Kategorien aus Firebase

// Generische Methode zum Abrufen von Daten aus Firebase

   Future<List<T>> fetchDataFromFirebase<T>(
    String collectionName,
    T Function(Map<String, dynamic>) fromFirestore,
  ) async {
    List<T> data = [];
    
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection(collectionName).get();
      List<DocumentSnapshot> documents = querySnapshot.docs;
      
      for (DocumentSnapshot doc in documents) {
        data.add(fromFirestore(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print('Error fetching data from $collectionName: $e');
    }

    return data;
  }


//////// War nur zum einmaligen Ausführen PRODUCTS & CATEGORIES in FB zu laden
// Future<void> uploadCategoryToFirebase() async {
//   try {
//     // Referenz zur Firestore-Sammlung "categories" erstellen
//     CollectionReference categoriesCollection = FirebaseFirestore.instance.collection('categories');

//     // Für jede Kategorie in der mockCategories-Liste
//     for (Category category in mockCategories) {
//       // Ein neues Dokument in der Sammlung erstellen und die Kategorieninformationen als Daten speichern
//       await categoriesCollection.add({
//         'name': category.name,
//         'iconAsset': category.iconAsset,
//         'colorValue': category.colorValue,
        
     
//       });
//     }
//   } catch (e) {
//     print('Error uploading categories to Firebase: $e');
//   }
// }
