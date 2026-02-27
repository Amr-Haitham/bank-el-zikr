import 'package:bank_el_ziker/core/layers/presentation/request_cubit/request_cubit.dart';
import 'package:bank_el_ziker/features/morning_night_azkar/domain/entities/morning_night_zikr.dart';
import 'package:bank_el_ziker/features/settings/domain/entities/settings.dart';
import 'package:bank_el_ziker/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibration/vibration.dart';
import 'package:bank_el_ziker/core/constants/constant_values.dart';

class MorningOrNightZikrContentScreen extends StatefulWidget {
  final List<MorningNightZikrEntity> azkar;
  final bool isMorningZikr;
  final int index;
  const MorningOrNightZikrContentScreen({
    super.key,
    required this.isMorningZikr,
    required this.azkar,
    required this.index,
  });

  @override
  State<MorningOrNightZikrContentScreen> createState() =>
      _MorningOrNightZikrContentScreenState();
}

class _MorningOrNightZikrContentScreenState
    extends State<MorningOrNightZikrContentScreen> {
  late PageController _pageController;
  late int currentZikrIndex;
  late List<int> counters;
  bool isVibrating = true;

  @override
  void initState() {
    super.initState();
    currentZikrIndex = widget.index;
    counters = widget.azkar.map((z) => z.count).toList();
    _pageController = PageController(
      initialPage: widget.index,
      viewportFraction: 0.88,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handleCount() {
    final current = counters[currentZikrIndex];
    if (current > 1) {
      setState(() => counters[currentZikrIndex]--);
    } else {
      setState(() => counters[currentZikrIndex] = 0);
      if (currentZikrIndex < widget.azkar.length - 1) {
        _pageController.previousPage(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOut,
        );
      }
      _triggerVibration();
    }
  }

  void _triggerVibration() {
    if (!isVibrating) return;
    Vibration.hasVibrator().then((has) {
      if (has == true) Vibration.vibrate(duration: 200);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, RequestState<Settings>>(
      builder: (context, state) {
        state.whenOrNull(success: (s) => isVibrating = s.isVibrating);
        return _buildScaffold(context);
      },
    );
  }

  Widget _buildScaffold(BuildContext context) {
    final title = widget.isMorningZikr ? 'أذكار الصباح' : 'أذكار المساء';
    final total = widget.azkar.length;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: primaryColor.withValues(alpha: 0.30),
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: ConstantValues.appHorizontalPadding,
                vertical: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(
                    icon: Icons.info_outline,
                    onTap: () {},
                    color: Colors.white,
                    iconColor: Colors.grey[600]!,
                  ),
                  Column(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'الذكر ${currentZikrIndex + 1} من $total',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  _circleButton(
                    icon: Icons.arrow_forward,
                    onTap: () => Navigator.of(context).pop(),
                    color: Colors.white,
                    iconColor: Colors.grey[700]!,
                  ),
                ],
              ),
            ),

            // ── Scrollable card stack ────────────────────────────────
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                reverse: true,
                itemCount: total,
                onPageChanged: (i) => setState(() => currentZikrIndex = i),
                itemBuilder: (context, index) {
                  final zikr = widget.azkar[index];
                  final isCurrent = index == currentZikrIndex;
                  return AnimatedScale(
                    scale: isCurrent ? 1.0 : 0.94,
                    duration: const Duration(milliseconds: 250),
                    child: _zikrCard(zikr, isCurrent, context),
                  );
                },
              ),
            ),

            // ── Count area ───────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _circleButton(
                    icon: isVibrating
                        ? Icons.vibration
                        : Icons.phone_android_outlined,
                    onTap: () => setState(() => isVibrating = !isVibrating),
                    color: Colors.white,
                    iconColor: primaryColor,
                  ),
                  GestureDetector(
                    onTap: _handleCount,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withValues(alpha: 0.2),
                            blurRadius: 20,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            counters[currentZikrIndex].toString(),
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'اضغط للعد',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _circleButton(
                    icon: Icons.volume_up_outlined,
                    onTap: () {},
                    color: Colors.white,
                    iconColor: primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _zikrCard(
    MorningNightZikrEntity zikr,
    bool isCurrent,
    BuildContext context,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isCurrent ? 0.08 : 0.03),
            blurRadius: isCurrent ? 20 : 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
        child: Column(
          children: [
            // Drag handle
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 28),
            // Content
            Text(
              '"${zikr.content}"',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 22,
                    height: 1.8,
                  ),
            ),
            // Favor
            if (zikr.favor != null && zikr.favor!.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Divider(height: 1, thickness: 1),
              const SizedBox(height: 16),
              Text(
                zikr.favor!,
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey[500],
                      fontStyle: FontStyle.italic,
                      height: 1.6,
                    ),
              ),
            ],
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Widget _circleButton({
    required IconData icon,
    required VoidCallback onTap,
    required Color color,
    required Color iconColor,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }
}
