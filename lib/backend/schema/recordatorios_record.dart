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
  String get imagen;

  @nullable
  DocumentReference get medicamento;

  @nullable
  String get nombre;

  @nullable
  @BuiltValueField(wireName: 'usuario_asignado')
  BuiltList<DocumentReference> get usuarioAsignado;

  @nullable
  String get tipo;

  @nullable
  @BuiltValueField(wireName: 'tipo_indicador')
  String get tipoIndicador;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RecordatoriosRecordBuilder builder) => builder
    ..indicacionesDeConsumo = ''
    ..tomaDefinida = false
    ..tomaSaltada = false
    ..imagen = ''
    ..nombre = ''
    ..usuarioAsignado = ListBuilder()
    ..tipo = ''
    ..tipoIndicador = '';

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
  DateTime hora,
  bool tomaDefinida,
  bool tomaSaltada,
  DateTime fecha,
  String imagen,
  DocumentReference medicamento,
  String nombre,
  String tipo,
  String tipoIndicador,
}) =>
    serializers.toFirestore(
        RecordatoriosRecord.serializer,
        RecordatoriosRecord((r) => r
          ..indicacionesDeConsumo = indicacionesDeConsumo
          ..hora = hora
          ..tomaDefinida = tomaDefinida
          ..tomaSaltada = tomaSaltada
          ..fecha = fecha
          ..imagen = imagen
          ..medicamento = medicamento
          ..nombre = nombre
          ..usuarioAsignado = null
          ..tipo = tipo
          ..tipoIndicador = tipoIndicador));
