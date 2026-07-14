import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'adhkar_list_screen.dart';

@RoutePage()
class AzkarPage extends StatelessWidget {
  const AzkarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdhkarListScreen();
  }
}
