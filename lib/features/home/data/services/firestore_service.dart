import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvvm_fruit_hub/core/errors/custom_exception.dart';
import 'package:mvvm_fruit_hub/features/home/data/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirestoreService({required FirebaseFirestore fireStore})
    : _fireStore = fireStore;
  final FirebaseFirestore _fireStore;

  @override
  Future<dynamic> getData({required String path}) async {
    try {
      var data = await _fireStore.collection(path).get();
      return data.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw CustomException(exceptionMeassge: "failed fetch data");
    }
  }
}
