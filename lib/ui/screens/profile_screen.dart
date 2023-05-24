import 'package:flutter/material.dart';

import '../../ui_kit/_ui_kit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset(AppAsset.profileImage, width: 300),
          ),
          Text(
            "Hello Sunny!",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      ),
    );
  }
}
