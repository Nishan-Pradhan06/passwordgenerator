import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:randowmpasswordgenerator/controller/selection_card_provider.dart';
import 'package:randowmpasswordgenerator/view/components/button_components.dart';
import 'package:randowmpasswordgenerator/view/components/dynamic_bar.dart';
import '../../controller/clipboard_provider.dart';
import '../../controller/password_provider.dart';
import '../../controller/shared_preference_provider.dart';
import '../../core/constants/card_list.dart';
import '../components/appbar.dart';
import '../components/selection_card.dart';
import '../components/password_field.dart';
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
            Consumer<SelectionCardProvider>(
              builder: (context, provider, child) {
                final barColors = provider.getBarColors();
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DynamicBarComponents(color: barColors[0]),
                    DynamicBarComponents(color: barColors[1]),
                    DynamicBarComponents(color: barColors[2]),
                  ],
                );
              },
            ),
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
            Consumer3<SelectionCardProvider, OnGeneratePassword,
                ClipboardProvider>(
              builder: (context, cardProvider, passwordProvider,
                  clipboardProvider, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ButtonComponents(
                      icon: Icons.copy,
                      label: 'Copy',
                      onPressed: () {
                        final password = passwordProvider.text ?? '';
                        clipboardProvider.copyToClipboard(context, password);
                      },
                    ),
                    ButtonComponents(
                      icon: Icons.generating_tokens,
                      label: 'Generate',
                      onPressed: () {
                        final newPassword = passwordProvider.generatePassword(
                          hasLetters: cardProvider.isSettingEnabled(0),
                          hasNumbers: cardProvider.isSettingEnabled(1),
                          hasSpecial: cardProvider.isSettingEnabled(2),
                        );
                        passwordProvider.updatePassword(newPassword);
                      },
                      iconSize: 30,
                    ),
                    ButtonComponents(
                      icon: Icons.arrow_back,
                      label: 'Back',
                      onPressed: () {
                        final prefProvider =
                            context.read<PreferencesProvider>();
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
