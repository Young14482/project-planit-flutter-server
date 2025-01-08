import 'package:flutter/material.dart';
import 'package:planit/ui/pages/profile/widgets/profile_body_calendar.dart';
import 'package:planit/ui/pages/profile/widgets/profile_body_chart.dart';
import 'package:planit/ui/pages/profile/widgets/profile_body_user.dart';

import 'profile_body_work.dart';

class ProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          UserSection(),
          SizedBox(height: 16),
          WorkSection(),
          SizedBox(height: 16),
          ChartSection(),
          SizedBox(height: 16),
          CalendarSection(),
        ],
      ),
    );
  }
}
