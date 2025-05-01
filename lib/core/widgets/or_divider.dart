import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1, color: Color(0xffDDDADA),),),
        Text(' Or ', style: AppStyles.regular16.copyWith(fontSize: 12),),
        const Expanded(child: Divider(thickness: 1, color: Color(0xffDDDADA),),)
      ],
    );
  }
}
