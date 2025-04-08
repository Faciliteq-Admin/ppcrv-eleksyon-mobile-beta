import 'package:flutter/material.dart';
import 'package:ppcrv_data_viewing/colors.dart';
import 'package:ppcrv_data_viewing/screen_navigation.dart';
import 'package:ppcrv_data_viewing/ui.dart';

class AcmScreen extends StatefulWidget {
  const AcmScreen({super.key});

  @override
  State<AcmScreen> createState() => _AcmScreenState();
}

class _AcmScreenState extends State<AcmScreen> {
  List acmList = [
    '00000001',
    '00000002',
    '00000003',
    '00000004',
    '00000005',
    '00000006',
    '00000007',
    '00000008',
    '00000009',
    '00000010',
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
              'Clustered Precinct Id\u0027s',
              style: TextStyle(color: whiteColor),
            ),
            titleSpacing: 0,
          ),
          body: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: acmList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () async {
                  toACMERScreen(context, acmList[index].toString());
                },
                child: Container(
                  color:
                      (index % 2 == 0)
                          ? whiteColor.withValues(alpha: 0.7)
                          : lightGrayColor.withValues(alpha: 0.7),
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/im_logo.png',
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 10),
                        textLabel(
                          text: acmList[index],
                          color: blackColor,
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
