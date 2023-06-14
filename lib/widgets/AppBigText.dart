import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBigText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color textColor;
  final int maxLine;
  const AppBigText({Key? key, required this.text, required this.size, required this.weight, required this.textColor, required this.maxLine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine,
      style: GoogleFonts.rubik(
        fontWeight: weight,
        fontSize:size,
        color: textColor,
      ),
    );
  }
}
