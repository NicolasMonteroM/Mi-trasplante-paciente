import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recordatorios_record.g.dart';

abstract class RecordatoriosRecord
    implements Built<RecordatoriosRecord, RecordatoriosRecordBuilder> {
  static Serializer<RecordatoriosRecord> get serializer =>
      _$recordatoriosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'indicaciones_de_consumo')
  String get indicacionesDeConsumo;

  @nullable
  String get nombre;

  @nullable
  String get tipo;

  @nullable
  DateTime get hora;

  @nullable
  @BuiltValueField(wireName: 'toma_definida')
  bool get tomaDefinida;

  @nullable
  @BuiltValueField(wireName: 'toma_saltada')
  bool get tomaSaltada;

  @nullable
  DateTime get fecha;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RecordatoriosRecordBuilder builder) => builder
    ..indicacionesDeConsumo = ''
    ..nombre = ''
    ..tipo = ''
    ..tomaDefinida = false
    ..tomaSaltada = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recordatorios');

  static Stream<RecordatoriosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RecordatoriosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  RecordatoriosRecord._();
  factory RecordatoriosRecord(
          [void Function(RecordatoriosRecordBuilder) updates]) =
      _$RecordatoriosRecord;

  static RecordatoriosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRecordatoriosRecordData({
  String indicacionesDeConsumo,
  String nombre,
  String tipo,
  DateTime hora,
  bool tomaDefinida,
  bool tomaSaltada,
  DateTime fecha,
}) =>
    serializers.toFirestore(
        RecordatoriosRecord.serializer,
        RecordatoriosRecord((r) => r
          ..indicacionesDeConsumo = indicacionesDeConsumo
          ..nombre = nombre
          ..tipo = tipo
          ..hora = hora
          ..tomaDefinida = tomaDefinida
          ..tomaSaltada = tomaSaltada
          ..fecha = fecha));
