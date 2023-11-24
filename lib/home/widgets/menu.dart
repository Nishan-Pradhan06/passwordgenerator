import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';
// import 'package:randowmpasswordgenerator/core/theme/colors.dart';

class SelectionMenu extends StatefulWidget {
  const SelectionMenu({super.key});

  @override
  State<SelectionMenu> createState() => _SelectionMenuState();
}

class _SelectionMenuState extends State<SelectionMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Wrap(
        spacing: 12.0,
        runSpacing: 10.0,
        children: [
          _buildStatusContainer(),
          _buildStatusContainer(),
          _buildStatusContainer(),
        ],
      ),
    );
  }

  Container _buildStatusContainer() {
    return Container(
      height: 140,
      width: 175,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: BrandColors.kSecondary),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 90, top: 12),
                height: 45,
                width: 65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: BrandColors.kinner),
                child: const Center(
                  child: Text(
                    '123',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'Digits',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Switch(
                    // activeColor: BrandColors.kinner,
                    // trackColor: BrandColors.kinner,
                    activeTrackColor: BrandColors.kinner,
                    value: true,
                    onChanged: (bool value) {},
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
