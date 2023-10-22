import 'package:mongo_dart/mongo_dart.dart';

class UserModel {
  final ObjectId id;
  final String firstName;
  final String lastName;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(id: json["_id"], firstName: json["firstName"], lastName: json["lastName"]);
  }

  Map<String, dynamic> toJson(){
    return {
      "_id": id,
      "firstName": firstName,
      "lastName": lastName
    };
  }

}
