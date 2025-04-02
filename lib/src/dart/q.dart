// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:stack_trace/stack_trace.dart';

void _logTrace({
  String header = "💬",
  Object? message,
  bool terse = false,
  int i = 2,
}) {
  if (!kDebugMode) return;
  final current = Trace.current();
  if (terse) {
    final trace = current.terse;
    final f = trace.frames[i];
    print("\n${f.location}  ${f.member}");
  }
  final member = current.frames[i].member;
  if (message == null) {
    print("$header $member");
    return;
  }
  print("$header $member $message");
}

void get qq {
  if (!kDebugMode) return;
  _logTrace(header: "💬");
  return;
}

void get qw {
  if (!kDebugMode) return;
  _logTrace(header: "🚧");
  return;
}

void get qe {
  if (!kDebugMode) return;
  _logTrace(header: "😡");
  return;
}

void get qr {
  if (!kDebugMode) return;
  _logTrace(header: "✅");
  return;
}

void qqq(Object? message) {
  if (!kDebugMode) return;
  _logTrace(header: "💬", message: message);
  return;
}

void qqw(Object? message) {
  if (!kDebugMode) return;
  _logTrace(header: "🚧", message: message);
  return;
}

void qqe(Object? message) {
  if (!kDebugMode) return;
  _logTrace(header: "😡", message: message);
  return;
}

void qqr(Object? message) {
  if (!kDebugMode) return;
  _logTrace(header: "✅", message: message);
  return;
}
