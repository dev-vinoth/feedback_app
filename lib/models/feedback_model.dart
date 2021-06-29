import 'dart:convert';

FeedbackModel feedbackModelFromJson(String str) =>
    FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
  FeedbackModel({
    this.title,
    this.category,
    this.description,
    this.reporterName,
    this.anonymous,
    this.mobileNo,
    this.likes,
    this.disLikes,
  });

  String title;
  String category;
  String description;
  String reporterName;
  bool anonymous;
  String mobileNo;
  String likes;
  String disLikes;

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
        title: json["title"],
        category: json["category"],
        description: json["description"],
        reporterName: json["reporterName"],
        anonymous: json["anonymous"],
        mobileNo: json["mobileNo"],
        likes: json["likes"],
        disLikes: json["disLikes"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "category": category,
        "description": description,
        "reporterName": reporterName,
        "anonymous": anonymous,
        "mobileNo": mobileNo,
        "likes": likes,
        "disLikes": disLikes,
      };
}
