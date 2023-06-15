import '../database.dart';

class SummariesTable extends SupabaseTable<SummariesRow> {
  @override
  String get tableName => 'summaries';

  @override
  SummariesRow createRow(Map<String, dynamic> data) => SummariesRow(data);
}

class SummariesRow extends SupabaseDataRow {
  SummariesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SummariesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get content => getField<String>('content');
  set content(String? value) => setField<String>('content', value);

  int? get tokenUsed => getField<int>('token_used');
  set tokenUsed(int? value) => setField<int>('token_used', value);

  String? get threadId => getField<String>('thread_id');
  set threadId(String? value) => setField<String>('thread_id', value);
}
