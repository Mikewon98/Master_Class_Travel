import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_travel_app/cubit/app_cubit_states.dart';
import 'package:master_travel_app/cubit/app_cubits.dart';
import 'package:master_travel_app/misc/colors.dart';
import 'package:master_travel_app/widgets/app_text.dart';
import 'package:master_travel_app/widgets/app_text_large.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // menu texts
              Container(
                padding: const EdgeInsets.only(top: 50, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black,
                    ),
                    // Expanded(child: Container()), // we dont really need this
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.5)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              // Discover Text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const AppLargeText(text: 'Discover'),
              ),
              const SizedBox(height: 15),
              // Tab Bar
              Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: const EdgeInsets.only(left: 20, right: 20),
                  controller: tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: const CircleTabIndicator(
                      color: AppColors.mainColor, radius: 4),
                  tabs: const [
                    Tab(text: 'Places'),
                    Tab(text: 'Inspiration'),
                    Tab(text: 'Emotion'),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 290,
                width: double.maxFinite,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.builder(
                      itemCount: info.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context)
                                .detailPage(info[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 10, top: 20),
                            width: 200,
                            height: 290,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },
                    ),
                    const Text('Everyone'),
                    const Text('Its Me'),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore More",
                      size: 22,
                      color: Colors.black,
                    ),
                    AppText(
                      text: "See All",
                      color: AppColors.textColor1,
                    ),
                  ],
                ),
              ),
              Container(
                height: 100,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 30),
                      child: Column(
                        children: [
                          Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "img/${images.keys.elementAt(index)}"),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(height: 2),
                          AppText(
                            text: images.values.elementAt(index),
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              // Explore More
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(color: color, radius: radius);
  }
}

class CirclePainter extends BoxPainter {
  late final Color color;
  late double radius;
  CirclePainter({
    required this.color,
    required this.radius,
  });
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2, configuration.size!.height);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
