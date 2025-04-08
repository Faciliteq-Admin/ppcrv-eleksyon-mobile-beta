import 'package:flutter/material.dart';
import 'package:ppcrv_data_viewing/colors.dart';
import 'package:ppcrv_data_viewing/screen_navigation.dart';
import 'package:ppcrv_data_viewing/ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  text: 'Result Data Viewing',
                  color: whiteColor,
                  size: 30,
                  weight: FontWeight.bold,
                  align: TextAlign.center,
                ),
                const SizedBox(height: 30),
                primaryButton(
                  text: 'ACM\u0027s',
                  onPressed: () async {
                    toACMScreen(context);
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: redColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: textLabel(
                    text:
                        '* Please scan first the last QR before the other QR\u0027s',
                    color: whiteColor,
                    weight: FontWeight.bold,
                    align: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 5),
                primaryButton(
                  text: 'Scan an ER\u0027s',
                  onPressed: () async {
                    toScannerScreen(context);
                  },
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
