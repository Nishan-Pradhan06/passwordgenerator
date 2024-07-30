import 'package:flutter/material.dart';
import '../../core/constants/card_list.dart';
import '../components/appbar.dart';
import '../components/selection_card.dart';
import '../components/password_field.dart';

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
                    centerText: cardList.cards[index].title,
                    labelText: cardList.cards[index].label,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
