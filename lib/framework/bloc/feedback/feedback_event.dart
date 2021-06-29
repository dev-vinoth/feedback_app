part of 'feedback_bloc.dart';

@immutable
abstract class FeedbackEvent {
  // const FeedbackEvent();
}

class GetFeedbackEvent extends FeedbackEvent {
  GetFeedbackEvent();

  List<Object> get props => [];
}

class AddFeedbackEvent extends FeedbackEvent {
  final FeedbackModel feedbackModel;

  AddFeedbackEvent({this.feedbackModel});

  List<Object> get props => [this.feedbackModel];
}

class IsLikeFeedbackEvent extends FeedbackEvent {
  final String docId;
  final bool isLiked;

  IsLikeFeedbackEvent({this.docId, this.isLiked});

  List<Object> get props => [this.docId, this.isLiked];
}
