import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onspace_assessment/cubit/location_cubit/location_cubit.dart';
import 'package:onspace_assessment/cubit/location_cubit/location_state.dart';
import 'package:onspace_assessment/features/location/components/textStyle.dart';
import 'package:onspace_assessment/features/location/views/location_detail.dart';
import 'package:onspace_assessment/features/navigation/navigation_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/user_model.dart';
import '../../../utils/colors.dart';

class DataContainer extends StatelessWidget {
  const DataContainer({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.25,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        // scrollDirection: Axis.vertical,
        child: Column(
          children: [
            buildOptionChipsSection(context),
            const SizedBox(
              height: 10,
            ),
            Container(
              constraints: BoxConstraints(maxHeight: (size.height * 0.25 - 64)),
              child: BlocConsumer<LocationCubit, LocationState>(
                listener: (context, state) {
                  if (state is ErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      behavior: SnackBarBehavior.floating,
                      content: Text(state.message),
                      // duration: const Duration(seconds: 50),
                    ));
                  }
                },
                builder: (context, state) {
                  if (state is LocationInitial) {
                    return const SizedBox(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (state is UsersLoadedState) {
                    final List<User> users = state.users;
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                // context.read<LocationCubit>().getRecents();

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        LocationDetail(user: users[index])));
                              },
                              child: buildUserTile(users[index]));
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildUserTile(User user) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          var random = Random();
          int randomNumber = random.nextInt(10) + 1;
          bool isALl =
              randomNumber.isEven && provider.selectedOption == option.ALL;
          bool isItems = provider.selectedOption == option.ITEMS;
          if (isItems) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.network(
                      user.picture,
                      errorBuilder: (context, obj, trace) {
                        return const Icon(Icons.broken_image_outlined);
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        user.hotel,
                        style: commonStyle.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        user.street,
                        style: commonStyle.copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "$randomNumber min Updated",
                  style: commonStyle.copyWith(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green)),
                  child: const Center(
                      child: Icon(
                    Icons.near_me,
                    color: Colors.white,
                    size: 20,
                  )),
                ),
              ],
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.network(
                    isALl ? user.picture : user.avatar,
                    errorBuilder: (context, obj, trace) {
                      return const Icon(Icons.broken_image_outlined);
                    },
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isALl ? user.hotel : user.name,
                      style: commonStyle.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      user.street,
                      style: commonStyle.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "$randomNumber min Updated",
                style: commonStyle.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green)),
                child: const Center(
                    child: Icon(
                  Icons.near_me,
                  color: Colors.white,
                  size: 20,
                )),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildOptionChipsSection(context) {
    return Consumer<NavigationProvider>(
      builder: (context, provider, child) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                context.read<NavigationProvider>().selectOption(option.ALL);
                context.read<LocationCubit>().getUsers();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "All",
                  style: commonStyle.copyWith(
                    fontWeight: provider.selectedOption == option.ALL
                        ? FontWeight.w600
                        : FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                context.read<NavigationProvider>().selectOption(option.PPLE);
                context.read<LocationCubit>().getUsers();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "People",
                  style: commonStyle.copyWith(
                    fontWeight: provider.selectedOption == option.PPLE
                        ? FontWeight.w600
                        : FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            GestureDetector(
              onTap: () {
                context.read<NavigationProvider>().selectOption(option.ITEMS);
                context.read<LocationCubit>().getUsers();
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Items",
                  style: commonStyle.copyWith(
                    fontWeight: provider.selectedOption == option.ITEMS
                        ? FontWeight.w600
                        : FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: primaryGreen,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.green)),
              child: const Center(
                  child: Icon(
                Icons.more_horiz,
                color: Colors.black,
                size: 20,
              )),
            ),
          ],
        );
      },
    );
  }
}
