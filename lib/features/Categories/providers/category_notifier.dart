import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/iberkeugur/log.dart';
import 'package:itollet/features/Categories/models/category/category_model.dart';
import 'package:itollet/features/Categories/states/category_state.dart';
import 'package:logger/logger.dart';

final categoryProvider = NotifierProvider.autoDispose<CategoryNotifier, CategoryState>(CategoryNotifier.new);

class CategoryNotifier extends AutoDisposeNotifier<CategoryState> {
  final db = FirebaseFirestore.instance;
  final collection = "categories";
  final logger = Logger(
    printer: PrettyPrinter(
      lineLength: 60,
    ),
  );

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
        Log.instance.info('${value.docs.length} kategori getirildi.');
        Log.instance.error('error log hatalı');
        Log.instance.warning('uyarı ter giden bir şeyler var');
        Log().success('başarılı işlem.');
        var logger = Logger();

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
