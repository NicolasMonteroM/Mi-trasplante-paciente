import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'medicamentos_record.g.dart';

abstract class MedicamentosRecord
    implements Built<MedicamentosRecord, MedicamentosRecordBuilder> {
  static Serializer<MedicamentosRecord> get serializer =>
      _$medicamentosRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'principio_activo')
  String get principioActivo;

  @nullable
  String get concentracion;

  @nullable
  @BuiltValueField(wireName: 'forma_farmaceutica')
  String get formaFarmaceutica;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MedicamentosRecordBuilder builder) => builder
    ..principioActivo = ''
    ..concentracion = ''
    ..formaFarmaceutica = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('medicamentos');

  static Stream<MedicamentosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MedicamentosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  static MedicamentosRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      MedicamentosRecord(
        (c) => c
          ..principioActivo = snapshot.data['principio_activo']
          ..concentracion = snapshot.data['concentracion']
          ..formaFarmaceutica = snapshot.data['forma_farmaceutica']
          ..reference = MedicamentosRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<MedicamentosRecord>> search(
          {String term,
          FutureOr<LatLng> location,
          int maxResults,
          double searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'medicamentos',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  MedicamentosRecord._();
  factory MedicamentosRecord(
          [void Function(MedicamentosRecordBuilder) updates]) =
      _$MedicamentosRecord;

  static MedicamentosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMedicamentosRecordData({
  String principioActivo,
  String concentracion,
  String formaFarmaceutica,
}) =>
    serializers.toFirestore(
        MedicamentosRecord.serializer,
        MedicamentosRecord((m) => m
          ..principioActivo = principioActivo
          ..concentracion = concentracion
          ..formaFarmaceutica = formaFarmaceutica));
