import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_project/app/controllers/sp_controller/account_controller.dart';
import 'package:mobile_project/app/controllers/sp_controller/user_controller.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find<AccountController>();
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF212121),
      title: const Text(
        'Account',
        style: TextStyle(
            fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  Widget buildBody() {
    final UserController userController = Get.find<UserController>();
    return ListView(
      children: [
        buildListile(
          title: 'Username',
          subtitle: userController.user.value.nameHash,
        ),
        buildListile(
          title: 'Email',
          subtitle: userController.user.value.email,
        ),
        buildPasswordTile(
          title: 'Password',
          subtitle: userController.user.value.password,
        ),
        buildListile(
          title: 'Subscription',
          subtitle: userController.user.value.subscriptionType,
        ),
      ],
    );
  }

  Widget buildListile({
    required String title,
    String? subtitle,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        subtitle ?? '',
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget buildPasswordTile({
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      subtitle: Text(
        _isPasswordVisible ? subtitle : '•' * subtitle.length,
        style: const TextStyle(
          fontSize: 18.0,
          color: Colors.grey,
        ),
      ),
      trailing: IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: Colors.white,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      ),
    );
  }
}
