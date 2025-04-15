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
  bool isElectionIdScanned = false;
  bool isLocalScanned = false;
  bool isNationalScanned = false;
  bool isPartyListScanned = false;

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
          appBar: AppBar(
            backgroundColor: blueColor,
            iconTheme: IconThemeData(color: whiteColor),
            title: Text('Scan ER', style: TextStyle(color: whiteColor)),
            titleSpacing: 0,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
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
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: textLabel(
                        text:
                            '* Please scan first the election id QR (last QR)',
                        color: whiteColor,
                        weight: FontWeight.bold,
                        align: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 5),
                    primaryButton(
                      text:
                          isElectionIdScanned
                              ? 'Re-Scan Election Id'
                              : 'Scan Election Id',
                      isVisible: isElectionIdScanned,
                      buttonColor: blueColor.withValues(alpha: 0.8),
                      onPressed: () async {
                        toScannerScreen(context);
                      },
                    ),
                    const SizedBox(height: 10),
                    primaryButton(
                      text: isLocalScanned ? 'Re-Scan Local' : 'Scan Local',
                      isVisible: isLocalScanned,
                      buttonColor: blueColor.withValues(alpha: 0.8),
                      onPressed: () async {
                        toScannerScreen(context);
                      },
                    ),
                    const SizedBox(height: 10),
                    primaryButton(
                      text:
                          isNationalScanned
                              ? 'Re-Scan National'
                              : 'Scan National',
                      isVisible: isNationalScanned,
                      buttonColor: blueColor.withValues(alpha: 0.8),
                      onPressed: () async {
                        toScannerScreen(context);
                      },
                    ),
                    const SizedBox(height: 10),
                    primaryButton(
                      text:
                          isPartyListScanned
                              ? 'Re-Scan Party List'
                              : 'Scan Party List',
                      isVisible: isPartyListScanned,
                      buttonColor: blueColor.withValues(alpha: 0.8),
                      onPressed: () async {
                        toScannerScreen(context);
                      },
                    ),
                    const SizedBox(height: 50),
                    primaryButton(
                      text: 'Submit',
                      buttonColor: lightGreenColor.withValues(alpha: 0.8),
                      onPressed: () async {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
