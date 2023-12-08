import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onspace_assessment/cubit/location_cubit/location_cubit.dart';
import 'package:onspace_assessment/features/location/views/location_page.dart';
import 'package:onspace_assessment/features/navigation/navigation.dart';
import 'package:onspace_assessment/features/navigation/state_class.dart';
import 'package:onspace_assessment/repository/location_repository.dart';

void main() {
  runApp(const StateManagementClass(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Locator App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) =>
              LocationCubit(FetchUsersRepository()),
          child: const Navigation(),
        ));
  }
}
