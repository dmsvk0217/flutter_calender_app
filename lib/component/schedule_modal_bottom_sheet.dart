import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calender/component/custom_text_field.dart';

import '../const/color.dart';

class ModalBottomSheet extends StatelessWidget {
  const ModalBottomSheet({super.key});

  get primary_color => null;

  @override
  Widget build(BuildContext context) {
    final double bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      onTap: () {
        return FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SafeArea(
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.only(bottom: bottomInset),
          height: MediaQuery.of(context).size.height / 2 + bottomInset,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Time(),
                SizedBox(height: 16),
                _Content(),
                SizedBox(height: 16),
                _ColorPicker(),
                SizedBox(height: 8),
                _SaveButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SaveButton extends StatelessWidget {
  const _SaveButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: primary_color,
            ),
            child: Text(
              "저장",
            ),
          ),
        ),
      ],
    );
  }
}

class _ColorPicker extends StatelessWidget {
  const _ColorPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 8,
        runSpacing: 10,
        children: [
          renderColor(Colors.red),
          renderColor(Colors.orange),
          renderColor(Colors.yellow),
          renderColor(Colors.green),
          renderColor(Colors.blue),
          renderColor(Colors.indigo),
          renderColor(Colors.purple),
        ],
      ),
    );
  }

  Widget renderColor(Color color) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      width: 32,
      height: 32,
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
        label: '내용',
        isTime: false,
      ),
    );
  }
}

class _Time extends StatelessWidget {
  const _Time({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            label: "시작시간",
            isTime: true,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: CustomTextField(
            label: '마감시간',
            isTime: true,
          ),
        ),
      ],
    );
  }
}
