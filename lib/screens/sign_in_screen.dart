import 'package:flutter/material.dart';
import 'package:ppcrv_data_viewing/colors.dart';
import 'package:ppcrv_data_viewing/screen_navigation.dart';
import 'package:ppcrv_data_viewing/ui.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _code = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/im_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: blueColor.withValues(alpha: 0.7),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Spacer(),
                primaryImageAsset(
                  context: context,
                  imageAsset: 'assets/images/im_logo.png',
                ),
                const SizedBox(height: 30),
                inputTextField(
                  fieldController: _username,
                  labelText: 'Username',
                ),
                const SizedBox(height: 20),
                inputTextField(fieldController: _code, labelText: 'Code'),
                const SizedBox(height: 50),
                primaryButton(
                  text: 'Sign In',
                  onPressed: () async {
                    toAddressScreen(context);
                  },
                ),
                const SizedBox(height: 10),
                textLabel(
                  text: '2025 Election Powered By MyTech',
                  color: whiteColor,
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
