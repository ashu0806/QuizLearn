import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final firebaseFirestore = FirebaseFirestore.instance;
Reference get firebaseStorage => FirebaseStorage.instance.ref();

final userRefrence = firebaseFirestore.collection('users');
final questionPapersReference = firebaseFirestore.collection('quizPapers');

DocumentReference questionsReference({
  required String paperId,
  required String questionId,
}) =>
    questionPapersReference
        .doc(paperId)
        .collection('questions')
        .doc(questionId);

enum LoadingStatus {
  loading,
  completed,
  error,
}
