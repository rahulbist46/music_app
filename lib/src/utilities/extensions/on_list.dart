extension Unique<E, Id> on List<E>? {
  List<E> unique([Id? Function(E element)? id, bool inPlace = true]) {
    if (this == null) return <E>[];
    final Set<dynamic> ids = <dynamic>{};
    List<E> list = inPlace ? this! : List<E>.from(this!);
    list.retainWhere((E x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }

  bool isNullOrEmpty() {
    if (this == null) return true;
    return (this)!.isEmpty;
  }

  bool isNotNullNorEmpty() {
    return this != null && this!.isNotEmpty;
  }
}
