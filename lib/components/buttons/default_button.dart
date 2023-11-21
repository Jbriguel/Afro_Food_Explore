import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.text,
    required this.textColor,
    required this.backColor,
    this.press,
  }) : super(key: key);
  final String? text;
  final Color textColor;
  final Color backColor;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          disabledForegroundColor: backColor.withOpacity(0.38),
          disabledBackgroundColor: backColor.withOpacity(0.12),
          backgroundColor: backColor,
          shadowColor: Colors.grey.shade500,
          elevation: 1,
          minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          style: GoogleFonts.inter(
            textStyle: Theme.of(context).textTheme.bodyMedium,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: textColor,
            shadows: [
              const Shadow(
                color: Colors.black12,
                offset: Offset(1.0, 1.0),
                blurRadius: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConnextionWithGoogleButton extends StatelessWidget {
  const ConnextionWithGoogleButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          foregroundColor: Colors.white,
          elevation: 1.0,
          //shadowColor: Colors.grey.shade500,
          minimumSize: Size(MediaQuery.of(context).size.width * 0.7, 50),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        ),
        onPressed: () {},
        label: Text(
          text,
          style: GoogleFonts.inter(
            textStyle: Theme.of(context).textTheme.bodyMedium,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
            shadows: [
              const Shadow(
                color: Colors.black12,
                offset: Offset(0.4, 1.0),
                blurRadius: 5,
              ),
            ],
          ),
        ),
        icon: SizedBox.square(
          dimension: 30,
          child: Image.asset(
            "assets/images/google2.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
