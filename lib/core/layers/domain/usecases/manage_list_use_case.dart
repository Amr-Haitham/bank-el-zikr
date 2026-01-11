/// A generic use case that manages list operations including adding,
/// updating, and reordering items.
///
/// Type parameter [T] represents the type of items being managed in the list.
class ManageListUseCase<T> {
  const ManageListUseCase({
    this.comparisonCallback,
  });

  final Object Function(T)? comparisonCallback;

  /// Adds a new item to the list.
  List<T> addItem(List<T> currentItems, T newItem) {
    return [...currentItems, newItem];
  }

  List<T> deleteItem(List<T> currentItems, T deletedItem) {
    return currentItems
        .where(
          (item) => ((comparisonCallback?.call(item) ?? item) !=
              (comparisonCallback?.call(deletedItem) ?? deletedItem)),
        )
        .toList();
  }

  /// Updates an existing item in the list with a new version.
  ///
  /// Searches for [oldItem] in [currentItems] and replaces it with [newItem].
  /// If the old item is not found, returns the original list unchanged.
  List<T> updateItem({
    required List<T> currentItems,
    required T oldItem,
    required T newItem,
  }) {
    return currentItems.map((item) {
      if ((comparisonCallback?.call(item) ?? item) ==
          (comparisonCallback?.call(oldItem) ?? oldItem)) {
        return newItem;
      }
      return item;
    }).toList();
  }

  /// Reorders an item within the list by moving it to a new position.
  ///
  /// Removes [item] from its current position and inserts it at [newIndex].
  List<T> reorderItem({
    required List<T> currentItems,
    required T item,
    required int newIndex,
  }) {
    final updatedItems = currentItems
        .where(
          (i) =>
              (comparisonCallback?.call(i) ?? i) !=
              (comparisonCallback?.call(item) ?? item),
        )
        .toList();

    if (newIndex >= updatedItems.length) {
      updatedItems.add(item);
    } else {
      updatedItems.insert(newIndex, item);
    }

    return updatedItems;
  }
}

class ManageListUseCaseFactory {
  ManageListUseCase<T> create<T>({Object Function(T)? comparisonCallback}) {
    return ManageListUseCase<T>(
      comparisonCallback: comparisonCallback,
    );
  }
}
