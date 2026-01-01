import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.example.com/")
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET("chat")
  Future<String> getChatResponse(@Query("message") String message);
}