import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_travel_app/widgets/app_text.dart';
import 'package:master_travel_app/widgets/app_text_large.dart';
import 'package:master_travel_app/widgets/responsive_button.dart';

import '../cubit/app_cubits.dart';
import '../misc/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];

  List frontTexts = [
    "On the other hand, we denounce with righteous indignation and dislike men who are so ",
    "Mountain hikes gives you an incredible sense of freeedom along with indurance test",
    "beguiled and demoralized by the charms of pleasure of the moment",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/" + images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppLargeText(text: "Trips"),
                      AppText(
                        text: "Mountain",
                        size: 30,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 250,
                        child: AppText(
                          text: frontTexts[index],
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).getData();
                        },
                        child: const SizedBox(
                            width: 200,
                            child: Row(
                              children: [
                                ResponsiveButton(width: 120),
                              ],
                            )),
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        width: 8,
                        height: index == indexDots ? 35 : 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == indexDots
                              ? AppColors.mainColor
                              : AppColors.mainColor.withOpacity(0.5),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
