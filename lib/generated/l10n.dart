// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Please Enter Mobile No.`
  String get pageEntryEnterMobileNo {
    return Intl.message(
      'Please Enter Mobile No.',
      name: 'pageEntryEnterMobileNo',
      desc: '',
      args: [],
    );
  }

  /// `Mobile No *`
  String get pageEntryMobileNo {
    return Intl.message(
      'Mobile No *',
      name: 'pageEntryMobileNo',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid Mobile No.`
  String get pageEntryEnterValidNumber {
    return Intl.message(
      'Enter valid Mobile No.',
      name: 'pageEntryEnterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get navBarTitleFeedback {
    return Intl.message(
      'Feedback',
      name: 'navBarTitleFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Add Feedback`
  String get navBarTitleAddFeedback {
    return Intl.message(
      'Add Feedback',
      name: 'navBarTitleAddFeedback',
      desc: '',
      args: [],
    );
  }

  /// `Title *`
  String get pageAddFeedbackTitle {
    return Intl.message(
      'Title *',
      name: 'pageAddFeedbackTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Title`
  String get pageAddFeedbackEnterTitle {
    return Intl.message(
      'Please Enter Title',
      name: 'pageAddFeedbackEnterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Description *`
  String get pageAddFeedbackDescription {
    return Intl.message(
      'Description *',
      name: 'pageAddFeedbackDescription',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Description`
  String get pageAddFeedbackEnterDescription {
    return Intl.message(
      'Please Enter Description',
      name: 'pageAddFeedbackEnterDescription',
      desc: '',
      args: [],
    );
  }

  /// `Reporter Name`
  String get pageAddFeedbackReporterName {
    return Intl.message(
      'Reporter Name',
      name: 'pageAddFeedbackReporterName',
      desc: '',
      args: [],
    );
  }

  /// `Please Reporter Name`
  String get pageAddFeedbackEnterReporterName {
    return Intl.message(
      'Please Reporter Name',
      name: 'pageAddFeedbackEnterReporterName',
      desc: '',
      args: [],
    );
  }

  /// `Anonymous`
  String get pageAddFeedbackAnonymous {
    return Intl.message(
      'Anonymous',
      name: 'pageAddFeedbackAnonymous',
      desc: '',
      args: [],
    );
  }

  /// `Select Category`
  String get pageAddFeedbackSelectCategory {
    return Intl.message(
      'Select Category',
      name: 'pageAddFeedbackSelectCategory',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get pageAddFeedbackCategory {
    return Intl.message(
      'Category',
      name: 'pageAddFeedbackCategory',
      desc: '',
      args: [],
    );
  }

  /// `POST`
  String get pageAddFeedbackPost {
    return Intl.message(
      'POST',
      name: 'pageAddFeedbackPost',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}