import 'package:get/get.dart';
import 'package:quiz_learn/core/utils/app_constant.dart';

class FirebaseStorageServices extends GetxService {
  Future<String?> getImage(String? imageName) async {
    if (imageName == null) {
      return null;
    }
    try {
      var imageUrlRef = firebaseStorage.child('question_paper_images').child(
            '${imageName.toLowerCase()}.png',
          );
      var imageUrl = await imageUrlRef.getDownloadURL();
      return imageUrl;
    } catch (e) {
      return null;
    }
  }
}
