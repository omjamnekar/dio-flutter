import 'package:dio/dio.dart';
import 'package:dio_base_work/data/model/post_model.dart';
import 'package:dio_base_work/data/repositories/post_repo.dart';
import 'package:dio_base_work/logic/cubits/post_cubit/post_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()) {
    fetchPost();
  }

  PostRepository postRepository = PostRepository();
  void fetchPost() async {
    try {
      List<PostModel> posts = await postRepository.fetchPost();

      emit(PostLoadedState(posts));
    } on DioException catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}
