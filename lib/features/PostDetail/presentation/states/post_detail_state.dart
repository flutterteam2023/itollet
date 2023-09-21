import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail_state.freezed.dart';

@freezed
class PostDetailState with _$PostDetailState {
  factory PostDetailState(
      {required bool isLoading,
    
    
   
      }) = _PostDetailState;
  factory PostDetailState.initial() => PostDetailState(
        isLoading: false,
  
        
      );
}