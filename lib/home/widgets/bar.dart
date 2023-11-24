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
          _buildBarContainer(BrandColors.kStrong),
          const SizedBox(
            width: 23,
          ),
          _buildBarContainer(BrandColors.kStrong),
          const SizedBox(
            width: 23,
          ),
          _buildBarContainer(BrandColors.kStrong),
        ],
        // _buildBarContainer(BrandColors.kSecondary);
      ),
    );
  }

  Widget _buildBarContainer(Color color) {
    return Container(
      height: 5,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
