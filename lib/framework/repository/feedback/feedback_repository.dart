import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/framework/repository/feedback/FirebaseFeedbackRepository.dart';
import 'package:feedback_app/models/feedback_model.dart';

class FeedbackRepositoryBuilder {
  static FeedbackRepository repository() {
    return FirebaseFeedbackRepository();
  }
}

abstract class FeedbackRepository {
  Future<void> addFeedback(FeedbackModel feedback);

  Stream<QuerySnapshot> getFeedback();

  Future<void> isLikedFeedback(String id, bool isLiked);
}
