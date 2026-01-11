# 📋 Azkar Screen Migration Plan

## Current Status
- ✅ Basic screen structure migrated
- ✅ Main list rendering with new cubits
- ❌ Add custom zikr dialog (TODO)
- ❌ Edit custom zikr dialog (TODO)

## What Needs to Be Done

### 1. Migrate Add Custom Zikr Dialog ✅ PRIORITY
**File:** `lib/features/azkar_management/presentation/screens/sub_screens/adding_new_ziker_popup.dart`

**Current Implementation:**
- Uses `AddCustomZikrCubit` (old)
- Separate cubit for adding

**New Implementation:**
- Use `AzkarCubit.addZikr(Zikr zikr)` method
- No need for separate cubit
- Dialog should:
  1. Take content and description inputs
  2. Call `context.read<AzkarCubit>().addZikr(newZikr)`
  3. Close dialog on success
  4. AzkarCubit automatically reloads list

**Steps:**
1. Update imports to use new `AzkarCubit`
2. Remove `AddCustomZikrCubit` dependency
3. Change submit button to call `AzkarCubit.addZikr()`
4. Test adding custom zikr

---

### 2. Migrate Edit Custom Zikr Dialog ✅ PRIORITY
**File:** `lib/features/azkar_management/presentation/screens/sub_screens/edit_custom_ziker_popup.dart`

**Current Implementation:**
- Uses `UpdateCustomZikrCubit` (old)
- Uses `DeleteCustomZikrCubit` (old)
- Uses `DeleteSingleZikrRecordCubit` (old)
- Uses `UpdateGeneralDataCubit` (old)

**New Implementation:**
- Use `AzkarCubit.updateZikr(Zikr zikr)` for updates
- Use `AzkarCubit.deleteZikr(int id)` for deletion
- Use `CounterCubit.setCurrentZikr(int id)` to change selection
- Use `AzkarRecordsCubit.deleteSingleRecord(int zikrId)` for record deletion

**Steps:**
1. Update imports
2. Replace update logic with `AzkarCubit.updateZikr()`
3. Replace delete logic with `AzkarCubit.deleteZikr()`
4. Handle current zikr change with `CounterCubit.setCurrentZikr()`
5. Test editing and deleting custom zikr

---

### 3. Update Main Screen to Show Dialogs
**File:** `lib/features/azkar_management/presentation/screens/azkar_screen.dart`

**Current Status:**
- ✅ Basic structure done
- ❌ Add button has TODO comment
- ❌ Edit button has TODO comment

**What to Do:**
1. Implement `showModalBottomSheet` for add button (line 30)
2. Implement `showModalBottomSheet` for edit button (line 167)
3. Pass `AzkarCubit` to dialogs via `BlocProvider.value`

---

## Migration Order

### Phase 1: Add Custom Zikr (30 mins)
1. ✅ Check current `adding_new_ziker_popup.dart`
2. ✅ Update to use `AzkarCubit.addZikr()`
3. ✅ Wire up in main screen
4. ✅ Test functionality

### Phase 2: Edit Custom Zikr (45 mins)
1. ✅ Check current `edit_custom_ziker_popup.dart`
2. ✅ Update to use `AzkarCubit.updateZikr()` and `deleteZikr()`
3. ✅ Handle record deletion if needed
4. ✅ Wire up in main screen
5. ✅ Test functionality

### Phase 3: Testing & Cleanup (15 mins)
1. ✅ Test all flows: view, add, edit, delete
2. ✅ Verify state updates correctly
3. ✅ Check error handling
4. ✅ Remove any old imports

---

## Key Differences: Old vs New

### Adding Custom Zikr
**Old:**
```dart
BlocProvider.of<AddCustomZikrCubit>(context).addCustomZikr(content, description);
// Separate listener reloads azkar list
```

**New:**
```dart
context.read<AzkarCubit>().addZikr(Zikr(
  id: 0, // Will be assigned by repository
  content: content,
  description: description,
  isCustomZikr: true,
));
// AzkarCubit automatically reloads list via reExecutePastRequest()
```

### Updating Custom Zikr
**Old:**
```dart
BlocProvider.of<UpdateCustomZikrCubit>(context).updateCustomZikr(id, content, description);
// Separate listener reloads azkar list
```

**New:**
```dart
context.read<AzkarCubit>().updateZikr(updatedZikr);
// AzkarCubit automatically reloads list
```

### Deleting Custom Zikr
**Old:**
```dart
BlocProvider.of<DeleteCustomZikrCubit>(context).deleteCustomZikr(id);
// Separate listener reloads azkar list
```

**New:**
```dart
context.read<AzkarCubit>().deleteZikr(id);
// AzkarCubit automatically reloads list
```

---

## Testing Checklist

### Add Custom Zikr
- [ ] Can open add dialog
- [ ] Can enter content and description
- [ ] Can submit and see new zikr in list
- [ ] Dialog closes after success
- [ ] Error handling works

### Edit Custom Zikr
- [ ] Can open edit dialog for custom zikr
- [ ] Can update content and description
- [ ] Can save changes and see updates
- [ ] Can delete custom zikr
- [ ] Handles deleting currently selected zikr
- [ ] Dialog closes after success

### General
- [ ] List loads correctly
- [ ] Can select different zikr
- [ ] Selection persists
- [ ] No errors in console
- [ ] Smooth transitions

---

## Files to Modify

1. ✅ `azkar_screen.dart` - Main screen (partially done)
2. ⏳ `adding_new_ziker_popup.dart` - Add dialog
3. ⏳ `edit_custom_ziker_popup.dart` - Edit dialog

---

## Next Steps

**Ready to proceed?** 
1. Start with `adding_new_ziker_popup.dart`
2. Then `edit_custom_ziker_popup.dart`
3. Finally wire everything up in `azkar_screen.dart`

**Estimated Total Time:** 90 minutes
