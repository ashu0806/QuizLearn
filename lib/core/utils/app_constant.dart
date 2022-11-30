import 'package:cloud_firestore/cloud_firestore.dart';

final firebaseFirestore = FirebaseFirestore.instance;
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
