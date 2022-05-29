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
  DateTime get fechaInicio;

  @nullable
  DateTime get fechaFinalizacion;

  @nullable
  bool get existeFinalizacion;

  @nullable
  String get imagen;

  @nullable
  String get dosis;

  @nullable
  String get repeticiones;

  @nullable
  String get presentacion;

  @nullable
  String get concentracion;

  @nullable
  String get repeticionesP2;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RecordatoriosRecordBuilder builder) => builder
    ..indicacionesDeConsumo = ''
    ..nombre = ''
    ..tipo = ''
    ..tomaDefinida = false
    ..tomaSaltada = false
    ..existeFinalizacion = false
    ..imagen = ''
    ..dosis = ''
    ..repeticiones = ''
    ..presentacion = ''
    ..concentracion = ''
    ..repeticionesP2 = '';

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
  DateTime fechaInicio,
  DateTime fechaFinalizacion,
  bool existeFinalizacion,
  String imagen,
  String dosis,
  String repeticiones,
  String presentacion,
  String concentracion,
  String repeticionesP2,
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
          ..fecha = fecha
          ..fechaInicio = fechaInicio
          ..fechaFinalizacion = fechaFinalizacion
          ..existeFinalizacion = existeFinalizacion
          ..imagen = imagen
          ..dosis = dosis
          ..repeticiones = repeticiones
          ..presentacion = presentacion
          ..concentracion = concentracion
          ..repeticionesP2 = repeticionesP2));
