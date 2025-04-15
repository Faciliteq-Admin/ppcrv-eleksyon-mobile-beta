import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:ppcrv_data_viewing/screens/acm_er_details_screen.dart';
import 'package:ppcrv_data_viewing/screens/acm_er_screen.dart';
import 'package:ppcrv_data_viewing/screens/acm_screen.dart';
import 'package:ppcrv_data_viewing/screens/address_screen.dart';
import 'package:ppcrv_data_viewing/screens/home_screen.dart';
import 'package:ppcrv_data_viewing/screens/prima_screen.dart';
import 'package:ppcrv_data_viewing/screens/scanned_details_screen.dart';
import 'package:ppcrv_data_viewing/screens/scanner_screen.dart';

toPrimaScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LoaderOverlay(child: PrimaScreen()),
    ),
  );
}

toHomeScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => LoaderOverlay(child: HomeScreen())),
  );
}

toAddressScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LoaderOverlay(child: AddressScreen()),
    ),
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

toScannedDetailsScreen(BuildContext context, String scannedData, String type) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder:
          (context) => LoaderOverlay(
            child: ScannedDetailsScreen(
              scannedData: scannedData,
              contestType: type,
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
