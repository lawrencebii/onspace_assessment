import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onspace_assessment/cubit/location_cubit/location_cubit.dart';
import 'package:onspace_assessment/features/location/components/textStyle.dart';
import 'package:onspace_assessment/features/navigation/navigation_provider.dart';
import 'package:onspace_assessment/models/recent_model.dart';
import 'package:onspace_assessment/repository/location_repository.dart';
import 'package:onspace_assessment/utils/format_date.dart';
import 'package:provider/provider.dart';

import '../../../cubit/location_cubit/location_state.dart';
import '../../../models/user_model.dart';
import '../../../utils/colors.dart';

class LocationDetail extends StatefulWidget {
  final User user;

  const LocationDetail({super.key, required this.user});

  @override
  State<LocationDetail> createState() => _LocationDetailState();
}

class _LocationDetailState extends State<LocationDetail> {
  @override
  void initState() {
    // TODO: implement initState
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   context.read<LocationCubit>().getRecents();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return BlocProvider(
      create: (context) => LocationCubit(FetchUsersRepository()),
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                              context.read<LocationCubit>().getUsers();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: const Center(
                                  child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              )),
                            ),
                          ),
                          Text(
                            widget.user.name,
                            style: commonStyle.copyWith(
                                fontSize: 20, fontWeight: FontWeight.w800),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.near_me_outlined,
                              color: Colors.white,
                            )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 75, // Adjust the radius as needed
                      backgroundImage: NetworkImage(
                        widget.user.avatar,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.info_outline,
                              color: Colors.black,
                            )),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            decoration: BoxDecoration(
                              color: primaryGreen,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'id ${widget.user.userId}',
                              style: commonStyle.copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.black,
                            )),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Now is',
                                style: commonStyle.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w800),
                              ),
                              const Icon(Icons.location_pin)
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.user.street,
                                style: commonStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "Since ${formatTimeToAMPM(widget.user.updated)}",
                                style: commonStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "School",
                                style: commonStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "${differenceInMinutes(widget.user.updated, widget.user.createdAt).toString().characters.last} min updated",
                                style: commonStyle.copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Last Updates',
                                style: commonStyle.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w800),
                              ),
                              const Icon(Icons.location_pin)
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Center(
                            child: Consumer<NavigationProvider>(
                              builder: (context, provider, child) {
                                return Text(
                                  '${provider.currentTime}',
                                  style: commonStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w800),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),

                          // ...List.generate(
                          //     12, (index) => timeTile("84 Kamarajar St", index))
                          Container(
                            constraints:
                                BoxConstraints(maxHeight: (size.height * 0.5)),
                            child: BlocConsumer<LocationCubit, LocationState>(
                              listener: (context, state) {
                                if (state is ErrorState) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(state.message),
                                    // duration: const Duration(seconds: 50),
                                  ));
                                }
                              },
                              builder: (context, state) {
                                if (state is LocationInitial) {
                                  BlocProvider.of<LocationCubit>(context,
                                          listen: false)
                                      .getRecents();
                                  return const SizedBox(
                                    child: CircularProgressIndicator(),
                                  );
                                }

                                if (state is RecentsLoadedState) {
                                  final List<RecentModel> recents =
                                      state.recents;
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: recents.length,
                                      itemBuilder: (context, index) {
                                        RecentModel recent = recents[index];
                                        return GestureDetector(
                                            onTap: () {},
                                            child: timeTile(
                                                recent.location,
                                                formatTimeToAMPM(
                                                    recent.recent)));
                                      });
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget timeTile(str, time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          str,
          style: commonStyle.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          " $time",
          style: commonStyle.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
