import 'package:flutter/material.dart';

import '../constant.dart';

class RowCard extends StatelessWidget {
  const RowCard({super.key,this.text,this.value});
  final String ?text;
  final String ?value;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
      Padding(padding: EdgeInsets.all( kdefaultPadding/2),
      child:   Row(
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text!),
            Spacer(),
            Text(value!),
          ],
        ),),
        Divider()
      ],
    );
  }
}