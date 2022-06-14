import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'citas_asignadas_record.g.dart';

abstract class CitasAsignadasRecord
    implements Built<CitasAsignadasRecord, CitasAsignadasRecordBuilder> {
  static Serializer<CitasAsignadasRecord> get serializer =>
      _$citasAsignadasRecordSerializer;

  @nullable
  DateTime get dia;

  @nullable
  DateTime get hora;

  @nullable
  String get lugar;

  @nullable
  @BuiltValueField(wireName: 'profesional_encargado')
  String get profesionalEncargado;

  @nullable
  @BuiltValueField(wireName: 'usuario_asignado')
  BuiltList<DocumentReference> get usuarioAsignado;

  @nullable
  @BuiltValueField(wireName: 'listado_recordatorio')
  BuiltList<DocumentReference> get listadoRecordatorio;

  @nullable
  @BuiltValueField(wireName: 'nombre_asignado')
  String get nombreAsignado;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CitasAsignadasRecordBuilder builder) => builder
    ..lugar = ''
    ..profesionalEncargado = ''
    ..usuarioAsignado = ListBuilder()
    ..listadoRecordatorio = ListBuilder()
    ..nombreAsignado = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('citas_asignadas');

  static Stream<CitasAsignadasRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CitasAsignadasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CitasAsignadasRecord._();
  factory CitasAsignadasRecord(
          [void Function(CitasAsignadasRecordBuilder) updates]) =
      _$CitasAsignadasRecord;

  static CitasAsignadasRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCitasAsignadasRecordData({
  DateTime dia,
  DateTime hora,
  String lugar,
  String profesionalEncargado,
  String nombreAsignado,
}) =>
    serializers.toFirestore(
        CitasAsignadasRecord.serializer,
        CitasAsignadasRecord((c) => c
          ..dia = dia
          ..hora = hora
          ..lugar = lugar
          ..profesionalEncargado = profesionalEncargado
          ..usuarioAsignado = null
          ..listadoRecordatorio = null
          ..nombreAsignado = nombreAsignado));
