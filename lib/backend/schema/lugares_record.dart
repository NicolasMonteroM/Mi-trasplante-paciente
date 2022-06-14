import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'lugares_record.g.dart';

abstract class LugaresRecord
    implements Built<LugaresRecord, LugaresRecordBuilder> {
  static Serializer<LugaresRecord> get serializer => _$lugaresRecordSerializer;

  @nullable
  BuiltList<String> get lugares;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(LugaresRecordBuilder builder) =>
      builder..lugares = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('lugares');

  static Stream<LugaresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<LugaresRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LugaresRecord._();
  factory LugaresRecord([void Function(LugaresRecordBuilder) updates]) =
      _$LugaresRecord;

  static LugaresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLugaresRecordData() => serializers.toFirestore(
    LugaresRecord.serializer, LugaresRecord((l) => l..lugares = null));
