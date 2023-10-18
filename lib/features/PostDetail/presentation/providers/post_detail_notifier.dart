import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/PostDetail/presentation/states/post_detail_state.dart';
import 'package:url_launcher/url_launcher.dart';

final postDetailProvider = NotifierProvider.autoDispose<PostDetailNotifier, PostDetailState>(PostDetailNotifier.new);

class PostDetailNotifier extends AutoDisposeNotifier<PostDetailState> {

  @override
  PostDetailState build() {
    return PostDetailState.initial();
  }
  

 Future<void> launchUrls(String webUrl,String ilanNo) async {
  final Uri url = Uri.parse(webUrl);
  if (!await launchUrl(url)) {
   await FirebaseFirestore.instance.collection('errorUrl').doc().set({
    'errorTime':DateTime.now(),
    'error':'Hatalı ilan',
    'ilanNo':ilanNo
   });
  }
}

  
}
