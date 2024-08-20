import 'package:eb_demo_app/src/features/chat/data/model/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  const factory Chat({
    @JsonKey(name: "_id") required String id,
    required User sender,
    required User receiver,
    required String room,
    required bool isRead,
    required String message,
    required String createdAt,
    required String updatedAt,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
