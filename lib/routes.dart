import 'package:feedback_app/screens/entry_screen.dart';
import 'package:feedback_app/screens/feedback_creation.dart';
import 'package:feedback_app/screens/feedback_list.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String entryRoute = '/';
  static const String feedBackListRoute = '/feedbackList';
  static const String feedbackCreationRoute = '/feedbackCreation';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => EntryScreen());
      case '/feedbackList':
        return MaterialPageRoute(builder: (_) => FeedbackListScreen());
      case '/feedbackCreation':
        return MaterialPageRoute(builder: (_) => FeedbackCreationScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
