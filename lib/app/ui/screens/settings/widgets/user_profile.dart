import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    this.photoUrl,
    this.name,
  });

  final String? photoUrl;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Row(
        children: [
          buildProfileImage(),
          const SizedBox(width: 24),
          buildUserInfo(),
        ],
      ),
    );
  }

  Widget buildProfileImage() {
    return ClipOval(
      child: Image.network(
        photoUrl ?? '',
        width: 75,
        height: 75,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildUserInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name ?? 'N/A',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22.0,
          ),
        ),
        Text(
          tr('button.view_profile'),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
