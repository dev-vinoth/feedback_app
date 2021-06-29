import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/framework/repository/feedback/feedback_repository.dart';
import 'package:feedback_app/localCache.dart';
import 'package:feedback_app/models/feedback_model.dart';

class FirebaseFeedbackRepository implements FeedbackRepository {
  final feedbackCollection = FirebaseFirestore.instance.collection('feedback');

  @override
  Future<void> addFeedback(FeedbackModel feedback) async {
    await feedbackCollection.add(feedback.toJson());
  }

  @override
  Stream<QuerySnapshot> getFeedback() {
    return FirebaseFirestore.instance.collection('feedback').snapshots();
    // return todoCollection.snapshots().map(
    //     (event) => event.docs.map((e) => FeedbackModel.fromJson(e.data())));
    // return todoCollection.snapshots().map((snapshot) {
    //   print(snapshot.docs.length);
    //
    //   return snapshot.docs
    //       .map((doc) => FeedbackModel.fromJson(doc.data()))
    //       .toList();
    // });
  }

  @override
  Future<void> isLikedFeedback(String id, bool isLiked) async {
    feedbackCollection.doc(id).get().then((value) {
      final mobNo = LocalCache().userMobNo;

      if (isLiked) {
        var likes = value.data()['likes'] as String;

        if (likes == null || likes == "") {
          feedbackCollection.doc(id).update({'likes': '$mobNo'});

          ///Removing from already disLikes
          removeAlreadyDisLiked(value, mobNo, id);
        } else {
          var allLikes = likes?.split(',');
          if (!allLikes.contains(mobNo)) {
            feedbackCollection.doc(id).update({'likes': '$likes,$mobNo'});

            ///Removing from already disLikes
            removeAlreadyDisLiked(value, mobNo, id);
          } else {
            print('Already Liked');

            ///Removing from already disLikes
            removeAlreadyDisLiked(value, mobNo, id);
          }
        }
      } else {
        var disLikes = value.data()['disLikes'] as String;

        if (disLikes == null || disLikes == "") {
          feedbackCollection.doc(id).update({'disLikes': '$mobNo'});

          ///Removing from already likes
          removeAlreadyLiked(value, mobNo, id);
        } else {
          var allLikes = disLikes?.split(',');
          if (!allLikes.contains(mobNo)) {
            feedbackCollection.doc(id).update({'disLikes': '$disLikes,$mobNo'});

            ///Removing from already likes
            removeAlreadyLiked(value, mobNo, id);
          } else {
            print('Already DisLiked');

            ///Removing from already likes
            removeAlreadyLiked(value, mobNo, id);
          }
        }
      }
    });
  }

  void removeAlreadyLiked(
      DocumentSnapshot<Map<String, dynamic>> value, String mobNo, String id) {
    var likes = value.data()['likes'] as String;
    if (likes != null) {
      var allLikes = likes?.split(',');
      if (allLikes.contains(mobNo)) {
        allLikes.remove(mobNo);
        feedbackCollection.doc(id).update({'likes': '${allLikes.join(',')}'});
      }
    }
  }

  void removeAlreadyDisLiked(
      DocumentSnapshot<Map<String, dynamic>> value, String mobNo, String id) {
    var disLikes = value.data()['disLikes'] as String;
    if (disLikes != null) {
      var allDisLikes = disLikes?.split(',');
      if (allDisLikes.contains(mobNo)) {
        allDisLikes.remove(mobNo);
        feedbackCollection
            .doc(id)
            .update({'disLikes': '${allDisLikes.join(',')}'});
      }
    }
  }
}
