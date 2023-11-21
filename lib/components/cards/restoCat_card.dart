import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestaurantCatClip extends StatelessWidget {
  RestaurantCatClip(
      {super.key,
      required this.text,
      required this.icon,
      required this.onPress});

  String text;
  IconData icon;

  final Function? onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress as void Function()?,
      child: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        child: InputChip(
            elevation: 1.0,
            side: BorderSide(
              color: AppColors.secondColor.withOpacity(0.2),
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            avatar: CircleAvatar(
              child: Icon(
                icon,
                color: AppColors.primaryColor,
              ),
              backgroundColor: Colors.white,
            ),
            label: Text(
              text,
              style: GoogleFonts.lato(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.secondColor.withOpacity(0.9),
                ),
              ),
            ),
            selected: false,
            onSelected: (bool value) {}),
      ),
    );
  }
}
