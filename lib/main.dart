import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/HiveModel.dart';
import 'package:hive_flutter/adapters.dart';
import 'Home.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(EmployeeAdapter());
  await Hive.openBox<Employee>('employee');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

// // narmal data use
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Hive.initFlutter();
//   final box = await Hive.openBox('employee');
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // Future<Box> box1() async{
//
//   final box1 = Hive.box('employee');
//   // }
//   // write
//   void writeData() {
//     // var box = box1();
//     box1.put(1, 'karthi');
//     // box.then((value) => value.put(1, 'value'));
//   }
//
//   // read
//   void readData() async {
//     print(box1.get(1));
//     AlertDialog(title: Text(box1.get(1)));
//   }
//   // delete
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(onPressed: () => writeData(), child: Text('write')),
//               ElevatedButton(onPressed: () => readData(), child: Text('read')),
//               ElevatedButton(onPressed: () {}, child: Text('delete')),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
