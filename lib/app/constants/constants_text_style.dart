import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyleConstants extends TextStyle {
  const TextStyleConstants.weatherSubTextLight()
      : super(
          fontSize: 20,
          color: Colors.black,
        );
  const TextStyleConstants.weatherSubTextDark()
      : super(
          fontSize: 20,
          color: Colors.white,
        );
  const TextStyleConstants.weatherTextDark()
      : super(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        );
  const TextStyleConstants.weatherTextLight()
      : super(
          fontSize: 40,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        );
}
