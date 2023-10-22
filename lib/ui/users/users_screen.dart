import 'package:flutter/material.dart';
import 'package:mongo_db_app/data/models/user_model.dart';
import 'package:mongo_db_app/db_helper/mongo_database.dart';
import 'package:mongo_db_app/ui/users/widgets/display_card.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users Screen"),
      ),
      body: FutureBuilder(
        future: MongoDatabase.getUsers(),
        builder: (context, snapshot){
          print(snapshot.data);
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator(),);
          }
          else{
            if(snapshot.hasData){
              var data = snapshot.data;
              return ListView.builder(
                itemCount: data!.length,
                  itemBuilder: (context, index){
                  return DisplayCard(userModel: UserModel.fromJson(data[index]));
                  }
              );
            }else{
              return const Center(child: Text("Empty"),);
            }
          }
        },
      ),
    );
  }
}
