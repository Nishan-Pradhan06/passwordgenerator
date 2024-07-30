import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/controller/shared_preference_provider.dart';
import 'package:randowmpasswordgenerator/view/components/button_components.dart';
import '../../core/constants/card_list.dart';
import '../components/appbar.dart';
import '../components/selection_card.dart';
import '../components/password_field.dart';
import 'package:provider/provider.dart';

import 'onboarding_screen.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    final cardList = CardList(); // Instantiate your CardList

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const PasswordField(),
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8,
                ),
                itemCount: cardList.cards.length,
                itemBuilder: (context, index) {
                  return SelectionCard(
                    index: index,
                    centerText: cardList.cards[index].title,
                    labelText: cardList.cards[index].label,
                  );
                },
              ),
            ),
            Consumer<PreferencesProvider>(
              builder: (context, prefProvider, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonComponents(
                      icon: Icons.copy,
                      label: 'Copy',
                      onPressed: () {},
                    ),
                    ButtonComponents(
                      icon: Icons.generating_tokens,
                      label: 'Generate',
                      onPressed: () {},
                      iconSize: 30,
                    ),
                    ButtonComponents(
                      icon: Icons.arrow_back,
                      label: 'Back',
                      onPressed: () {
                        prefProvider.setShowHome(false);
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const OnBoarding(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
