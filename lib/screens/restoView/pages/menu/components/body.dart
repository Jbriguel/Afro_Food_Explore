import 'package:auto_size_text/auto_size_text.dart'; 
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../menuView/menuViewScreen.dart';
import 'foodCatCard.dart';

class MenuBodyScreen extends StatefulWidget {
//  ApplicationState appState;
  MenuBodyScreen({
    super.key,
    //required this.appState
  });

  @override
  State<MenuBodyScreen> createState() => _MenuBodyScreenState();
}

class _MenuBodyScreenState extends State<MenuBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return /*(widget.appState.menuData != null)
            ? (widget.appState.menuData!.isNotEmpty)
                ? */Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          //itemCount: widget.appState.menuData!.length,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (() {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MenuViewScreen(
                                      //listCat: widget.appState.menuData!,
                                      //catIndex: index,
                                    ),
                                  ),
                                );
                              }),
                              child: foodCatCard(
                                  //foodCat: widget.appState.menuData![index]
                                  ),
                            );
                          }),
                    ),
                  ) /*
                : const Padding(
                    padding: EdgeInsets.all(10),
                    child:   Text(
                      "vide",
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
           : Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        // return makeItem();
                        return SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: (buildBigCardCategoryLoader(context)),
                        );
                      }),
                ),
              )*/
        ;

    //   }),
  }
}
