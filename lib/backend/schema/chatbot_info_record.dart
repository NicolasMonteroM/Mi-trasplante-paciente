import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chatbot_info_record.g.dart';

abstract class ChatbotInfoRecord
    implements Built<ChatbotInfoRecord, ChatbotInfoRecordBuilder> {
  static Serializer<ChatbotInfoRecord> get serializer =>
      _$chatbotInfoRecordSerializer;

  @nullable
  String get mensaje;

  @nullable
  String get imagen;

  @nullable
  @BuiltValueField(wireName: 'whatsapp_link')
  String get whatsappLink;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ChatbotInfoRecordBuilder builder) => builder
    ..mensaje = ''
    ..imagen = ''
    ..whatsappLink = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chatbot_info');

  static Stream<ChatbotInfoRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ChatbotInfoRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ChatbotInfoRecord._();
  factory ChatbotInfoRecord([void Function(ChatbotInfoRecordBuilder) updates]) =
      _$ChatbotInfoRecord;

  static ChatbotInfoRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createChatbotInfoRecordData({
  String mensaje,
  String imagen,
  String whatsappLink,
}) =>
    serializers.toFirestore(
        ChatbotInfoRecord.serializer,
        ChatbotInfoRecord((c) => c
          ..mensaje = mensaje
          ..imagen = imagen
          ..whatsappLink = whatsappLink));
