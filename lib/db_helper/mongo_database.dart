import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:mongo_db_app/data/models/user_model.dart';
import 'package:mongo_db_app/db_helper/constants.dart';

class MongoDatabase{
  static var db, collection;
  static connect() async{
    db = await Db.create(mongoDbConnectUrl);
    await db.open();
    inspect(db);
    collection = db.collection(userCollection);
  }

  static Future<String> insert(UserModel userModel) async{
    try{
      var result = await collection.insertOne(userModel.toJson());
      if(result.isSuccess){
        return "Added User";
      }else{
        return "Something wrong model";
      }
    }catch(e){
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getUsers() async{
    final users = await collection.find().toList();
    return users;
  }
}