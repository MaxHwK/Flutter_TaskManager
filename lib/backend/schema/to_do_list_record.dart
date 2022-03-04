import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'to_do_list_record.g.dart';

abstract class ToDoListRecord
    implements Built<ToDoListRecord, ToDoListRecordBuilder> {
  static Serializer<ToDoListRecord> get serializer =>
      _$toDoListRecordSerializer;

  @nullable
  String get toDoName;

  @nullable
  String get toDoDescription;

  @nullable
  bool get toDoState;

  @nullable
  String get username;

  @nullable
  DateTime get toDoDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ToDoListRecordBuilder builder) => builder
    ..toDoName = ''
    ..toDoDescription = ''
    ..toDoState = false
    ..username = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ToDoList');

  static Stream<ToDoListRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ToDoListRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ToDoListRecord._();
  factory ToDoListRecord([void Function(ToDoListRecordBuilder) updates]) =
      _$ToDoListRecord;

  static ToDoListRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createToDoListRecordData({
  String toDoName,
  String toDoDescription,
  bool toDoState,
  String username,
  DateTime toDoDate,
}) =>
    serializers.toFirestore(
        ToDoListRecord.serializer,
        ToDoListRecord((t) => t
          ..toDoName = toDoName
          ..toDoDescription = toDoDescription
          ..toDoState = toDoState
          ..username = username
          ..toDoDate = toDoDate));
