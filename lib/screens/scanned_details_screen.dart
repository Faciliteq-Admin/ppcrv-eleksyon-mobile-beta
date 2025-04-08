// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:ppcrv_data_viewing/colors.dart';
import 'package:ppcrv_data_viewing/ui.dart';

class ScannedDetailsScreen extends StatefulWidget {
  String contestType;
  List<Map<String, dynamic>> dataResult;
  ScannedDetailsScreen({
    required this.contestType,
    required this.dataResult,
    super.key,
  });

  @override
  State<ScannedDetailsScreen> createState() => _ScannedDetailsScreenState();
}

class _ScannedDetailsScreenState extends State<ScannedDetailsScreen> {
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
          ),
          body: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: widget.dataResult.length,
            itemBuilder: (context, index) {
              var oneContest = widget.dataResult[index]['result'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    color: blackColor.withValues(alpha: 0.7),
                    child: textLabel(
                      text: widget.dataResult[index]['contest'],
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
