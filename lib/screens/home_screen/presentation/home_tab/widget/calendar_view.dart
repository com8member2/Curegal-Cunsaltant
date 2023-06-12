import 'package:consultation_curegal/screens/home_screen/controller/home_tab_controller.dart';
import 'package:consultation_curegal/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CalendarView extends HookConsumerWidget {
  const CalendarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var selectedDate = useState(DateTime.now());
    var allBookings = ref.watch(allBookingsProvider);
    return allBookings.when(
      data: (value) => Column(
        children: [
          TableCalendar(
            headerStyle: const HeaderStyle(formatButtonVisible: false),
            eventLoader: (day) => value.where((element) => element["date"] == day.toSupaFormate()).toList(),
            calendarFormat: CalendarFormat.week,
            selectedDayPredicate: (day) => isSameDay(selectedDate.value, day),
            firstDay: DateTime.now(),
            enabledDayPredicate: (day) => value.any((element) => element["date"] == day.toSupaFormate()),
            lastDay: DateTime.now().add(const Duration(days: 15)),
            focusedDay: selectedDate.value,
            calendarStyle: const CalendarStyle(
                todayTextStyle: TextStyle(color: Color(0xFF5A5A5A)),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                )),
            currentDay: DateTime.now(),
            onDaySelected: (selectedDay, focusedDay) {
              selectedDate.value = selectedDay;
            },
          ),
          ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var item = value.where((element) => element["date"] == selectedDate.value.toSupaFormate()).elementAt(index);
              return CupertinoListTile(title: Text(item["user_profile"]["fullName"]),);
            },
            itemCount: value.where((element) => element["date"] == selectedDate.value.toSupaFormate()).length,
          )
        ],
      ),
      error: (Object error, StackTrace stackTrace) => SizedBox(),
      loading: () => CircularProgressIndicator(),
    );
  }
}
