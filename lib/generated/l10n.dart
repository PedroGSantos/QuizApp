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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to Quiz-GPT`
  String get welcomeMessage {
    return Intl.message(
      'Welcome to Quiz-GPT',
      name: 'welcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `{number} correct answers!`
  String answers(Object number) {
    return Intl.message(
      '$number correct answers!',
      name: 'answers',
      desc: '',
      args: [number],
    );
  }

  /// `Movies`
  String get movies {
    return Intl.message(
      'Movies',
      name: 'movies',
      desc: '',
      args: [],
    );
  }

  /// `Sports`
  String get sports {
    return Intl.message(
      'Sports',
      name: 'sports',
      desc: '',
      args: [],
    );
  }

  /// `Video-Games`
  String get games {
    return Intl.message(
      'Video-Games',
      name: 'games',
      desc: '',
      args: [],
    );
  }

  /// `Test your knowledge on blockbuster movies.`
  String get descriptin_movie {
    return Intl.message(
      'Test your knowledge on blockbuster movies.',
      name: 'descriptin_movie',
      desc: '',
      args: [],
    );
  }

  /// `Are you a sports fan? Prove it by answering these questions!`
  String get description_sports {
    return Intl.message(
      'Are you a sports fan? Prove it by answering these questions!',
      name: 'description_sports',
      desc: '',
      args: [],
    );
  }

  /// `Think you're a gaming expert? Find out her!`
  String get description_games {
    return Intl.message(
      'Think you\'re a gaming expert? Find out her!',
      name: 'description_games',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get button {
    return Intl.message(
      'Send',
      name: 'button',
      desc: '',
      args: [],
    );
  }

  /// `Correct!`
  String get answerCorrect {
    return Intl.message(
      'Correct!',
      name: 'answerCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Wrong!`
  String get answerIncorrect {
    return Intl.message(
      'Wrong!',
      name: 'answerIncorrect',
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
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
