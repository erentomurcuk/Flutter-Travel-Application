import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_application/cubit/app_cubit_states.dart';
import 'package:travel_application/cubit/app_cubits.dart';
import 'package:travel_application/misc/colors.dart';
import 'package:travel_application/widgets/app_buttons.dart';
import 'package:travel_application/widgets/app_large_text.dart';
import 'package:travel_application/widgets/app_text.dart';
import 'package:travel_application/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // variable for ratings, stars:
  int receivedStars = 4;

  // variable for selected Person count index:
  int selectedPersonCountIndex = 1;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppCubits, CubitStates> (builder: (context, state) {

      DetailState detail = state as DetailState; //This is "place" from app_cubit_states

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
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage("http://mark.bslmeiyu.com/uploads/${detail.place.image}"),
                          fit: BoxFit.cover),
                    ),
                  )),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
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
                            AppLargeText(
                              text: detail.place.name,
                              colour: Colors.black87,
                            ),
                            AppLargeText(
                              text: "US\$${detail.place.price.toString()}",
                              colour: AppColors.mainColor,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              color: AppColors.mainColor,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: detail.place.location,
                              colour: AppColors.mainColor,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star,
                                    color: index < detail.place.stars
                                        ? AppColors.starColor
                                        : AppColors.textColor2);
                              }),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(
                              text: "(${detail.place.stars.toString()}.0)",
                              colour: AppColors.textColor2,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        AppLargeText(
                          text: "How many people?",
                          colour: Colors.black.withOpacity(0.8),
                          size: 22,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AppText(
                            text: "Number of people in the group (Including you)",
                            colour: AppColors.mainTextColor),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedPersonCountIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  size: 50,
                                  color: selectedPersonCountIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor:
                                  selectedPersonCountIndex == index
                                      ? Colors.black87
                                      : AppColors.buttonBackground,
                                  borderColor: selectedPersonCountIndex == index
                                      ? Colors.black87
                                      : AppColors.buttonBackground,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                          text: "Description",
                          colour: Colors.black.withOpacity(0.8),
                          size: 22,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AppText(
                            text: detail.place.description,
                            colour: AppColors.mainTextColor),
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    children: [
                      AppButtons(
                          size: 60,
                          color: AppColors.textColor2,
                          backgroundColor: Colors.white,
                          borderColor: AppColors.textColor1,
                          isIcon: true,
                          icon: Icons.favorite_border
                      ),
                      const SizedBox(width: 20,),

                      ResponsiveButton(
                        isResponsive: true,
                      )
                    ],
                  ))
            ],
          ),
        ),
      );
    });


  }
}
