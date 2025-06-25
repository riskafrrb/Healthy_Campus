import 'package:hive/hive.dart';

part 'food_store_model.g.dart';

@HiveType(typeId: 1)
class FoodStoreModel extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String address;

  FoodStoreModel({required this.name, required this.address});
}
