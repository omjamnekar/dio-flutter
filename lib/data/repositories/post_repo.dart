import 'package:dio/dio.dart';
import 'package:dio_base_work/data/model/post_model.dart';
import 'package:dio_base_work/data/repositories/api/api.dart';

class PostRepository {
  API api = API();

  Future<List<PostModel>> fetchPost() async {
    try {
      Response response = await api.sendRequest.get("/posts");

      List<dynamic> postMaps = response.data;
      return postMaps.map((e) => PostModel.fromJson(e)).toList();
    } catch (ex) {
      throw ex;
    }
  }
}
