import 'package:flutter/material.dart';
import 'package:mobile_project/app/controllers/sp_controller/home_controller.dart';
import 'package:mobile_project/app/data/models/sp_model/user_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user = TestController().getUser();
    return Scaffold(
      body: Center(
        child: Text("Hello ${user.name}"),
      ),
    );
  }
}
