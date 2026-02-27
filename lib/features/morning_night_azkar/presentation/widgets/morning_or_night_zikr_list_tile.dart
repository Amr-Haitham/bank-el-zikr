import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:flutter/material.dart';

class MorningOrNightZikrListTile extends StatelessWidget {
  final MorningNightZikrEntity zikr;
  final bool isMorningZiker;
  final Function() onTap;
  final int index;
  final int total;

  const MorningOrNightZikrListTile({
    super.key,
    required this.zikr,
    required this.isMorningZiker,
    required this.onTap,
    required this.index,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    // Dummy progress: fully done for even indices, partial for odd
    final double progress = (index % 2 == 0) ? 1.0 : (index + 1) / total;
    final bool isDone = progress >= 1.0;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Top row: counter badge (left) + title tag (right)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      isDone
                          ? Icons.check_circle_outline
                          : Icons.info_outline,
                      size: 16,
                      color: isDone
                          ? Theme.of(context).primaryColor
                          : Colors.grey[500],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${index + 1}/$total',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isDone
                            ? Theme.of(context).primaryColor
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                if (zikr.title != null && zikr.title!.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEEEF3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      zikr.title!,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            // Zikr content
            Text(
              zikr.content,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    height: 1.6,
                    fontSize: 18,
                  ),
            ),
            // Favor text
            if (zikr.favor != null && zikr.favor!.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                zikr.favor!,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey[500],
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
              ),
            ],
            const SizedBox(height: 12),
            // Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 4,
                backgroundColor: const Color(0xFFEEEEF3),
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
