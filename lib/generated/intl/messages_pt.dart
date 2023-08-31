// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a pt locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'pt';

  static String m0(number) => "${number} respostas corretas!";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "answers": m0,
        "button": MessageLookupByLibrary.simpleMessage("Enviar"),
        "descriptin_movie": MessageLookupByLibrary.simpleMessage(
            "Teste seus conhecimentos sobre os grandes sucessos do cinema!"),
        "description_games": MessageLookupByLibrary.simpleMessage(
            "Será que você é um expert em jogos eletrônicos? Descubra aqui!"),
        "description_sports": MessageLookupByLibrary.simpleMessage(
            "Você é um fã de esportes? Prove respondendo a estas perguntas!"),
        "movies": MessageLookupByLibrary.simpleMessage("Filmes"),
        "sports": MessageLookupByLibrary.simpleMessage("Esportes"),
        "welcomeMessage":
            MessageLookupByLibrary.simpleMessage("Bem-vindo ao Quiz-GPT")
      };
}
