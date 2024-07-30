import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controller/selection_card_provider.dart';
import '../../core/colors/colors.dart';

class SelectionCard extends StatelessWidget {
  final int index;
  final String centerText;
  final String labelText;

  const SelectionCard({
    Key? key,
    required this.index,
    required this.centerText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SelectionCardProvider>(context);
    final isSettingEnabled = provider.isSettingEnabled(index);
    return Container(
      decoration: BoxDecoration(
        border: isSettingEnabled
            ? Border.all(color: Colors.transparent)
            : Border.all(color: BrandColors.kdisbleColor),
        borderRadius: BorderRadius.circular(20),
        color: isSettingEnabled ? BrandColors.kSecondary : Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 95, top: 12),
                height: 45,
                width: 66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: isSettingEnabled
                      ? BrandColors.kinner
                      : BrandColors.kdisbleColor,
                ),
                child: Center(
                  child: Text(
                    centerText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4),
                    child: Text(
                      labelText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: isSettingEnabled
                            ? Colors.white
                            : BrandColors.kdisbleColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Transform.scale(
                    scale: 0.89,
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      child: Switch(
                        key: ValueKey<bool>(isSettingEnabled),
                        inactiveThumbColor: Colors.white,
                        trackOutlineColor: const WidgetStatePropertyAll(
                          Color(0x00ffffff),
                        ),
                        inactiveTrackColor: BrandColors.kbtndisbleColor,
                        activeTrackColor: BrandColors.kinner,
                        value: isSettingEnabled,
                        onChanged: (bool value) {
                          provider.toggleSetting(index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
