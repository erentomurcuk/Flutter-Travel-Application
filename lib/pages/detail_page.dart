import 'package:flutter/material.dart';
import 'package:travel_application/misc/colors.dart';
import 'package:travel_application/widgets/app_large_text.dart';
import 'package:travel_application/widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  // variable for ratings, stars:
  int receivedStars = 4;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          // Stack widgets require a width and a height in the parent!
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("img/mountain.jpeg"),
                        fit: BoxFit.cover),
                  ),
                )),
            Positioned(
                left: 20,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                    ) // Clickable
                  ],
                )),
            Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AppLargeText(
                            text: "Erciyes",
                            colour: Colors.black87,
                          ),
                          AppLargeText(
                            text: "₺100",
                            colour: AppColors.mainColor,
                          )
                        ],
                      ),
                      const SizedBox(height: 10,),

                      Row(
                        children: [
                          Icon(Icons.location_on_sharp, color: AppColors.mainColor,),
                          const SizedBox(width: 5,),
                          AppText(text: "Kayseri, Türkiye", colour: AppColors.mainColor,)
                        ],
                      ),

                      const SizedBox(height: 20,),

                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star, color: index<receivedStars ? AppColors.starColor : AppColors.textColor2);
                            }),
                          ),
                          const SizedBox(width: 5,),
                          AppText(text: "(4.0)", colour: AppColors.textColor2,)
                        ],
                      ),

                      const SizedBox(height: 30,),
                      
                      AppLargeText(text: "How many people?", colour: Colors.black.withOpacity(0.8), size: 22,),
                      const SizedBox(height: 5,),
                      AppText(text: "Number of people in the group (Including you)", colour: AppColors.mainTextColor),

                      Wrap(
                        children: List.generate(5, (index) {
                          return // TODO
                        }),
                      )
                      
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
