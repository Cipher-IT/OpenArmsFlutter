import '../database.dart';

class LanguagesTable extends SupabaseTable<LanguagesRow> {
  @override
  String get tableName => 'languages';

  @override
  LanguagesRow createRow(Map<String, dynamic> data) => LanguagesRow(data);
}

class LanguagesRow extends SupabaseDataRow {
  LanguagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LanguagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool get visible => getField<bool>('visible')!;
  set visible(bool value) => setField<bool>('visible', value);

  String? get writtenName => getField<String>('written_name');
  set writtenName(String? value) => setField<String>('written_name', value);
}
