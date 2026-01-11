import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../3_data/models/zikr.dart';
import 'zikr_content_screen.dart';

@RoutePage()
class ZikrContentRoute extends StatelessWidget {
  const ZikrContentRoute({
    super.key,
    required this.zikr,
  });

  final Zikr zikr;

  @override
  Widget build(BuildContext context) {
    return ZikrContentScreen(zikr: zikr);
  }
}
