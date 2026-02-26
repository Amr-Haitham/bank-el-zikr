import 'package:auto_route/auto_route.dart';
import 'package:bank_el_ziker/core/router/app_router.dart';
import 'package:bank_el_ziker/features/azkar_management/domain/entities/zikr.dart';
import 'package:flutter/material.dart';

class ZikrCard extends StatelessWidget {
  final ZikrEntity zikr;
  const ZikrCard({super.key, required this.zikr});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(ZikrContentRoute(zikr: zikr));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 18,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 90,
              height: 33,
              child: Text(
                zikr.title ?? zikr.content,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
