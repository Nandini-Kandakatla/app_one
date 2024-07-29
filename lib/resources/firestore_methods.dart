import 'dart:typed_data';
import 'package:app_one/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';  // Import the Uuid package
import '../models/post.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload post
  Future<String> uploadPost(
      String description,
      Uint8List file,
      String uid,
      String username,
      String profileImage,
      ) async {
    String res = "Some error occurred";
    try {
      // Upload image and get its URL
      String photoUrl = await StorageMethods().uploadImageToStorage('posts', file, true);

      // Generate a unique ID for the post
      String postId = const Uuid().v1();

      // Create a new post
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profileImage: profileImage,
        likes: [],
      );

      // Save post to Firestore
      await _firestore.collection('posts').doc(postId).set(post.toJson());

      res = "Success";
    } catch (err) {
      res = err.toString();
    }

    return res;  // Make sure to return the result
  }
}
