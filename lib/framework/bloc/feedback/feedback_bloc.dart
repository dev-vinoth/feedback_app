import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_app/framework/repository/feedback/feedback_repository.dart';
import 'package:feedback_app/models/feedback_model.dart';
import 'package:meta/meta.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackRepository feedbackRepository;

  FeedbackBloc({this.feedbackRepository}) : super(FeedbackInitial.loading(0));

  Stream<QuerySnapshot> feedbackList;

  @override
  Stream<FeedbackState> mapEventToState(
    FeedbackEvent event,
  ) async* {
    if (event is GetFeedbackEvent) {
      feedbackList = feedbackRepository.getFeedback();
      print(feedbackList);
    } else if (event is AddFeedbackEvent) {
      var response = await feedbackRepository.addFeedback(event.feedbackModel);
      print('Feed posted!');
    } else if (event is IsLikeFeedbackEvent) {
      var response =
          await feedbackRepository.isLikedFeedback(event.docId, event.isLiked);
      print('Feed Updated!');
    }
  }
}
