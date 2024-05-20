import 'dart:convert';


import 'package:http/http.dart';
import 'package:pr_8/repository/api/api_client.dart';
import 'package:pr_8/repository/model/ai_model.dart';







class AIApi {
  ApiClient apiClient = ApiClient();


  Future<Aimodel> postAi(String massage) async {
    String trendingpath = 'https://animimagine-ai.p.rapidapi.com/generateImage';
    var body = {
     
      "selected_model_id": "anything-v5",
      "selected_model_bsize": "512",
      "prompt":massage,
   


    };
    Response response = await apiClient.invokeAPI(trendingpath, 'POST',jsonEncode(body));

    return Aimodel.fromJson(jsonDecode(response.body));
  }
}