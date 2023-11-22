import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../theme/colors/appColors.dart'; 

class FeedbackTile extends StatelessWidget {
  final String titre;
  final String data;
  final int nLigne;
  final bool isPair;
  FeedbackTile({
    required this.titre,
    required this.data,
    required this.nLigne,
    required this.isPair,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      color: isPair ? Colors.grey.shade100 : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AutoSizeText(
              "$titre ",
              presetFontSizes: [11],
              maxLines: 1,
              textAlign: TextAlign.left,
              style: const TextStyle(
                  color: AppColors.secondColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Aller'),
            ),
          ),
          Expanded(
            child: AutoSizeText(
              "$data ",
              presetFontSizes: [12, 11, 10, 9],
              maxLines: nLigne,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Aller',
              ),
            ),
          )
        ],
      ),
    );
  }
}
