import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.secondColor, width: 2)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: FadeInImage(
            image: const AssetImage("assets/images/userProfil.png"),
            placeholder: const AssetImage("assets/images/userProfil.png"),
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset('assets/images/userProfil.png',
                  height: 30, width: 30, fit: BoxFit.contain);
            },
            fit: BoxFit.fitWidth,
          )),
    );
  }
}
