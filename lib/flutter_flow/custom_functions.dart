import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String randomEmailGenerator() {
  int length = 15;
  const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  math.Random random = math.Random();
  String randomString = String.fromCharCodes(Iterable.generate(
      length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  return '$randomString@example.com';
}

String randomPasswordGenerator() {
  int length = 15;
  const characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  math.Random random = math.Random();
  String randomString = String.fromCharCodes(Iterable.generate(
      length, (_) => characters.codeUnitAt(random.nextInt(characters.length))));
  return randomString;
}
