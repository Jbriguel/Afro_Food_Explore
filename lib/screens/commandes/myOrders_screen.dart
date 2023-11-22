import 'package:afrofood_explore/screens/commandes/components/orderCard.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../components/sectin_title.dart';
import '../../theme/colors/appColors.dart';
import '../../widgets/tabs/flutter_advanced_segment.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with TickerProviderStateMixin {
  final _selectedSegment = ValueNotifier('Demande recente');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SectionTitle(
                        titre: "My Orders", showVoirToutes: false, press: null),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: AdvancedSegment(
                        controller: _selectedSegment,
                        backgroundColor: AppColors.secondColor.withOpacity(0.2),
                        segments: {
                          'Demande recente': 'Demande recente',
                          'Aciennes Demandes': 'Aciennes Demandes',
                        },
                      ),
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: _selectedSegment,
                      builder: (_, key, __) {
                        if (_selectedSegment.value == "Demande recente") {
                          return Column(
                            children: [
                              OrderCard(
                                etat: "En Attente",
                              ),
                              OrderCard(
                                etat: "En Attente",
                              ),
                              OrderCard(
                                etat: "En Attente",
                              ),
                            ],
                          );
                        } else {
                          return OrderCard(
                            etat: "Répondu",
                          );
                        }
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
