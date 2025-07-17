import 'package:cloud_firestore/cloud_firestore.dart';
import 'DatabaseService.dart';

class FireStoreService implements DatabaseService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({required String path, required Map<String, dynamic> data, String? documentId}) async {
    if (documentId != null) {
      await firebaseFirestore.collection(path).doc(documentId).set(data);
    } else {
      await firebaseFirestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    Map<String, dynamic>? query,
  }) async {
    if (documentId != null) {
      var data = await firebaseFirestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      Query<Map<String, dynamic>> data = firebaseFirestore.collection(path);
      if (query != null) {
        // Handle filtering
        if (query['filterBy'] != null && query['isEqualTo'] != null) {
          data = data.where(query['filterBy'], isEqualTo: query['isEqualTo']);
        }
        // Handle ordering
        if (query['orderBy'] != null) {
          var orderByField = query['orderBy'];
          var descending = query['descending'] ?? false; // Default to false if not specified
          data = data.orderBy(orderByField, descending: descending);
        }
        // Handle limit
        if (query['limit'] != null) {
          var limit = query['limit'];
          data = data.limit(limit);
        }
      }

      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<bool> checkIFDataExist({required String path, required String documentId }) async {
    var data = await firebaseFirestore.collection(path).doc(documentId ).get();
    return data.exists;
  }

  @override
  Future<void> deleteData({required String path, required String documentId}) async {
    try {
      await firebaseFirestore.collection(path).doc(documentId).delete();
    } catch (e) {
      rethrow; // Handle any exceptions that may occur during the deletion process
    }
  }
}
