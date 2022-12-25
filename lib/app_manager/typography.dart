import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color lightViolet = const Color(0xFFDED4FF);
Color randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
Color backgroundGrayColor = const Color(0xFFF4F5FC);
Color purpleAccent = const Color(0xFF603BE5);
Color fadedPurpleAccent = const Color(0xffF7F5FE);
Color green = Color(0xff4ECDC4);
Color orange = Color(0xffF5805A);



Widget verticalSpace({required double height}) {
  return SizedBox(height: height);
}

Widget horizontalSpace({required double width}) {
  return SizedBox(width: width);
}

final white40014 = GoogleFonts.lexendDeca(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);
final white40016 = GoogleFonts.lexendDeca(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white);
final white60022 = GoogleFonts.lexendDeca(fontSize: 22, fontWeight: FontWeight.w600,color: Colors.white);
final white50032 = GoogleFonts.lexendDeca(fontSize: 32, fontWeight: FontWeight.w500,color: Colors.white);
final white50036 = GoogleFonts.lexendDeca(fontSize: 36, fontWeight: FontWeight.w500,color: Colors.white);
final white60016 = GoogleFonts.lexendDeca(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white);

final black60032 = GoogleFonts.lexendDeca(fontSize: 32, fontWeight: FontWeight.w600,color: Colors.black);
final black60024 = GoogleFonts.lexendDeca(fontSize: 24, fontWeight: FontWeight.w600,color: Colors.black);
final black50020 = GoogleFonts.lexendDeca(fontSize: 20, fontWeight: FontWeight.w500,color: Colors.black);
final black50016 = GoogleFonts.lexendDeca(fontSize: 16, fontWeight: FontWeight.w500,color: Colors.black);
final black50024 = GoogleFonts.lexendDeca(fontSize: 24, fontWeight: FontWeight.w500,color: Colors.black);

final black50012  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w500,fontSize: 12,color: Colors.black);
final black50014  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.black);
final black30012  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.black);
final black30016  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w300,fontSize: 16,color: Colors.black);
final black40016  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 16,color: Colors.black);
final black40014 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.black);
final black40018 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.black);
final black40024 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 24,color: Colors.black);
final black40020 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 20,color: Colors.black);
final black30024 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w300,fontSize: 24,color: Colors.black);
final black30020 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w300,fontSize: 20,color: Colors.black);
final black30014  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w300,fontSize: 14,color: Colors.black);

final red40016  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 16,color: const Color(0xffFF6B6B));

final grey40018  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 18,color: Colors.grey);
final grey20016  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w200,fontSize: 16,color: Colors.grey);
final grey40014  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 14,color: Colors.grey);
final grey30012  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w300,fontSize: 12,color: Colors.grey);
final grey40012  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 12,color: Colors.grey);


final purpleAccent40032 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 32,color: const Color(0xFF603BE5));
final purpleAccent70014 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w700,fontSize: 14,color: const Color(0xFF603BE5));
final purpleAccent30016  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w300,fontSize: 16,color: const Color(0xFF603BE5));
final purpleAccent50016  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w500,fontSize: 16,color: const Color(0xFF603BE5));
final purpleAccent40018  = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 18,color: const Color(0xFF603BE5));
final purpleAccent40014 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 14,color: const Color(0xFF603BE5));

final lightPurple40014 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w400,fontSize: 14,color: backgroundGrayColor);

final orange50014 = GoogleFonts.lexendDeca(fontWeight: FontWeight.w500,fontSize: 14,color: orange);