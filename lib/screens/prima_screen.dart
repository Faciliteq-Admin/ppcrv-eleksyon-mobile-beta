import 'package:flutter/material.dart';
import 'package:ppcrv_data_viewing/colors.dart';
import 'package:ppcrv_data_viewing/screen_navigation.dart';
import 'package:ppcrv_data_viewing/ui.dart';

class PrimaScreen extends StatefulWidget {
  const PrimaScreen({super.key});

  @override
  State<PrimaScreen> createState() => _PrimaScreenState();
}

class _PrimaScreenState extends State<PrimaScreen> {
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
                textLabel(
                  text: 'Result Data',
                  color: whiteColor,
                  size: 30,
                  weight: FontWeight.bold,
                  align: TextAlign.center,
                ),
                const SizedBox(height: 30),
                primaryButton(
                  text: 'Scan ER',
                  buttonColor: blueColor.withValues(alpha: 0.8),
                  onPressed: () async {
                    toHomeScreen(context);
                  },
                ),
                const SizedBox(height: 30),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
