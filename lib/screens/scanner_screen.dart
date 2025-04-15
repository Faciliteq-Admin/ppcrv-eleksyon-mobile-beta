// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:ppcrv_data_viewing/colors.dart';
import 'package:ppcrv_data_viewing/screen_navigation.dart';
import 'package:ppcrv_data_viewing/ui.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  bool isLastQR = false;
  List<Map<String, dynamic>> dataResult = [];
  late QRViewController _qrViewController;
  final _qrKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _qrViewController;
  }

  void _pauseScanner() {
    _qrViewController.pauseCamera();
  }

  void _resumeScanner() {
    _qrViewController.resumeCamera();
  }

  void _onQRViewCreated(QRViewController controller) {
    _qrViewController = controller;
    _qrViewController.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        if (scanData.code!.contains('LOCAL') ||
            scanData.code!.contains('NATIONAL') ||
            scanData.code!.contains('PARTY LIST')) {
          if (isLastQR) {
            _pauseScanner();
            dataResult = [];
            var type = scanData.code!.trim().split('\n')[0];
            toScannedDetailsScreen(context, scanData.code!, type);
            _resumeScanner();
          } else {
            _pauseScanner();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: textLabel(
                    text: 'Oopps',
                    color: blackColor,
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                  content: textLabel(
                    text: 'Please scan first the election id QR (last QR)',
                    color: blackColor,
                    size: 14,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        _resumeScanner();
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: blueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                );
              },
            );
          }
        } else {
          _pauseScanner();
          setState(() {
            isLastQR = true;
          });
          if (scanData.code!.contains('RV')) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: textLabel(
                    text: 'Proceed',
                    color: blackColor,
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                  content: textLabel(
                    text: 'Please scan the remaing QR\u0027s',
                    color: blackColor,
                    size: 14,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        _resumeScanner();
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: blueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: textLabel(
                    text: 'Oopps',
                    color: blackColor,
                    size: 18,
                    weight: FontWeight.bold,
                  ),
                  content: textLabel(
                    text: 'Please try again',
                    color: blackColor,
                    size: 14,
                  ),
                  actions: [
                    TextButton(
                      onPressed: () async {
                        _resumeScanner();
                        Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                      ),
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: blueColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                );
              },
            );
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        iconTheme: IconThemeData(color: whiteColor),
        title: Text('ER Scanner', style: TextStyle(color: whiteColor)),
        titleSpacing: 0,
      ),
      body: Stack(
        children: [
          QRView(key: _qrKey, onQRViewCreated: _onQRViewCreated),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                border: Border.all(color: blueColor, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
