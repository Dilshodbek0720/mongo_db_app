import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:mongo_db_app/data/models/user_model.dart';
import 'package:mongo_db_app/db_helper/mongo_database.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Screen"),),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            TextButton(onPressed: () {
              insertUser(firstName: "Dilshodbek", lastName: "Sayitqulov");
            }, child: const Text("Add User"))
          ],
        ),
      ),
    );
  }
}


Future<void> insertUser({required String firstName, required String lastName}) async{
  var id = M.ObjectId();
  final data = UserModel(id: id, firstName: firstName, lastName: lastName);
  var result = await MongoDatabase.insert(data);
}