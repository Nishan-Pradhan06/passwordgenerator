import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';

class SelectionMenu extends StatefulWidget {
  const SelectionMenu({Key? key}) : super(key: key);

  @override
  State<SelectionMenu> createState() => _SelectionMenuState();
}

class _SelectionMenuState extends State<SelectionMenu> {
  // int selectedContainerIndex = 0;
  Map<String, bool> selectedContainerIndex = {
    '123': true,
    'ABC': false,
    '@#!': false
  };
  // bool _isSettingEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 12.0,
        runSpacing: 10.0,
        children: [
          _buildStatusContainer('Digits', '123'),
          _buildStatusContainer('Characters', 'ABC'),
          _buildStatusContainer('Symbols', '@#!'),
        ],
      ),
    );
  }

  Container _buildStatusContainer(String labelText, String centerText) {
    // ignore: no_leading_underscores_for_local_identifiers
    bool _isSettingEnabled = selectedContainerIndex[centerText]!;
    return Container(
      height: 140,
      width: 170,
      decoration: BoxDecoration(
        border: _isSettingEnabled
            ? Border.all(color: Colors.transparent)
            : Border.all(color: BrandColors.kdisbleColor),
        borderRadius: BorderRadius.circular(20),
        color: _isSettingEnabled ? BrandColors.kSecondary : Colors.white,
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 75, top: 12),
                height: 45,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: _isSettingEnabled
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
              const SizedBox(
                height: 30,
              ),
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
                        color: _isSettingEnabled
                            ? Colors.white
                            : BrandColors.kdisbleColor,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
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
                        inactiveThumbColor: Colors.white,
                        trackOutlineColor: const MaterialStatePropertyAll(
                          Color(0x00ffffff),
                        ),
                        inactiveTrackColor: BrandColors.kbtndisbleColor,
                        activeTrackColor: BrandColors.kinner,
                        value: _isSettingEnabled,
                        onChanged: (bool value) {
                          setState(() {
                            // _isSettingEnabled = value;
                            selectedContainerIndex[centerText] = value;
                          });
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
