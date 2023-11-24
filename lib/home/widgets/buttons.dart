import 'package:flutter/material.dart';
import 'package:randowmpasswordgenerator/core/theme/colors.dart';

class BottomContainer extends StatefulWidget {
  const BottomContainer({super.key});

  @override
  State<BottomContainer> createState() => _BottomContainerState();
}

class _BottomContainerState extends State<BottomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 400),
      // alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                // height: 50,
                // width: MediaQuery.of(context).size.width * .8,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: BrandColors.kSecondary),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.copy),
                      color: BrandColors.kBackground,
                    ),
                    // SizedBox(height: 300,),
                  ],
                ),
              ),
              Container(
                // height: 50,
                // width: MediaQuery.of(context).size.width * .8,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: BrandColors.kSecondary),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.copy),
                      color: BrandColors.kBackground,
                    ),
                    // SizedBox(height: 300,),
                  ],
                ),
              ),
              Container(
                // height: 50,
                // width: MediaQuery.of(context).size.width * .8,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: BrandColors.kSecondary),
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.copy),
                      color: BrandColors.kBackground,
                    ),
                    // SizedBox(height: 300,),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
