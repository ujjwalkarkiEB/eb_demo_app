import 'package:hive/hive.dart';

part 'notification_badge_model.g.dart';

@HiveType(typeId: 0)
class NotificationBadgeModel extends HiveObject {
  @HiveField(0)
  late String userId;

  @HiveField(1)
  late int badgeCount;

  NotificationBadgeModel({required this.userId, this.badgeCount = 1});
  void incrementUnreadCount() {
    badgeCount++;
    save();
  }

  void resetUnreadCount() {
    badgeCount = 1;
    save();
  }
}
