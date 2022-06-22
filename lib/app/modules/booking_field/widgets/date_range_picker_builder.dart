import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../core/themes/font_themes.dart';
import '../../../core/values/colors.dart';

class DateRangePickerBuilder extends StatelessWidget {
  const DateRangePickerBuilder({
    Key? key,
    required this.maxDate,
    required this.minDate,
    required this.onSelectionChanged,
    required this.calendarHeight,
    required this.initialDate,
  }) : super(key: key);

  final double calendarHeight;
  final DateTime minDate;
  final DateTime maxDate;
  final DateTime initialDate;
  final Function(DateRangePickerSelectionChangedArgs) onSelectionChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: calendarHeight,
      child: SfDateRangePicker(
        selectionColor: blue,
        selectionMode: DateRangePickerSelectionMode.single,
        minDate: minDate,
        maxDate: maxDate,
        onSelectionChanged: onSelectionChanged,
        headerStyle: DateRangePickerHeaderStyle(
          textStyle: mediumText.copyWith(color: blue),
        ),
        selectionShape: DateRangePickerSelectionShape.rectangle,
        showNavigationArrow: true,
        initialSelectedDate: initialDate,
      ),
    );
  }
}
