import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:itollet/features/PostDetail/presentation/states/post_detail_state.dart';
import 'package:url_launcher/url_launcher.dart';

final postDetailProvider = NotifierProvider.autoDispose<PostDetailNotifier, PostDetailState>(PostDetailNotifier.new);

class PostDetailNotifier extends AutoDisposeNotifier<PostDetailState> {

  @override
  PostDetailState build() {
    return PostDetailState.initial();
  }
  

 Future<void> launchUrls(String webUrl) async {
  final Uri url = Uri.parse(webUrl);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

  
}
