import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_application/cubit/app_cubits.dart';
import 'package:travel_application/pages/home_page.dart';
import 'package:travel_application/pages/navpages/main_page.dart';
import 'package:travel_application/pages/welcome_page.dart';

import '../pages/detail_page.dart';
import 'app_cubit_states.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is WelcomeState) {
            return const WelcomePage();
          }

          if (state is DetailState) {
            return const DetailPage();
          }

          if (state is LoadedState) {
            return const MainPage();
          }

          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator(),);
          }

          else {
            return Container();
          }
        },
      ),
    );
  }
}
