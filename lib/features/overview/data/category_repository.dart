import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_task/common/domain/category.dart';

class CategoryRepository {
  Stream<List<Category>> get categorie {
    return  FirebaseFirestore.instance
        .collection('categories')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map<Category>((doc) => Category.fromFirestore(doc))
            .toList());


  }

  static Future<List<T>> fetchDataFromFirebase<T>(
    String collectionName,
    T Function(Map<String, dynamic>) fromFirestore,
  ) async {
    List<T> data = [];

    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection(collectionName).get();
      List<DocumentSnapshot> documents = querySnapshot.docs;

      for (DocumentSnapshot doc in documents) {
        data.add(fromFirestore(doc.data() as Map<String, dynamic>));
      }
    } catch (e) {
      print('Error fetching data from $collectionName: $e');
    }

    return data;
  }
}




  

//mit as ListCategory folgender Fehler behoben;
// else The method 'tolist' isn't defined for the type 'Iterable'.
// Try correcting the name to the name of an existing method, or defining a method named 'tolist'. // 