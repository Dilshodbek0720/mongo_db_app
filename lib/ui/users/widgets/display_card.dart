import 'package:flutter/material.dart';
import 'package:mongo_db_app/data/models/user_model.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({super.key, required this.userModel});
  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userModel.firstName),
              Text(userModel.lastName),
            ],
          ),
        ),
      ),
    );
  }
}
