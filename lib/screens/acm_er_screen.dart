// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ppcrv_data_viewing/colors.dart';
import 'package:ppcrv_data_viewing/screen_navigation.dart';
import 'package:ppcrv_data_viewing/ui.dart';

class AcmErScreen extends StatefulWidget {
  String acmStr;
  AcmErScreen({required this.acmStr, super.key});

  @override
  State<AcmErScreen> createState() => _AcmErScreenState();
}

class _AcmErScreenState extends State<AcmErScreen> {
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
            title: Text(widget.acmStr, style: TextStyle(color: whiteColor)),
            titleSpacing: 0,
          ),
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
                  text: 'Show Result',
                  color: whiteColor,
                  size: 30,
                  weight: FontWeight.bold,
                  align: TextAlign.center,
                ),
                const SizedBox(height: 30),
                primaryButton(
                  text: 'LOCAL',
                  onPressed: () async {
                    toACMERDetailsScreen(context, widget.acmStr, 'LOCAL');
                  },
                ),
                const SizedBox(height: 10),
                primaryButton(
                  text: 'NATIONAL',
                  onPressed: () async {
                    toACMERDetailsScreen(context, widget.acmStr, 'NATIONAL');
                  },
                ),
                const SizedBox(height: 10),
                primaryButton(
                  text: 'PARTY  LIST',
                  onPressed: () async {
                    toACMERDetailsScreen(context, widget.acmStr, 'PARTY LIST');
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
