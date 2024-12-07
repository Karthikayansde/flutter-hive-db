import 'package:hive/hive.dart';
import 'package:hive_example/HiveModel.dart';

class Boxes {
  static Box<Employee> getEmployee() => Hive.box<Employee>('employee');
}
