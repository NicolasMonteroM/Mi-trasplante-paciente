import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'contenidos_record.g.dart';

abstract class ContenidosRecord
    implements Built<ContenidosRecord, ContenidosRecordBuilder> {
  static Serializer<ContenidosRecord> get serializer =>
      _$contenidosRecordSerializer;

  @nullable
  String get nombre;

  @nullable
  @BuiltValueField(wireName: 'preview_image')
  String get previewImage;

  @nullable
  @BuiltValueField(wireName: 'categoria_principal')
  String get categoriaPrincipal;

  @nullable
  @BuiltValueField(wireName: 'categorias_secundarias')
  BuiltList<String> get categoriasSecundarias;

  @nullable
  @BuiltValueField(wireName: 'etapas_relevantes')
  BuiltList<String> get etapasRelevantes;

  @nullable
  @BuiltValueField(wireName: 'img_micro_1')
  String get imgMicro1;

  @nullable
  @BuiltValueField(wireName: 'img_micro_2')
  String get imgMicro2;

  @nullable
  @BuiltValueField(wireName: 'img_micro_3')
  String get imgMicro3;

  @nullable
  @BuiltValueField(wireName: 'img_micro_4')
  String get imgMicro4;

  @nullable
  @BuiltValueField(wireName: 'img_micro_5')
  String get imgMicro5;

  @nullable
  @BuiltValueField(wireName: 'nombre_micro_1')
  String get nombreMicro1;

  @nullable
  @BuiltValueField(wireName: 'nombre_micro_2')
  String get nombreMicro2;

  @nullable
  @BuiltValueField(wireName: 'nombre_micro_3')
  String get nombreMicro3;

  @nullable
  @BuiltValueField(wireName: 'nombre_micro_4')
  String get nombreMicro4;

  @nullable
  @BuiltValueField(wireName: 'nombre_micro_5')
  String get nombreMicro5;

  @nullable
  @BuiltValueField(wireName: 'tipo_img_micro_1')
  String get tipoImgMicro1;

  @nullable
  @BuiltValueField(wireName: 'tipo_img_micro_2')
  String get tipoImgMicro2;

  @nullable
  @BuiltValueField(wireName: 'tipo_img_micro_3')
  String get tipoImgMicro3;

  @nullable
  @BuiltValueField(wireName: 'tipo_img_micro_4')
  String get tipoImgMicro4;

  @nullable
  @BuiltValueField(wireName: 'tipo_img_micro_5')
  String get tipoImgMicro5;

  @nullable
  @BuiltValueField(wireName: 'info_micro_1')
  String get infoMicro1;

  @nullable
  @BuiltValueField(wireName: 'info_micro_2')
  String get infoMicro2;

  @nullable
  @BuiltValueField(wireName: 'info_micro_3')
  String get infoMicro3;

  @nullable
  @BuiltValueField(wireName: 'info_micro_4')
  String get infoMicro4;

  @nullable
  @BuiltValueField(wireName: 'info_micro_5')
  String get infoMicro5;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ContenidosRecordBuilder builder) => builder
    ..nombre = ''
    ..previewImage = ''
    ..categoriaPrincipal = ''
    ..categoriasSecundarias = ListBuilder()
    ..etapasRelevantes = ListBuilder()
    ..imgMicro1 = ''
    ..imgMicro2 = ''
    ..imgMicro3 = ''
    ..imgMicro4 = ''
    ..imgMicro5 = ''
    ..nombreMicro1 = ''
    ..nombreMicro2 = ''
    ..nombreMicro3 = ''
    ..nombreMicro4 = ''
    ..nombreMicro5 = ''
    ..tipoImgMicro1 = ''
    ..tipoImgMicro2 = ''
    ..tipoImgMicro3 = ''
    ..tipoImgMicro4 = ''
    ..tipoImgMicro5 = ''
    ..infoMicro1 = ''
    ..infoMicro2 = ''
    ..infoMicro3 = ''
    ..infoMicro4 = ''
    ..infoMicro5 = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('contenidos');

  static Stream<ContenidosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ContenidosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ContenidosRecord._();
  factory ContenidosRecord([void Function(ContenidosRecordBuilder) updates]) =
      _$ContenidosRecord;

  static ContenidosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createContenidosRecordData({
  String nombre,
  String previewImage,
  String categoriaPrincipal,
  String imgMicro1,
  String imgMicro2,
  String imgMicro3,
  String imgMicro4,
  String imgMicro5,
  String nombreMicro1,
  String nombreMicro2,
  String nombreMicro3,
  String nombreMicro4,
  String nombreMicro5,
  String tipoImgMicro1,
  String tipoImgMicro2,
  String tipoImgMicro3,
  String tipoImgMicro4,
  String tipoImgMicro5,
  String infoMicro1,
  String infoMicro2,
  String infoMicro3,
  String infoMicro4,
  String infoMicro5,
}) =>
    serializers.toFirestore(
        ContenidosRecord.serializer,
        ContenidosRecord((c) => c
          ..nombre = nombre
          ..previewImage = previewImage
          ..categoriaPrincipal = categoriaPrincipal
          ..categoriasSecundarias = null
          ..etapasRelevantes = null
          ..imgMicro1 = imgMicro1
          ..imgMicro2 = imgMicro2
          ..imgMicro3 = imgMicro3
          ..imgMicro4 = imgMicro4
          ..imgMicro5 = imgMicro5
          ..nombreMicro1 = nombreMicro1
          ..nombreMicro2 = nombreMicro2
          ..nombreMicro3 = nombreMicro3
          ..nombreMicro4 = nombreMicro4
          ..nombreMicro5 = nombreMicro5
          ..tipoImgMicro1 = tipoImgMicro1
          ..tipoImgMicro2 = tipoImgMicro2
          ..tipoImgMicro3 = tipoImgMicro3
          ..tipoImgMicro4 = tipoImgMicro4
          ..tipoImgMicro5 = tipoImgMicro5
          ..infoMicro1 = infoMicro1
          ..infoMicro2 = infoMicro2
          ..infoMicro3 = infoMicro3
          ..infoMicro4 = infoMicro4
          ..infoMicro5 = infoMicro5));
