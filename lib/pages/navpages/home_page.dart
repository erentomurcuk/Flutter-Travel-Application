import 'package:flutter/material.dart';
import 'package:travel_application/misc/colors.dart';
import 'package:travel_application/widgets/app_large_text.dart';
import 'package:travel_application/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        // Top Row
        children: [
          Container( // Top Container

            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),

            child: Row(
              children: [

                Icon(Icons.menu, size: 30, color: AppColors.mainColor,),
                Expanded(child: Container()),

                Container(

                  margin: const EdgeInsets.only(right: 10),
                  width: 50,
                  height: 50,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.5),
                  ),

                )
              ],
            ),
          ),

          SizedBox(height: 40,),

          // Discover Text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: const AppLargeText(text: "Discover",),
          ),

          SizedBox(height: 30,),

          // Tab Bar
          Container(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: tabController,

                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,

                isScrollable: true,

                indicatorSize: TabBarIndicatorSize.label,
                indicator: CircleTabIndicator(
                    color: AppColors.mainColor, radius: 4),

                tabs: [
                  Tab(text: "Places"),
                  Tab(text: "Inspire Me"),
                  Tab(text: "Emotional"),
                ],
              ),
            ),
          ),

          Container(

            padding: const EdgeInsets.only(left: 20),
            height: 300,
            width: double.maxFinite,

            child: TabBarView(
                controller: tabController,
                children: [
                  ListView.builder(

                    itemCount: 3,
                    scrollDirection: Axis.horizontal,

                    itemBuilder: (BuildContext context, int index) {
                      return
                        Container(
                          margin: const EdgeInsets.only(right: 15, top: 10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            image: const DecorationImage(
                              image: AssetImage(
                                "img/mountain.jpeg",
                              ),
                              fit: BoxFit.cover,
                            )
                            ,
                          )
                          ,
                        );

                    },

                  ),
                  Text("b"),
                  Text("c"),
                ]
            ),
          ),

          const SizedBox(height: 30,),

          Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLargeText(text: "Explore more",size: 22,),
                AppText(text: "See all", colour: AppColors.textColor1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {

  final Color color;
  final double radius; // MADE FINAL

  const CircleTabIndicator(
      {required this.color, required this.radius}); // MADE CONST

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }

}

class _CirclePainter extends BoxPainter {

  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2 - 5);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }

}