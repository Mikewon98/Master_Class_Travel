import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_travel_app/cubit/app_cubit_states.dart';
import 'package:master_travel_app/cubit/app_cubits.dart';
import 'package:master_travel_app/misc/colors.dart';
import 'package:master_travel_app/widgets/app_buttons.dart';
import 'package:master_travel_app/widgets/app_text.dart';
import 'package:master_travel_app/widgets/app_text_large.dart';
import 'package:master_travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;
  int gottenStars = 3;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "http://mark.bslmeiyu.com/uploads/${detail.places.img}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 70,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 230,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.places.name,
                              color: Colors.black.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: "\$${detail.places.price}",
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            const Icon(Icons.location_on),
                            AppText(
                              text: detail.places.location,
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) {
                                  return Icon(Icons.star,
                                      color: index < detail.places.stars
                                          ? AppColors.starColor
                                          : AppColors.textColor1);
                                },
                              ),
                            ),
                            const AppText(text: "(5.0)")
                          ],
                        ),
                        const SizedBox(height: 20),
                        const AppLargeText(
                          text: "People",
                          size: 20,
                        ),
                        const SizedBox(height: 10),
                        const AppText(
                          text: "Number of people in your group",
                          color: AppColors.mainColor,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(
                            5,
                            (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: AppButtons(
                                    size: 50,
                                    color: selectedIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    backgroundColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    borderColor: selectedIndex == index
                                        ? Colors.black
                                        : AppColors.buttonBackground,
                                    text: (index + 1).toString(),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        AppText(
                          text: detail.places.description,
                          color: AppColors.mainTextColor,
                        )
                      ],
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                        color: AppColors.textColor2,
                        backgroundColor: Colors.white,
                        size: 60,
                        isIcon: true,
                        icon: Icons.favorite_border,
                        borderColor: AppColors.textColor1,
                      ),
                      SizedBox(width: 20),
                      ResponsiveButton(
                        isResponsive: true,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
