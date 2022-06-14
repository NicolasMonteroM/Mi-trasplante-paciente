import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'medicamento_formas_record.g.dart';

abstract class MedicamentoFormasRecord
    implements Built<MedicamentoFormasRecord, MedicamentoFormasRecordBuilder> {
  static Serializer<MedicamentoFormasRecord> get serializer =>
      _$medicamentoFormasRecordSerializer;

  @nullable
  BuiltList<String> get listado;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MedicamentoFormasRecordBuilder builder) =>
      builder..listado = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicamento_formas');

  static Stream<MedicamentoFormasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MedicamentoFormasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  MedicamentoFormasRecord._();
  factory MedicamentoFormasRecord(
          [void Function(MedicamentoFormasRecordBuilder) updates]) =
      _$MedicamentoFormasRecord;

  static MedicamentoFormasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMedicamentoFormasRecordData() =>
    serializers.toFirestore(MedicamentoFormasRecord.serializer,
        MedicamentoFormasRecord((m) => m..listado = null));
