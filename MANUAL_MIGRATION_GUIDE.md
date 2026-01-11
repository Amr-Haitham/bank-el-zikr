# 🔧 Manual Migration Guide for Remaining Screens

## Overview
The following 2 screens need manual migration due to their complexity:
1. `azkar_screen.dart` (333 lines)
2. `account_balance_screen.dart` (502 lines)

**Note:** `ziker_screen.dart` (606 lines) is being left for later as requested.

---

## 1. azkar_screen.dart Migration

### Current State
- **Location:** `lib/features/azkar_management/presentation/screens/azkar_screen.dart`
- **Route:** ✅ Already updated to provide `AzkarCubit` + `CounterCubit`
- **Old Cubits Used:**
  - `GetCurrentZikrCubit` → Replace with `CounterCubit`
  - `UpdateGeneralDataCubit` → Replace with `CounterCubit`
  - `AddCustomZikrCubit` → Part of `AzkarCubit`
  - `DeleteCustomZikrCubit` → Part of `AzkarCubit`
  - `UpdateCustomZikrCubit` → Part of `AzkarCubit`
  - `AzkarCubit` (old) → Replace with new `AzkarCubit`

### Migration Steps

#### Step 1: Update Imports
Replace:
```dart
import 'package:bank_el_ziker/2_state_management/azkar_cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/2_state_management/custom_azkar_cubits/add_custom_zikr_cubit/add_custom_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/get_current_zikr/get_current_zikr_cubit.dart';
import 'package:bank_el_ziker/2_state_management/general_data/update_general_data/update_general_data_cubit.dart';
```

With:
```dart
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/core/presentation/request_cubit/request_cubit.dart';
```

#### Step 2: Remove initState
The new cubits load data automatically (`callOnCreate: true`), so remove:
```dart
@override
void initState() {
  BlocProvider.of<GetCurrentZikrCubit>(context).getCurrentZikr();
  BlocProvider.of<AzkarCubit>(context).getAllAzkar();
  super.initState();
}
```

Replace with:
```dart
@override
void initState() {
  // Cubits load data automatically via callOnCreate: true
  super.initState();
}
```

#### Step 3: Update BlocListeners (Lines 44-60)
Replace:
```dart
BlocListener<UpdateGeneralDataCubit, UpdateGeneralDataState>(
  listener: (context, state) {
    if (state is UpdateGeneralDataUpdated) {
      BlocProvider.of<GetCurrentZikrCubit>(context).getCurrentZikr();
    }
  },
),
BlocListener<AddCustomZikrCubit, AddCustomZikrState>(
  listener: (context, state) {
    if (state is AddCustomZikrLoaded) {
      BlocProvider.of<AzkarCubit>(context).getAllAzkar();
    }
  },
),
```

With:
```dart
// New cubits handle state automatically via RequestState
// No manual listeners needed for data refresh
```

#### Step 4: Update Main BlocConsumer (Lines 116-189)
Replace:
```dart
BlocConsumer<GetCurrentZikrCubit, GetCurrentZikrState>(
  listener: (context, state) {
    if (state is GetCurrentZikrLoaded) {
      setState(() {
        selectedZikrId = state.zikrId;
      });
    }
  },
  builder: (context, parentState) {
    if (parentState is GetCurrentZikrLoaded) {
      return BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          if (state is AzkarLoaded) {
            // ... list of azkar
          }
        },
      );
    }
  },
)
```

With:
```dart
BlocBuilder<CounterCubit, RequestState<CounterState>>(
  builder: (context, counterState) {
    return counterState.when(
      initial: () => const SliverToBoxAdapter(child: CircularProgressIndicator()),
      loading: () => const SliverToBoxAdapter(child: CircularProgressIndicator()),
      success: (counter) {
        selectedZikrId = counter.currentZikrId;
        
        return BlocBuilder<AzkarCubit, RequestState<List<Zikr>>>(
          builder: (context, azkarState) {
            return azkarState.when(
              initial: () => const SliverToBoxAdapter(child: CircularProgressIndicator()),
              loading: () => const SliverToBoxAdapter(child: CircularProgressIndicator()),
              success: (azkar) {
                return SliverList.separated(
                  itemCount: azkar.length,
                  itemBuilder: (context, index) {
                    return ListTileOfZikr(
                      index: index,
                      onTap: () {
                        context.read<CounterCubit>().setCurrentZikr(azkar[index].id);
                        Navigator.pop(context);
                      },
                      zikr: azkar[index],
                      isSelected: (selectedZikrId == azkar[index].id),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(height: 64, indent: 44, endIndent: 44),
                );
              },
              failure: (failure) => const SliverToBoxAdapter(child: Center(child: Text("Error"))),
            );
          },
        );
      },
      failure: (failure) => const SliverToBoxAdapter(child: Center(child: Text("Error"))),
    );
  },
)
```

