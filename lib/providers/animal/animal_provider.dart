mixin AnimalProvider {
  Future<void> findByCategory();
  Future<void> findByCategoryScanner(int categoryId);

  void search(String search);
}
