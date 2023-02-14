import 'package:calenar_scheduler/components/custom_text_field.dart';
import 'package:calenar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    // FloatingActionButton에서 사용된, showModalBottomSheet는 최대크기가 화면의 1/2이다.
    //
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2 + bottomInset,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Expanded(child: CustomTextField(label: 'Start')),
                SizedBox(
                  width: 8,
                ),
                Expanded(child: CustomTextField(label: 'End')),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Expanded(child: CustomTextField(label: 'Contents')),
            const SizedBox(
              height: 5,
            ),
            // Row는 item이 많아지면, 대응하기 어렵다.--> Wrap
            Wrap(
              spacing: 8,
              runAlignment: WrapAlignment.spaceEvenly,
              children: [
                categoryColor(Colors.red),
                categoryColor(Colors.orange),
                categoryColor(Colors.yellow),
                categoryColor(Colors.green),
                categoryColor(Colors.blue),
                categoryColor(Colors.indigo),
                categoryColor(Colors.purple),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const _SaveButton(),
          ],
        ),
      ),
    );
  }

  Widget categoryColor(Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      width: 32.0,
      height: 32.0,
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(PRIMARY_COLOR),
              ),
              onPressed: () {
                print('save...');
              },
              child: const Text('Save')),
        ),
      ],
    );
  }
}
