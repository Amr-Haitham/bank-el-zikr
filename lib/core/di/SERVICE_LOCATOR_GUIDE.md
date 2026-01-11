# Service Locator Usage Guide

## Overview
The service locator has been configured using `get_it` for dependency injection following Clean Architecture principles.

## Setup

### 1. Initialize in `main.dart`
```dart
import 'package:hive_flutter/hive_flutter.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Hive
  await Hive.initFlutter();
  
  // Register Hive adapters
  Hive.registerAdapter(ZikrModelAdapter());
  
  // Setup all dependencies
  await setupServiceLocator();
  
  runApp(MyApp());
}
```

### 2. Access Dependencies

#### Option 1: Using `getService<T>()` function
```dart
import 'package:bank_el_ziker/core/di/service_locator.dart';

// Get a cubit instance
final cubit = getService<ZikrManagementCubit>();

// Get a repository
final repository = getService<ZikrRepository>();

// Get a use case
final getAllAzkar = getService<GetAllAzkar>();
```

#### Option 2: Using BlocProvider (Recommended for Cubits)
```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';

// In your widget tree
BlocProvider(
  create: (context) => getService<ZikrManagementCubit>(),
  child: YourWidget(),
)

// Or with MultiBlocProvider
MultiBlocProvider(
  providers: [
    BlocProvider(
      create: (context) => getService<ZikrManagementCubit>(),
    ),
    // Add more providers as needed
  ],
  child: YourApp(),
)
```

## Dependency Structure

### External Dependencies
- **Hive Boxes**: `Box<ZikrModel>` (zikrBox, customAzkarBox)

### Data Sources
- **ZikrLocalDataSource**: Handles local data operations with Hive

### Repositories
- **ZikrRepository**: Interface for zikr data operations
- **ZikrRepositoryImpl**: Implementation using local data source

### Use Cases
- **GetAllAzkar**: Retrieve all azkar (default + custom)
- **GetZikrById**: Get a specific zikr by ID
- **AddCustomZikr**: Add a new custom zikr
- **UpdateCustomZikr**: Update an existing custom zikr
- **DeleteCustomZikr**: Delete a custom zikr

### Presentation Layer
- **ZikrManagementCubit**: State management for zikr operations

## Registration Types

### LazySingleton
Used for services that should have a single instance but are created only when first accessed:
- Data sources
- Repositories
- Use cases

### Factory
Used for components that should create a new instance each time:
- Cubits/Blocs (ensures fresh state for each screen)

## Migration from `injection_container.dart`

The old `injection_container.dart` can now be removed or deprecated. All dependencies are now managed in `core/di/service_locator.dart`.

### Key Differences:
1. **Async Setup**: `setupServiceLocator()` is now async and handles Hive initialization
2. **Centralized**: All dependencies in one place with clear organization
3. **Type-safe**: Uses `RequestResult<T>` instead of `Either<Failure, T>`
4. **Modern Failure Handling**: Uses `FailureBase` and `Failure` classes

## Example Usage in a Screen

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bank_el_ziker/core/di/service_locator.dart';
import 'package:bank_el_ziker/features/zikr_management/presentation/bloc/azkar_cubit.dart';

class ZikrListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getService<ZikrManagementCubit>()..loadAllAzkar(),
      child: Scaffold(
        appBar: AppBar(title: Text('Azkar')),
        body: BlocBuilder<ZikrManagementCubit, ZikrManagementState>(
          builder: (context, state) {
            if (state is ZikrManagementLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ZikrManagementLoaded) {
              return ListView.builder(
                itemCount: state.azkar.length,
                itemBuilder: (context, index) {
                  final zikr = state.azkar[index];
                  return ListTile(
                    title: Text(zikr.arabicText),
                    subtitle: Text(zikr.transliteration ?? ''),
                  );
                },
              );
            } else if (state is ZikrManagementError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}
```

## Testing

For testing, you can reset the service locator:

```dart
import 'package:get_it/get_it.dart';

void resetServiceLocator() {
  GetIt.instance.reset();
}

// In your test
setUp(() async {
  resetServiceLocator();
  await setupServiceLocator();
});
```

Or register mock dependencies:

```dart
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockZikrRepository extends Mock implements ZikrRepository {}

void setupMockServiceLocator() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<ZikrRepository>(() => MockZikrRepository());
  // Register other mocks...
}
```
