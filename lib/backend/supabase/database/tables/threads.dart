import '../database.dart';

class ThreadsTable extends SupabaseTable<ThreadsRow> {
  @override
  String get tableName => 'threads';

  @override
  ThreadsRow createRow(Map<String, dynamic> data) => ThreadsRow(data);
}

class ThreadsRow extends SupabaseDataRow {
  ThreadsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ThreadsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get tite => getField<String>('tite');
  set tite(String? value) => setField<String>('tite', value);

  String? get fileId => getField<String>('file_id');
  set fileId(String? value) => setField<String>('file_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
