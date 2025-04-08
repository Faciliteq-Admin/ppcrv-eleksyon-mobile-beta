// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppcrv_data_viewing/colors.dart';
import 'package:ppcrv_data_viewing/screen_navigation.dart';
import 'package:ppcrv_data_viewing/ui.dart';

class AcmErDetailsScreen extends StatefulWidget {
  String acmStr;
  String contestType;
  AcmErDetailsScreen({
    required this.acmStr,
    required this.contestType,
    super.key,
  });

  @override
  State<AcmErDetailsScreen> createState() => _AcmErDetailsScreenState();
}

class _AcmErDetailsScreenState extends State<AcmErDetailsScreen> {
  List<Map<String, dynamic>> dataResult = [
    {
      'contest': '00775000',
      'result': [
        '1: 20',
        '2: 0',
        '3: 0',
        '4: 1',
        '5: 10',
        '6: 0',
        '7: 2',
        '8: 1',
        '9: 4',
        '10: 0',
      ],
    },
  ];

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
            title: Text(
              widget.contestType,
              style: TextStyle(color: whiteColor),
            ),
            titleSpacing: 0,
            actions: [
              IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/ic_scanner.svg',
                  height: 24,
                  width: 24,
                  fit: BoxFit.scaleDown,
                  colorFilter: const ColorFilter.mode(
                    whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
                onPressed: () async {
                  toScannerScreen(context);
                },
              ),
            ],
          ),
          body: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: dataResult.length,
            itemBuilder: (context, index) {
              var oneContest = dataResult[index]['result'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    color: blackColor.withValues(alpha: 0.7),
                    child: textLabel(
                      text: dataResult[index]['contest'],
                      color: whiteColor,
                      size: 14,
                      weight: FontWeight.bold,
                    ),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: oneContest.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        color:
                            (index % 2 == 0)
                                ? whiteColor.withValues(alpha: 0.7)
                                : lightGrayColor.withValues(alpha: 0.7),
                        child: textLabel(
                          text: oneContest[index],
                          color: blackColor,
                          size: 14,
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
