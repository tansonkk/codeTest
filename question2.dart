import 'dart:collection';

class CacheItem {
  final String key;
  late final dynamic value;
  late final double weight;
  late DateTime lastAccessedTime;

  CacheItem({
    required this.key,
    required this.value,
    required this.weight,
  }) {
    lastAccessedTime = DateTime.now();
  }
}

class question2 {
  final int capacity;
  final LinkedHashMap<String, CacheItem> cache =
      LinkedHashMap<String, CacheItem>();
  double currentWeight = 0;

  question2(this.capacity);

  dynamic get(String key) {
    if (cache.containsKey(key)) {
      CacheItem cacheItem = cache[key]!;
      cacheItem.lastAccessedTime = DateTime.now();
      return cacheItem.value;
    } else {
      return -1;
    }
  }

  void put(String key, dynamic value, double weight) {
    if (cache.containsKey(key)) {
      CacheItem cacheItem = cache[key]!;
      cacheItem.value = value;
      cacheItem.weight = weight;
      cacheItem.lastAccessedTime = DateTime.now();
    } else {
      CacheItem cacheItem = CacheItem(
        key: key,
        value: value,
        weight: weight,
      );

      if (cache.length >= capacity) {
        evict();
      }

      cache[key] = cacheItem;
      currentWeight += weight;
    }
  }

  void evict() {
    String? keyToRemove;
    DateTime? oldestAccessedTime;

    cache.forEach((key, cacheItem) {
      if (oldestAccessedTime == null ||
          cacheItem.lastAccessedTime.isBefore(oldestAccessedTime!)) {
        oldestAccessedTime = cacheItem.lastAccessedTime;
        keyToRemove = key;
      }
    });

    if (keyToRemove != null) {
      CacheItem? cacheItem = cache.remove(keyToRemove!);
      if (cacheItem != null) {
        currentWeight -= cacheItem.weight;
      }
    }
  }
}


// get function is O(1) on average because it is directly find in the hash table.

// put function is O(N), where N is the number of items in the cache. as the function need to add an item to the queue.