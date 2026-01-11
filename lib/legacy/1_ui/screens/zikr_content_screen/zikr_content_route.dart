import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:bank_el_ziker/core/layers/data/models/zikr_model.dart';
import 'zikr_content_screen.dart';


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
