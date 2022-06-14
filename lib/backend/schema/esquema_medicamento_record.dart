import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'esquema_medicamento_record.g.dart';

abstract class EsquemaMedicamentoRecord
    implements
        Built<EsquemaMedicamentoRecord, EsquemaMedicamentoRecordBuilder> {
  static Serializer<EsquemaMedicamentoRecord> get serializer =>
      _$esquemaMedicamentoRecordSerializer;

  @nullable
  DocumentReference get medicamento;

  @nullable
  @BuiltValueField(wireName: 'indicaciones_de_consumo')
  String get indicacionesDeConsumo;

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
  @BuiltValueField(wireName: 'imagen_medicamento')
  String get imagenMedicamento;

  @nullable
  @BuiltValueField(wireName: 'listado_recordatorios')
  BuiltList<DocumentReference> get listadoRecordatorios;

  @nullable
  String get dosis;

  @nullable
  @BuiltValueField(wireName: 'veces_al_dia')
  String get vecesAlDia;

  @nullable
  @BuiltValueField(wireName: 'usuario_asignado')
  BuiltList<DocumentReference> get usuarioAsignado;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EsquemaMedicamentoRecordBuilder builder) =>
      builder
        ..indicacionesDeConsumo = ''
        ..horasDeToma = ListBuilder()
        ..imagenMedicamento = ''
        ..listadoRecordatorios = ListBuilder()
        ..dosis = ''
        ..vecesAlDia = ''
        ..usuarioAsignado = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('esquema_medicamento');

  static Stream<EsquemaMedicamentoRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EsquemaMedicamentoRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  EsquemaMedicamentoRecord._();
  factory EsquemaMedicamentoRecord(
          [void Function(EsquemaMedicamentoRecordBuilder) updates]) =
      _$EsquemaMedicamentoRecord;

  static EsquemaMedicamentoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEsquemaMedicamentoRecordData({
  DocumentReference medicamento,
  String indicacionesDeConsumo,
  DateTime fechaInicio,
  DateTime fechaFinalizacion,
  String imagenMedicamento,
  String dosis,
  String vecesAlDia,
}) =>
    serializers.toFirestore(
        EsquemaMedicamentoRecord.serializer,
        EsquemaMedicamentoRecord((e) => e
          ..medicamento = medicamento
          ..indicacionesDeConsumo = indicacionesDeConsumo
          ..fechaInicio = fechaInicio
          ..fechaFinalizacion = fechaFinalizacion
          ..horasDeToma = null
          ..imagenMedicamento = imagenMedicamento
          ..listadoRecordatorios = null
          ..dosis = dosis
          ..vecesAlDia = vecesAlDia
          ..usuarioAsignado = null));
