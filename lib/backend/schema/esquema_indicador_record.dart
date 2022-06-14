import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'esquema_indicador_record.g.dart';

abstract class EsquemaIndicadorRecord
    implements Built<EsquemaIndicadorRecord, EsquemaIndicadorRecordBuilder> {
  static Serializer<EsquemaIndicadorRecord> get serializer =>
      _$esquemaIndicadorRecordSerializer;

  @nullable
  String get tipo;

  @nullable
  @BuiltValueField(wireName: 'fecha_inicio')
  DateTime get fechaInicio;

  @nullable
  @BuiltValueField(wireName: 'fecha_finalizacion')
  DateTime get fechaFinalizacion;

  @nullable
  @BuiltValueField(wireName: 'horas_de_toma')
  BuiltList<DateTime> get horasDeToma;

  @nullable
  @BuiltValueField(wireName: 'veces_al_dia')
  String get vecesAlDia;

  @nullable
  @BuiltValueField(wireName: 'usuario_asignado')
  BuiltList<DocumentReference> get usuarioAsignado;

  @nullable
  @BuiltValueField(wireName: 'listado_recordatorios')
  BuiltList<DocumentReference> get listadoRecordatorios;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EsquemaIndicadorRecordBuilder builder) =>
      builder
        ..tipo = ''
        ..horasDeToma = ListBuilder()
        ..vecesAlDia = ''
        ..usuarioAsignado = ListBuilder()
        ..listadoRecordatorios = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('esquema_indicador');

  static Stream<EsquemaIndicadorRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EsquemaIndicadorRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EsquemaIndicadorRecord._();
  factory EsquemaIndicadorRecord(
          [void Function(EsquemaIndicadorRecordBuilder) updates]) =
      _$EsquemaIndicadorRecord;

  static EsquemaIndicadorRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEsquemaIndicadorRecordData({
  String tipo,
  DateTime fechaInicio,
  DateTime fechaFinalizacion,
  String vecesAlDia,
}) =>
    serializers.toFirestore(
        EsquemaIndicadorRecord.serializer,
        EsquemaIndicadorRecord((e) => e
          ..tipo = tipo
          ..fechaInicio = fechaInicio
          ..fechaFinalizacion = fechaFinalizacion
          ..horasDeToma = null
          ..vecesAlDia = vecesAlDia
          ..usuarioAsignado = null
          ..listadoRecordatorios = null));
