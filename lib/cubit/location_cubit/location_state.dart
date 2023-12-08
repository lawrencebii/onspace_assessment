import 'package:onspace_assessment/models/recent_model.dart';

import '../../models/user_model.dart';

abstract class LocationState {
  const LocationState();
}

class LocationInitial extends LocationState {
  const LocationInitial();
}

class LoadingState extends LocationState {
  const LoadingState();
}

class UsersLoadedState extends LocationState {
  final List<User> users;
  const UsersLoadedState(this.users);
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UsersLoadedState && o.users == users;
  }

  @override
  int get hashCode => users.hashCode;
}

class RecentsLoadedState extends LocationState {
  final List<RecentModel> recents;
  const RecentsLoadedState(this.recents);
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RecentsLoadedState && o.recents == recents;
  }

  @override
  int get hashCode => recents.hashCode;
}

class ErrorState extends LocationState {
  final String message;
  const ErrorState(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ErrorState && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
