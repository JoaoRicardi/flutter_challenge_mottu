abstract class ILocalStorage {

  ///metodo que inicializa o plugin
  init();

  List<T>? storeItem<T>(String dbName, T item);

  List<T>? getItem<T>(String dbName, String key);
}