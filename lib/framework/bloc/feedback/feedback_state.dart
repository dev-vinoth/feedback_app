part of 'feedback_bloc.dart';

class FeedbackState {
  FeedbackState.completed(data) : super();
  FeedbackState.loading(data) : super();
  FeedbackState.error(data) : super();
  List<Object> get props => [];
}

class FeedbackInitial extends FeedbackState {
  FeedbackInitial.completed(data) : super.completed(data);
  FeedbackInitial.loading(data) : super.loading(data);
}

class GetFeedbackState extends FeedbackState {
  GetFeedbackState.completed(data) : super.completed(data);
  GetFeedbackState.loading(data) : super.completed(data);
  GetFeedbackState.error(data) : super.completed(data);
}
