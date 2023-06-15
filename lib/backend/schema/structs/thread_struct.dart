// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ThreadStruct extends BaseStruct {
  ThreadStruct({
    String? id,
    String? title,
  })  : _id = id,
        _title = title;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  static ThreadStruct fromMap(Map<String, dynamic> data) => ThreadStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
      );

  static ThreadStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ThreadStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
      }.withoutNulls;

  static ThreadStruct fromSerializableMap(Map<String, dynamic> data) =>
      ThreadStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ThreadStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ThreadStruct && id == other.id && title == other.title;
  }

  @override
  int get hashCode => const ListEquality().hash([id, title]);
}

ThreadStruct createThreadStruct({
  String? id,
  String? title,
}) =>
    ThreadStruct(
      id: id,
      title: title,
    );
