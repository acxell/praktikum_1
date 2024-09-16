import 'package:dio/dio.dart';

class ApiController {
  Future<List<dynamic>> getdatas() async {
    final Response = await Dio()
        .get('https://jakpost.vercel.app' + '/api/category/indonesia');

    final datas = Response.data['posts'];
    print(datas);
    return datas;
  }
}
