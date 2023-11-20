import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';

class BarContainer extends StatefulWidget {
  const BarContainer({super.key});

  @override
  State<BarContainer> createState() => _BarContainerState();
}

class _BarContainerState extends State<BarContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
              color: BrandColors.kLow,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
              color: BrandColors.kMedium,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            height: 5,
            width: 100,
            decoration: BoxDecoration(
              color: BrandColors.kStrong,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
