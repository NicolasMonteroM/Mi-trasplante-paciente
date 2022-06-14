import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'profesionales_record.g.dart';

abstract class ProfesionalesRecord
    implements Built<ProfesionalesRecord, ProfesionalesRecordBuilder> {
  static Serializer<ProfesionalesRecord> get serializer =>
      _$profesionalesRecordSerializer;

  @nullable
  BuiltList<String> get nombres;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProfesionalesRecordBuilder builder) =>
      builder..nombres = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('profesionales');

  static Stream<ProfesionalesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProfesionalesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProfesionalesRecord._();
  factory ProfesionalesRecord(
          [void Function(ProfesionalesRecordBuilder) updates]) =
      _$ProfesionalesRecord;

  static ProfesionalesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProfesionalesRecordData() => serializers.toFirestore(
    ProfesionalesRecord.serializer,
    ProfesionalesRecord((p) => p..nombres = null));
