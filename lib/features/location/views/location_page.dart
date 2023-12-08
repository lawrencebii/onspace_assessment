import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onspace_assessment/cubit/location_cubit/location_cubit.dart';
import 'package:onspace_assessment/features/location/components/map_actions.dart';
import 'package:onspace_assessment/features/location/components/textStyle.dart';
import 'package:onspace_assessment/features/location/components/top_actions.dart';
import 'package:onspace_assessment/utils/colors.dart';
import 'package:onspace_assessment/utils/map_style.dart';

import '../../../cubit/location_cubit/location_state.dart';
import '../components/add_item-section.dart';
import '../components/data_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // mapController.setMapStyle(styleMap);
    // setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<LocationCubit>().getUsers();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return SafeArea(
        child: Scaffold(
      // backgroundColor: Colors.red,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  BlocBuilder<LocationCubit, LocationState>(
                    builder: (context, state) {
                      if (state is UsersLoadedState) {
                        var markers = state.users
                            .map((e) => Marker(
                                markerId: MarkerId(e.name),
                                icon: BitmapDescriptor.defaultMarkerWithHue(
                                    BitmapDescriptor.hueMagenta),
                                position: LatLng(
                                    double.parse(e.lat), double.parse(e.long))))
                            .toList();
                        mapController.animateCamera(
                          CameraUpdate.newLatLng(markers.first.position),
                        );
                        return SizedBox(
                          height: size.height,
                          width: size.width,
                          child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            markers: {...markers},
                            initialCameraPosition: CameraPosition(
                              target: markers.first.position,
                              zoom: 11.0,
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        height: size.height,
                        width: size.width,
                        child: GoogleMap(
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: CameraPosition(
                            target: _center,
                            zoom: 11.0,
                          ),
                        ),
                      );
                    },
                  ),
                  const Positioned(
                      top: 10, right: 0, left: 0, child: TopActions()),
                  Positioned(
                      top: size.height * 0.28,
                      left: 0,
                      child: const MapActions()),
                  Positioned(
                      top: size.height * 0.49,
                      left: 0,
                      child: const AddItemTagSection()),
                  const Positioned(
                    bottom: 150,
                    left: 10,
                    right: 10,
                    child: DataContainer(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
