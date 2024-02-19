import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/Account/Models/account_transaction_model.dart';
import 'package:itollet/features/Account/Services/account_transaction_service.dart';
import 'package:itollet/features/Account/Services/user_service.dart';
import 'package:itollet/features/Account/Utils/account_transaction_type_enum.dart';
import 'package:itollet/features/Auth/Login/data/model/user_model.dart';
import 'package:itollet/features/Categories/models/post_model/post_model.dart';
import 'package:itollet/features/Home/presentation/states/home_state.dart';
import 'package:itollet/iberkeugur/Log/log.dart';
import 'package:itollet/iberkeugur/Snackbar/snackbar_extension.dart';

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
        print("user geldiiiii");
      });
    } catch (e) {
      print("users başarısız");
    }
    if (user != null) {
      state = state.copyWith(user: user!);
    }
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
          if (doc.data().fromUID == _auth.currentUser?.uid) {
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

  Stream<List<PostModel>> getStreamPosts() {
    final db = FirebaseFirestore.instance;

    // Firestore'dan gelen verileri akış halinde dinlemek için kullanılır.
    return db
        .collection('posts')
        .withConverter<PostModel>(
          fromFirestore: (snapshot, _) => PostModel.fromJson(snapshot.data()!),
          toFirestore: (model, _) => model.toJson(),
        )
        .snapshots() // Verilerin akışını dinlemek için snapshots() metodu kullanılır.
        .map((querySnapshot) {
      // Firestore'dan gelen belgeleri PostModel listesine dönüştürür.
      final List<PostModel> list = [];
      final List<PostModel> myList = [];

      for (var doc in querySnapshot.docs) {
        DateTime suan = DateTime.now();
        DateTime ilanBitisTarihi = doc.data().createdAt!.add(Duration(hours: 24));

        Duration kalanSure = ilanBitisTarihi.difference(suan);
        int kalanSaat = kalanSure.inHours;
        int kalanDakika = (kalanSure.inMinutes - kalanSaat * 60);
        if (kalanSaat >= 0) {
          final post = doc.data();
          list.add(post);
          if (post.fromUID == _auth.currentUser?.uid) {
            myList.add(post);
          }
        }
      }

      // Akışa PostModel listesini ekler.
      state = state.copyWith(postModels: list);
      state = state.copyWith(myPostList: myList);

      return list;
    }).handleError((error) {
      // Hata durumunda akışı yönetmek için kullanılabilir.
      print("Hata oluştu: $error");
      // Hata durumunda boş bir liste döndürebilir veya hata mesajını içeren bir hata nesnesi döndürebilirsiniz.
      throw error;
    });
  }

  Future<void> postUrl(String postId, String url, BuildContext context) async {
    if (state.streamUser.balance != 0 || state.streamUser.balance! < 0) {
      final list = <String>[];
      String enteredUrl = url;
      RegExp urlRegExp = RegExp(r'^(https?|ftp):\/\/[^\s/$.?#].[^\s]*$'); // Basit bir URL düzenli ifadesi

      if (urlRegExp.hasMatch(enteredUrl) && state.streamUser.balance! >= 3.75) {
        // URL formatı doğruysa işlem yapabilirsiniz
        final db = FirebaseFirestore.instance;
        await db.collection('posts').doc(postId).get().then((value) {
          if (value.data()!["postUrl"] != null) {
            for (var e in value.data()!["postUrl"]) {
              list.add(e);
            }
          }
        }).then((value) {
          db
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .update({'balance': state.streamUser.balance! - 3.75});
        });

        list.add(url);
        try {
          await db.collection('posts').doc(postId).update({'postUrl': list}).then((value) {
            context.popRoute();
            context.snackbar('Teklif Verild!',
                backgroundColor: Colors.pink, contentStyle: TextStyle(color: Colors.white, fontSize: 15.sp));
          });
          list.clear();
        } catch (e) {
          print(e);
        }

        try {
          await AccountTransactionService().create(
            AccountTransactionModel(
              amount: "- 3.75₺",
              fromUid: FirebaseAuth.instance.currentUser?.uid ?? "null",
              createdAt: Timestamp.now().toDate(),
              docId: "docId",
              type: AccountTransactionTypes.biddingFee,
            ),
          );

          await UserService().updateTotalBiddingFee(3.75);
        } catch (e) {
          Log.instance.error("AccountTransactionService create failed in home_notifier.dart");
        }
      } else if (state.streamUser.balance! < 3.75) {
        // URL formatı yanlışsa uyarı göster
        context.popRoute();
        context.snackbar('Lütfen Bakiye Yükleyin!',
            backgroundColor: Colors.pink, contentStyle: TextStyle(color: Colors.white, fontSize: 15.sp));
      } else if (urlRegExp.hasMatch(enteredUrl) == false) {
        // URL formatı yanlışsa uyarı göster
        context.popRoute();
        context.snackbar('Lütfen Geçerli Bir Url Ekleyin!',
            backgroundColor: Colors.pink, contentStyle: TextStyle(color: Colors.white, fontSize: 15.sp));
      }
    }
  }

  Stream<List<String>> getPostUrlStream(String postId) async* {
    final db = FirebaseFirestore.instance;
    final list = <String>[];

    try {
      final value = await db.collection('posts').doc(postId).get();
      for (var e in value.data()!["postUrl"]!) {
        list.add(e);
      }
      state = state.copyWith(postUrls: list);
    } catch (e) {}

    yield state.postUrls;
  }

  Future<void> addBalance(double balance, BuildContext context) async {
    try {
      if (state.streamUser.balance != null) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update({'balance': state.streamUser.balance! + balance}).then((value) {
          context.snackbar('Bakiye Yüklendi!',
              backgroundColor: Colors.pink, contentStyle: TextStyle(color: Colors.white, fontSize: 15.sp));
        });
      } else {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser?.uid)
            .update({'balance': state.streamUser.balance ?? 0 + balance}).then((value) {
          context.snackbar('Bakiye Yüklendi!',
              backgroundColor: Colors.pink, contentStyle: TextStyle(color: Colors.white, fontSize: 15.sp));
        });
      }
      //hesap hareketlerini kayıt etme

      try {
        await AccountTransactionService().create(AccountTransactionModel(
          amount: "+$balance ₺",
          fromUid: (FirebaseAuth.instance.currentUser?.uid).toString(),
          createdAt: Timestamp.now().toDate(),
          docId: "",
          type: AccountTransactionTypes.addBalance,
        ));

        await UserService().updateAllTimeBalance(balance);
      } catch (e) {
        Log.instance.error("AccountTransactionService & UserService error: $e in home_notifier");
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      context.snackbar('Hata Oluştu $e',
          backgroundColor: Colors.pink, contentStyle: TextStyle(color: Colors.white, fontSize: 15.sp));
    }
  }

  Stream<UserModel> getStreamUser() async* {
    final db = FirebaseFirestore.instance;

    try {
      final value = await db.collection('users').doc(FirebaseAuth.instance.currentUser?.uid).get();

      if (value.exists) {
        // value.data() artık Generic tipi içine alınarak kullanılmalıdır
        final userData = value.data() as Map<String, dynamic>;

        // UserModel sınıfını oluşturduğunuzu varsayalım ve bu veriyi kullanarak nesne oluşturun
        final userModel = UserModel.fromJson(userData);

        // State'i güncelle
        state = state.copyWith(streamUser: userModel);
      }
    } catch (e) {
      // Hata durumunda bir şeyler yapabilirsiniz
    }

    yield state.streamUser;
  }

  Stream<List<String>> getPostUrlsStream(String documentId) {
    // Firestore bağlantısı
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Belirli bir dokümanı referans al ve 'postUrl' alanındaki değişiklikleri dinle
    return firestore.collection('posts').doc(documentId).snapshots().map((snapshot) {
      // Doküman varsa, 'postUrl' alanındaki verileri List<String> türüne dönüştür
      List<dynamic> urlList = snapshot.data()?['postUrl'] ?? [];
      return urlList.map((url) => url.toString()).toList();
    });
  }
}
