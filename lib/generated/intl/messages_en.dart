// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alert": MessageLookupByLibrary.simpleMessage("Alert"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "goals": MessageLookupByLibrary.simpleMessage("Goals"),
    "history": MessageLookupByLibrary.simpleMessage("History"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "internet_connected": MessageLookupByLibrary.simpleMessage(
      "Connected to the internet",
    ),
    "location_disabled": MessageLookupByLibrary.simpleMessage(
      "Location services are disabled",
    ),
    "location_success": MessageLookupByLibrary.simpleMessage(
      "Location fetched successfully",
    ),
    "maps": MessageLookupByLibrary.simpleMessage("Maps"),
    "navigationBar": MessageLookupByLibrary.simpleMessage(
      "__________________________________________________",
    ),
    "no_internet": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "permission_denied": MessageLookupByLibrary.simpleMessage(
      "Location permission denied",
    ),
    "permission_denied_forever": MessageLookupByLibrary.simpleMessage(
      "Location permission permanently denied, please enable it from settings",
    ),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "services": MessageLookupByLibrary.simpleMessage(
      "__________________________________________________",
    ),
    "start": MessageLookupByLibrary.simpleMessage("Get Started"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "welcome": MessageLookupByLibrary.simpleMessage("Welcome to FitTrack"),
    "welcome_des": MessageLookupByLibrary.simpleMessage(
      " Track your steps, workouts & goals easily",
    ),
  };
}
