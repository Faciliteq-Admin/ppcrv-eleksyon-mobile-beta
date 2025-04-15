import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ppcrv_data_viewing/colors.dart';

Widget primaryImageAsset({
  required BuildContext context,
  required String imageAsset,
}) {
  return Align(
    alignment: Alignment.center,
    child: Image.asset(
      imageAsset,
      width: MediaQuery.of(context).size.shortestSide < 600 ? 200 : 300,
      height: MediaQuery.of(context).size.shortestSide < 600 ? 200 : 300,
      fit: BoxFit.cover,
    ),
  );
}

Widget inputTextField({
  required TextEditingController fieldController,
  required String labelText,
  String suffixIconAsset = 'assets/icons/ic_password_show.svg',
  bool isVisible = false,
  bool isObscureText = false,
  void Function()? onPressed,
}) {
  return SizedBox(
    child: TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: const TextStyle(fontSize: 16),
      controller: fieldController,
      obscureText: isObscureText,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: whiteColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        suffixIcon: Visibility(
          visible: isVisible,
          child: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: SvgPicture.asset(
              suffixIconAsset,
              height: 14,
              width: 14,
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(whiteColor, BlendMode.srcIn),
            ),
            onPressed: onPressed,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: whiteColor.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: whiteColor.withValues(alpha: 0.3)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: whiteColor.withValues(alpha: 0.3),
      ),
    ),
  );
}

Widget primaryButton({
  required String text,
  double width = double.infinity,
  Color buttonColor = blueColor,
  Color textColor = whiteColor,
  bool isVisible = false,
  void Function()? onPressed,
}) {
  return SizedBox(
    child: Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(overlayColor: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Visibility(visible: isVisible, child: const SizedBox(width: 10)),
            Visibility(
              visible: isVisible,
              child: Icon(
                Icons.check_circle_outline_rounded,
                color: lightGreenColor,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget textLabel({
  required String text,
  required Color color,
  var lines = 3,
  double size = 12,
  TextOverflow overflow = TextOverflow.ellipsis,
  FontWeight weight = FontWeight.normal,
  TextAlign align = TextAlign.start,
}) {
  return SizedBox(
    child: Text(
      text,
      overflow: overflow,
      maxLines: lines,
      textAlign: align,
      style: TextStyle(color: color, fontSize: size, fontWeight: weight),
    ),
  );
}

Widget dropdownTextField({
  required BuildContext context,
  required String labelText,
  required TextEditingController fieldController,
  required List<String> items,
  Color color = whiteColor,
  ValueChanged<String?>? onChanged,
}) {
  return FormField(
    builder: (state) {
      return InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: whiteColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: whiteColor.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: whiteColor.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: whiteColor.withValues(alpha: 0.3),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value:
                fieldController.text.trim().isEmpty
                    ? null
                    : fieldController.text.trim(),
            isDense: true,
            isExpanded: true,
            style: const TextStyle(color: Colors.black),
            onChanged: onChanged,
            items:
                items.map((String value) {
                  return DropdownMenuItem(value: value, child: Text(value));
                }).toList(),
          ),
        ),
      );
    },
  );
}
