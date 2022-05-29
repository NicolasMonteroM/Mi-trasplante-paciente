import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'indicadores_record.g.dart';

abstract class IndicadoresRecord
    implements Built<IndicadoresRecord, IndicadoresRecordBuilder> {
  static Serializer<IndicadoresRecord> get serializer =>
      _$indicadoresRecordSerializer;

  @nullable
  String get tipo;

  @nullable
  String get registro;

  @nullable
  @BuiltValueField(wireName: 'fecha_de_registro')
  DateTime get fechaDeRegistro;

  @nullable
  String get anotacion;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(IndicadoresRecordBuilder builder) => builder
    ..tipo = ''
    ..registro = ''
    ..anotacion = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('indicadores');

  static Stream<IndicadoresRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<IndicadoresRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  IndicadoresRecord._();
  factory IndicadoresRecord([void Function(IndicadoresRecordBuilder) updates]) =
      _$IndicadoresRecord;

  static IndicadoresRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createIndicadoresRecordData({
  String tipo,
  String registro,
  DateTime fechaDeRegistro,
  String anotacion,
}) =>
    serializers.toFirestore(
        IndicadoresRecord.serializer,
        IndicadoresRecord((i) => i
          ..tipo = tipo
          ..registro = registro
          ..fechaDeRegistro = fechaDeRegistro
          ..anotacion = anotacion));
