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

  Future<bool> changeUserName(String newUserName) async {
    bool isSuccess = false;
    try {
      await _auth.currentUser?.updateDisplayName(newUserName);
      await getUser();
      UserModel user = state.user;
      await FirebaseFirestore.instance.collection("users").doc(_auth.currentUser?.uid).update(
            user.copyWith(userName: newUserName).toJson(),
          );
      isSuccess = true;
    } catch (e) {
      isSuccess = false;
    }
    return isSuccess;
  }

  ///get document function
  Future<void> getUser() async {
    final db = FirebaseFirestore.instance;
    UserModel? user;
    try {
      await db
          .collection('users')
          .doc(_auth.currentUser?.uid)
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
    final myList = <PostModel>[];

    try {
      await db
          .collection('posts')
          .withConverter<PostModel>(
            fromFirestore: (snapshot, _) => PostModel.fromJson(snapshot.data()!),
            toFirestore: (model, _) => model.toJson(),
          )
          .get()
          .then((value) {
        for (var doc in value.docs) {
         
          list.add(doc.data());
          if (doc.data().fromUID==_auth.currentUser?.uid) {
            myList.add(doc.data());
            
          }
        }
      });
    } catch (e) {
      print(e.toString());
    }
    state = state.copyWith(postModels: list);
      state = state.copyWith(myPostList: myList);


    return list;
  }
  Future<void> postUrl(String postId,String url)async{
    final list = <String>[];
    
    final db = FirebaseFirestore.instance;
   await db.collection('posts').doc(postId).get().then((value){
      for (var e in value.data()!["postUrl"]) {
        list.add(e);
      }
      
    });
 
    list.add(url);
    try {
      await db
      .collection('posts')
      .doc(postId)
      .update({
        'postUrl':list
      }); 
      list.clear();
    } catch (e) {
      print(e); 
    }

  }
  Stream<List<String>> getPostUrlStream(String postId) async* {
    
  final db = FirebaseFirestore.instance;
  final list = <String>[];

  try {
    final value = await db
        .collection('posts')
        .doc(postId)
        
        .get();
for (var e in value.data()!["postUrl"]!) {
  list.add(e);
  
}
state =state.copyWith(postUrls: list);
 
  } catch (e) {
  }

  yield state.postUrls;
}
  
}
