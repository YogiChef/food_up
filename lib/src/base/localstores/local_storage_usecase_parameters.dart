class SaveLocalStorageParameters {
  final String key;
  final String value;
  SaveLocalStorageParameters({
    required this.key,
    required this.value,
  });
}

class FetchLocalStorageParameters {
  final String key;

  FetchLocalStorageParameters({
    required this.key,
  });
}

class RemoveLocalStorageParameters {
  final String key;
  RemoveLocalStorageParameters({
    required this.key,
  });
}
