import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planit/ui/pages/profile/profile_vm.dart';
import 'package:planit/ui/pages/profile/widgets/profile_calendar.dart';
import 'package:planit/ui/pages/profile/widgets/profile_chart.dart';
import 'package:planit/ui/pages/profile/widgets/profile_user.dart';
import 'package:planit/ui/pages/profile/widgets/profile_work.dart';

class ProfileBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var profileVM = ref.read(profileProvider.notifier);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          ProfileUser(),
          SizedBox(height: 16),
          ProfileWork(),
          SizedBox(height: 16),
          ProfileChart(),
          SizedBox(height: 16),
          ProfileCalendar(),
        ],
      ),
    );
  }
}
