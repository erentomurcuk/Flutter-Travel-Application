import 'package:flutter/material.dart';
import 'package:travel_application/misc/colors.dart';
import 'package:travel_application/widgets/app_large_text.dart';
import 'package:travel_application/widgets/app_text.dart';
import 'package:travel_application/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  // We have to define the images here!

  List images = [
    "img/welcome-one.png",
    "img/welcome-two.png",
    "img/welcome-three.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) { // Keeps track of index
            return Container(
              width: double.maxFinite, // Max. width of display
              height: double.maxFinite, // Max. height of display
              decoration: BoxDecoration( // We need decoration to add background image
                image: DecorationImage(
                  image: AssetImage(
                      images[index]
                  ),
                  fit: BoxFit.cover
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
                        const AppText(text: "Mountain", size: 30),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text: "Mountain hikes to give you an incredible sense of freedom along with an endurance test.",
                            colour: AppColors.textColor2,
                            size: 14,
                          )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ResponsiveButton(width: 120,)
                      ],
                    ), // Column for Main Display

                    Column(
                      children: List.generate(3, (indexPageDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index == indexPageDots ? 25 : 8, // Height of the primary dot
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index == indexPageDots ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    )

                  ],
                )
              ),

            );
          }),
    );
  }
}
