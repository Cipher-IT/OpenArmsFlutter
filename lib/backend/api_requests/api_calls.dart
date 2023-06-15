import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class StartChatThreadCall {
  static Future<ApiCallResponse> call({
    String? content = '',
    String? token = '',
  }) {
    final body = '''
{
  "content": "${content}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StartChatThread',
      apiUrl: 'https://openarms-api.cipher.ly/api/start-thread',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class StartFileThreadCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? fileId = '',
    String? languageId = '',
  }) {
    final body = '''
{
  "file_id": "${fileId}",
  "language_id": "${languageId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'StartFileThread',
      apiUrl: 'https://openarms-api.cipher.ly/api/start-thread',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class NewThreadMessageCall {
  static Future<ApiCallResponse> call({
    String? token = '',
    String? content = '',
    String? threadId = '',
  }) {
    final body = '''
{
  "thread_id": "${threadId}",
  "content": "${content}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NewThreadMessage',
      apiUrl: 'https://openarms-api.cipher.ly/api/new-thread-message',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': '${token}',
      },
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
