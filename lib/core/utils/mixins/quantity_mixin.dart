import 'package:hive/hive.dart';

mixin QuantityMixin on HiveObject {
  @HiveField(4)
  int quantity = 0;

  void incrementQuantity() {
    quantity++;
    save();
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      save();
    }
  }
}
