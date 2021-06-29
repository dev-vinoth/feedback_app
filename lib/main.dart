import 'package:feedback_app/framework/bloc/feedback/feedback_bloc.dart';
import 'package:feedback_app/framework/repository/feedback/feedback_repository.dart';
import 'package:feedback_app/routes.dart';
import 'package:feedback_app/screens/entry_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FeedbackBloc>(
            create: (BuildContext context) => FeedbackBloc(
                feedbackRepository: FeedbackRepositoryBuilder.repository()),
          )
        ],
        child: EntryScreen(),
      ),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
