import 'package:flutter/material.dart';
import 'package:ppcrv_data_viewing/colors.dart';
import 'package:ppcrv_data_viewing/screen_navigation.dart';
import 'package:ppcrv_data_viewing/ui.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _province = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _barangay = TextEditingController();

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
        child: PopScope(
          canPop: false,
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
                  dropdownTextField(
                    context: context,
                    labelText: 'Province',
                    fieldController: _province,
                    items: [],
                  ),
                  const SizedBox(height: 20),
                  dropdownTextField(
                    context: context,
                    labelText: 'City',
                    fieldController: _city,
                    items: [],
                  ),
                  const SizedBox(height: 20),
                  dropdownTextField(
                    context: context,
                    labelText: 'Barangay',
                    fieldController: _barangay,
                    items: [],
                  ),
                  const SizedBox(height: 50),
                  primaryButton(
                    text: 'Submit',
                    onPressed: () async {
                      toPrimaScreen(context);
                    },
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
