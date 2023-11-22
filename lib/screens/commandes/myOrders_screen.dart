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
  final _selectedSegment = ValueNotifier('Recent requests');

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
                          'Recent requests': 'Recent requests',
                          'Old Requests': 'Old Requests',
                        },
                      ),
                    ),
                    ValueListenableBuilder<String>(
                      valueListenable: _selectedSegment,
                      builder: (_, key, __) {
                        if (_selectedSegment.value == "Recent requests") {
                          return Column(
                            children: [
                              OrderCard(
                                etat: "Waiting...",
                              ),
                              OrderCard(
                                etat: "Waiting...",
                              ),
                            ],
                          );
                        } else {
                          return OrderCard(
                            etat: "It's okay!",
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
