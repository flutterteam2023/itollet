import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';
import 'package:itollet/features/Categories/states/category_state.dart';
import 'package:logger/logger.dart';

final categoryProvider = NotifierProvider.autoDispose<CategoryNotifier, CategoryState>(CategoryNotifier.new);

class CategoryNotifier extends AutoDisposeNotifier<CategoryState> {
  final db = FirebaseFirestore.instance;
  final collection = "categories";
  final logger = Logger();

  @override
  CategoryState build() {
    getCategories();
    return CategoryState.initial();
  }

  ///get document function
  Future<List<CategoryModel>> getCategories() async {
    final list = <CategoryModel>[];
    try {
      await db
          .collection(collection)
          .withConverter<CategoryModel>(
            fromFirestore: (snapshot, _) => CategoryModel.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          )
          .get()
          .then((value) {
        logger.i("${value.docs.length} kategori getirildi.");
        for (var doc in value.docs) {
          list.add(doc.data());
        }
      });
    } catch (e) {
      logger.w("$e");
    }
    state = state.copyWith(categories: list);
    return list;
  }
}
