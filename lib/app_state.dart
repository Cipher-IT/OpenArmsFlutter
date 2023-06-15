import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _threadId = '';
  String get threadId => _threadId;
  set threadId(String _value) {
    _threadId = _value;
  }

  final _getLanguagesManager = FutureRequestManager<List<LanguagesRow>>();
  Future<List<LanguagesRow>> getLanguages({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<LanguagesRow>> Function() requestFn,
  }) =>
      _getLanguagesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetLanguagesCache() => _getLanguagesManager.clear();
  void clearGetLanguagesCacheKey(String? uniqueKey) =>
      _getLanguagesManager.clearRequest(uniqueKey);

  final _getUserThreadsManager = FutureRequestManager<List<ThreadsRow>>();
  Future<List<ThreadsRow>> getUserThreads({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<ThreadsRow>> Function() requestFn,
  }) =>
      _getUserThreadsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetUserThreadsCache() => _getUserThreadsManager.clear();
  void clearGetUserThreadsCacheKey(String? uniqueKey) =>
      _getUserThreadsManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
