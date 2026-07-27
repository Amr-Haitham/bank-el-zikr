import 'package:bank_el_ziker/core/extensions/context.dart';
import 'package:bank_el_ziker/features/adhkar/domain/entities/zikr.dart';
import 'package:bank_el_ziker/features/adhkar/presentation/cubit/add_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Premium-styled popup for adding a custom zikr, opened from the plus
/// button in [ZikrPickerBottomSheet]'s header. Replaces the old always-visible
/// inline search-bar field.
class AddCustomZikrPopup extends StatefulWidget {
  const AddCustomZikrPopup({super.key});

  @override
  State<AddCustomZikrPopup> createState() => _AddCustomZikrPopupState();

  static Future<void> show(BuildContext context) {
    final addCustomZikrCubit = context.read<AddCustomZikrCubit>();
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (dialogContext) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(dialogContext).viewInsets.bottom,
        ),
        child: BlocProvider.value(
          value: addCustomZikrCubit,
          child: const AddCustomZikrPopup(),
        ),
      ),
    );
  }
}

class _AddCustomZikrPopupState extends State<AddCustomZikrPopup> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) {
      context.showErrorNotification(
        message: AppLocalizations.of(context).emptyZikrError,
      );
      return;
    }
    context.read<AddCustomZikrCubit>().addZikr(
          ZikrEntity(
            id: 0,
            content: text,
            isCustomZikr: true,
            title: null,
            category: 'custom',
          ),
        );
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.18),
            blurRadius: 30,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 26,
            decoration: BoxDecoration(
              color: context.colors.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.add_circle_rounded,
                color: context.colors.primary, size: 26),
          ),
          const SizedBox(height: 14),
          Text(
            AppLocalizations.of(context).addCustomZikrTitle,
            style: context.textTheme.titleLarge,
          ),
          const SizedBox(height: 18),
          Container(
            decoration: BoxDecoration(
              color: context.colors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: context.colors.outline),
            ),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              maxLines: 3,
              minLines: 1,
              textAlign: TextAlign.center,
              onSubmitted: (_) => _submit(),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                hintText: AppLocalizations.of(context).addCustomZikrHint,
                hintStyle: context.textTheme.bodyMedium,
              ),
              style: context.textTheme.bodyLarge,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _submit,
              style: FilledButton.styleFrom(
                backgroundColor: context.colors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                AppLocalizations.of(context).addCustomZikrButton,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
