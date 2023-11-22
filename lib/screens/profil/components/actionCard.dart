 
import 'package:afrofood_explore/theme/colors/appColors.dart';
import 'package:flutter/material.dart'; 

class ActionCard extends StatelessWidget {
  const ActionCard({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.text,
    required this.textColor,
    required this.backColors,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String title, text;
  final IconData icon;
  final VoidCallback? press;
  final Color titleColor, textColor;
  final List<Color> backColors;

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 70,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: backColors),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.blueAccent.shade100.withOpacity(0.2),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: press as void Function()?,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icon,
                          color: titleColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  title,
                                  style: TextStyle(
                                    fontFamily: 'Aller',
                                    color: titleColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                text,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            Text(
                              '...',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
     
    );
  }
}

class ActionCard2 extends StatelessWidget {
  const ActionCard2({
    Key? key,
    required this.title,
    required this.titleColor,
    required this.text,
    required this.textColor,
    required this.backColors,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String title, text;
  final IconData icon;
  final VoidCallback? press;
  final Color titleColor, textColor;
  final List<Color> backColors;

  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 2),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: backColors),
            boxShadow: [
              BoxShadow(
                blurRadius: 1,
                spreadRadius: 1,
                color: Colors.blueAccent.shade100.withOpacity(0.1),
                offset: Offset(0, 1),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: InkWell(
            onTap: press as void Function()?,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          icon,
                          color: AppColors.primaryColor.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  title,
                                  style: const TextStyle(
                                    fontFamily: 'Aller',
                                    color: AppColors.secondColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                text,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: AppColors.secondColor,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                            Text(
                              '.',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: textColor,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    
    );
  }
}
