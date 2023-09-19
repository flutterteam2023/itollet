import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';
import 'package:itollet/features/Home/presentation/states/home_state.dart';

final homeProvider = NotifierProvider.autoDispose<HomeNotifier, HomeState>(HomeNotifier.new);

class HomeNotifier extends AutoDisposeNotifier<HomeState> {
  final _auth = FirebaseAuth.instance;

  @override
  HomeState build() {
    getUser();
    return HomeState.initial();
  }



   ///get document function
  Future<void> getUser() async {
    final db = FirebaseFirestore.instance;
    UserModel? user  ;
    try {
      await db
          .collection('users').doc(_auth.currentUser?.uid)
          .withConverter<UserModel>(
            fromFirestore: (snapshot, _) => UserModel.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          )
          .get()
          .then((value) {
            user = value.data()!;
                  print("user geldi");

       
      });
    } catch (e) {
      print("users başarısız");
    }
    state = state.copyWith(user: user!);
  }
  Future<List<PostModel>> getPosts() async {
    final db = FirebaseFirestore.instance;
    final list = <PostModel>[];
    try {
      await db
          .collection('posts')
          .withConverter<PostModel>(
            fromFirestore: (snapshot, _) =>
                PostModel.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          )
          .get()
          .then((value) {
        for (var doc in value.docs) {
          list.add(doc.data());
        }
      });
    } catch (e) {
      print(e.toString());
    }
    state = state.copyWith(postModels: list);
    return list;
  }
}
