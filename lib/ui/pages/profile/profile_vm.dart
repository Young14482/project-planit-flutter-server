import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/data/repository/profile_repository.dart';

class ProfileModel {
}


final profileProvider = NotifierProvider<ProfileVM, int>(() {
  return ProfileVM();
});

class ProfileVM extends Notifier<int> {
  ProfileRepository profileRepository = const ProfileRepository();

  @override
  int build() {
    return 0;
  }

  public
}
