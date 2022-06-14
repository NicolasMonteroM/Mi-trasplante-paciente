import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tipos_indicadores_record.g.dart';

abstract class TiposIndicadoresRecord
    implements Built<TiposIndicadoresRecord, TiposIndicadoresRecordBuilder> {
  static Serializer<TiposIndicadoresRecord> get serializer =>
      _$tiposIndicadoresRecordSerializer;

  @nullable
  BuiltList<String> get tipos;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TiposIndicadoresRecordBuilder builder) =>
      builder..tipos = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tipos_indicadores');

  static Stream<TiposIndicadoresRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TiposIndicadoresRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TiposIndicadoresRecord._();
  factory TiposIndicadoresRecord(
          [void Function(TiposIndicadoresRecordBuilder) updates]) =
      _$TiposIndicadoresRecord;

  static TiposIndicadoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTiposIndicadoresRecordData() =>
    serializers.toFirestore(TiposIndicadoresRecord.serializer,
        TiposIndicadoresRecord((t) => t..tipos = null));
