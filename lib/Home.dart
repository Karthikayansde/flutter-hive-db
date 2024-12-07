import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_example/HiveModel.dart';
import 'package:hive_flutter/adapters.dart';

import 'Boxes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // addEmployee("karthi", 20);
    // addEmployee('siva', 25);
    super.initState();
  }

  @override
  void dispose() {
    // Hive.box('employee').close();
    super.dispose();
  }

  Future addEmployee(String name, int age) async {
    final emp = Employee();
      emp.name = name;
      emp.age = age;

    final box = Boxes.getEmployee();
    // box.add(emp);
    box.add(emp);

    final mybox = Boxes.getEmployee();
    final myTransaction = mybox.get('mykey');
    print(myTransaction);
    print(mybox.values.first.name);
    print(mybox.keys);
  }

  void editEmployee(Employee employee, String name, int age) {
    employee.name = name;
    employee.age = age;
    // employee.save();
    final box = Boxes.getEmployee();
    box.put(employee.key, employee);
  }

  void deleteEmployee(Employee employee) {
    // employee.delete();
    final box = Boxes.getEmployee();
    box.delete(employee.key);
  }

  // void showData() {
  //   final box = Hive.box('employee');
  //   final myval = box.get('siva');
  //   print(myval);
  //   // final dataWithJohn = box.values.where((data) => data.name == ' Doe');
  // }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  void showForm(BuildContext, int? itemKey) {
    showModalBottomSheet(
        context: context,
        builder: (_) => Container(
              child: Column(
                children: [
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(hintText: 'name'),
                  ),
                  TextField(
                    controller: _ageController,
                    decoration: InputDecoration(hintText: 'age'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addEmployee(_nameController.text, int.parse(_ageController.text));
                        setState(() {
                          
                        });
                        Navigator.pop(context);
                      },
                      child: Text('enter to save'))
                ],
              ),
            ));
  }

  static int value = 0;
  @override
  Widget build(BuildContext context) {

    final mybox = Boxes.getEmployee();
    for(int i = 0; mybox.values.length > i; i++){
      print("name is : ${mybox.getAt(i)?.name}");
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive DataBase"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showForm(context, null),
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Container(

          child: Column(
            children: [
              for(int i = 0 ; i<mybox.length; i++)
                Row(children: [Text(mybox.getAt(i)!.name),Text(mybox.getAt(i)!.age.toString())]),
              ElevatedButton(onPressed: (){
                var val = Employee();
                mybox.delete("6");
                var sample = Employee();
                sample.name = "k";
                sample.age = 22;
                print(mybox.get("6", defaultValue: sample)?.name);
                setState(() {
                });
                value = (value+1);
                val.name = "lkkl";
                val.age = value;
                mybox.put("6",val);
                setState(() {
                });
              }, child: Text("click"))
            ],
          ),
        )
    //     ListView.builder(
    //       scrollDirection: Axis.vertical,
    //       itemCount: mybox.length,
    //       itemBuilder: (context, index){
    //         return Text(val.current.name);
    //       }
    // ),
    )
    // ValueListenableBuilder<Box<Employee>>(
    //   valueListenable: Boxes.getEmployee().listenable(),
    //   builder: (context, box, _) {
    //     // Check if the box is open and of the correct type
    //     if (box.isOpen && box.name == 'employee') {
    //       final transactions = box.values.toList().cast<Employee>();
    //       return transactions.length != 0
    //           ? ListView.builder(
    //         scrollDirection: Axis.vertical,
    //           itemBuilder: (context, index) {
    //               if (transactions.length > index) {
    //                 return Text(transactions[index].name);
    //               }
    //             })
    //           : Text("it's null");
    //     } else {
    //       return Text("Box is not open or has the wrong type.");
    //     }
    //   },
    // ),
    );
    }
  }