#### Step 5: Update onTap Handler (Line 140-144)
Replace:
```dart
BlocProvider.of<UpdateGeneralDataCubit>(context)
    .updateGeneralDataCurrentZikr(selectedZikrId);
```

With:
```dart
context.read<CounterCubit>().setCurrentZikr(selectedZikrId);
```

#### Step 6: Update Custom Zikr Methods
The new `AzkarCubit` has methods:
- `addCustomZikr(String content, String? description)`
- `updateCustomZikr(int id, String content, String? description)`
- `deleteCustomZikr(int id)`

Update the popup dialogs to use these methods instead of separate cubits.

---

## 2. account_balance_screen.dart Migration

### Current State
- **Location:** `lib/features/azkar_records/presentation/screens/account_balance_screen.dart`
- **Route:** ✅ Already updated to provide `CounterCubit` + `AzkarRecordsCubit` + `AzkarCubit`
- **Old Cubits Used:**
  - `GetGeneralDataCubit` → Replace with `CounterCubit`
  - `GetWeekAzkarRecordCubit` → Replace with `AzkarRecordsCubit`
  - `AzkarCubit` (old) → Replace with new `AzkarCubit`

### Migration Steps

#### Step 1: Update Imports
Replace old imports with:
```dart
import 'package:bank_el_ziker/features/zikr_counter/presentation/cubit/counter_cubit.dart';
import 'package:bank_el_ziker/features/azkar_records/presentation/cubit/azkar_records_cubit.dart';
import 'package:bank_el_ziker/features/azkar_management/presentation/cubit/azkar_cubit.dart';
import 'package:bank_el_ziker/core/presentation/request_cubit/request_cubit.dart';
```

#### Step 2: Update State Management Pattern
Replace old state checks like:
```dart
BlocBuilder<GetGeneralDataCubit, GetGeneralDataState>(
  builder: (context, state) {
    if (state is GetGeneralDataLoaded) {
      // ...
    }
  },
)
```

With:
```dart
BlocBuilder<CounterCubit, RequestState<CounterState>>(
  builder: (context, state) {
    return state.when(
      initial: () => ...,
      loading: () => const CircularProgressIndicator(),
      success: (counter) {
        // Use counter.accountBalance, counter.currentZikrId, etc.
      },
      failure: (failure) => Text('Error: ${failure.message}'),
    );
  },
)
```

#### Step 3: Update Weekly Records
Replace:
```dart
BlocBuilder<GetWeekAzkarRecordCubit, GetWeekAzkarRecordState>(
  builder: (context, state) {
    if (state is GetWeekAzkarRecordLoaded) {
      // ...
    }
  },
)
```

With:
```dart
BlocBuilder<AzkarRecordsCubit, RequestState<WeekAzkarRecord>>(
  builder: (context, state) {
    return state.when(
      initial: () => ...,
      loading: () => const CircularProgressIndicator(),
      success: (weekRecord) {
        // Use weekRecord.days, weekRecord.totalCount, etc.
      },
      failure: (failure) => Text('Error: ${failure.message}'),
    );
  },
)
```

---

## Key Differences: Old vs New

### Old Pattern:
```dart
// Multiple cubits for related functionality
GetGeneralDataCubit - get data
UpdateGeneralDataCubit - update data
GetCurrentZikrCubit - get current zikr

// Multiple state classes
if (state is DataLoaded) { }
if (state is DataError) { }
```

### New Pattern:
```dart
// Single cubit per feature
CounterCubit - handles all counter/general data operations

// Unified RequestState with .when()
state.when(
  initial: () => ...,
  loading: () => ...,
  success: (data) => ...,
  failure: (failure) => ...,
)
```

---

## Testing After Migration

1. **Run analysis:**
   ```bash
   flutter analyze lib/features/azkar_management/presentation/screens/azkar_screen.dart
   flutter analyze lib/features/azkar_records/presentation/screens/account_balance_screen.dart
   ```

2. **Test functionality:**
   - Azkar screen: Select zikr, add custom zikr, edit custom zikr, delete custom zikr
   - Account balance: View balance, view weekly chart, view azkar list

3. **Check for:**
   - No old cubit imports
   - All state handled via `RequestState.when()`
   - No manual `initState` calls (unless needed for local state)

---

## Need Help?

If you encounter issues:
1. Check that the route provides all necessary cubits
2. Verify cubit methods match what you're calling
3. Ensure `RequestState` is imported from `core/presentation/request_cubit/`
4. Use `.when()` for all state handling

**Estimated time:** 30-60 minutes per screen
