import 'package:bloc/bloc.dart';
import 'package:onspace_assessment/cubit/location_cubit/location_state.dart';
import 'package:onspace_assessment/repository/location_repository.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository _locationRepository;
  LocationCubit(this._locationRepository)
      : super(const LocationInitial());
  Future<void> getUsers() async {
    try {
      emit(const LoadingState());
      final users = await _locationRepository.fetchUser();
      emit(UsersLoadedState(users));
    } on NetworkException {
      emit(const ErrorState(
          "Could not fetch data check your internet connection"));
    }
  }

  Future<void> getRecents() async {
    try {
      emit(const LoadingState());
      final recents =
          await _locationRepository.fetchRecents();
      emit(RecentsLoadedState(recents));
    } on NetworkException {
      emit(const ErrorState(
          "Could not fetch recent locations check your internet connection"));
    }
  }
}
