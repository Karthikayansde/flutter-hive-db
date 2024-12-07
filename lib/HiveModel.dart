import 'package:hive/hive.dart';
part 'HiveModel.g.dart';

@HiveType(typeId: 0)
class Employee extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int age;
}
