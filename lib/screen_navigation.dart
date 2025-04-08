import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ppcrv_data_viewing/screens/acm_er_details_screen.dart';
import 'package:ppcrv_data_viewing/screens/acm_er_screen.dart';
import 'package:ppcrv_data_viewing/screens/acm_screen.dart';
import 'package:ppcrv_data_viewing/screens/home_screen.dart';
import 'package:ppcrv_data_viewing/screens/scanned_details_screen.dart';
import 'package:ppcrv_data_viewing/screens/scanner_screen.dart';

toHomeScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoaderOverlay(child: HomeScreen())),
  );
}

toScannerScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LoaderOverlay(child: ScannerScreen()),
    ),
  );
}

toACMScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoaderOverlay(child: AcmScreen())),
  );
}

toACMERScreen(BuildContext context, String acmStr) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LoaderOverlay(child: AcmErScreen(acmStr: acmStr)),
    ),
  );
}

toScannedDetailsScreen(
  BuildContext context,
  String type,
  List<Map<String, dynamic>> dataResult,
) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder:
          (context) => LoaderOverlay(
            child: ScannedDetailsScreen(
              contestType: type,
              dataResult: dataResult,
            ),
          ),
    ),
  );
}

toACMERDetailsScreen(BuildContext context, String acmStr, String type) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder:
          (context) => LoaderOverlay(
            child: AcmErDetailsScreen(acmStr: acmStr, contestType: type),
          ),
    ),
  );
}
