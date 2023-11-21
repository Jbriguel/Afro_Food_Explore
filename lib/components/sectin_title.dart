import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

//Pour les sections
class SectionTitle extends StatelessWidget {
  // titre pour la section
  String titre;

  // showVoirToutes pour afficher le texte 'Voir toutes'
  // ça peut être true ou false
  // en fonction de vos besoins
  bool showVoirToutes;

  // Si showVoirToutes est à true
  // quelle action on veut ajouter derrière que on clique dessus
  // ça peut être null si on veut rien mettre comme action
  // ou null si showVoirToutes est à false
  final Function? press;

  SectionTitle(
      {super.key,
      required this.titre,
      required this.showVoirToutes,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titre,
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 13,
                color: AppColors.secondColor.withOpacity(0.9),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          showVoirToutes
              ? InkWell(
                  onTap: press as void Function()?,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Voir Toutes ",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Icon(
                          LineAwesomeIcons.arrow_right,
                          color: Colors.grey.shade800,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )
              : const SizedBox(
                  width: 0,
                )
        ],
      ),
    );
  }
}
