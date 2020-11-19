import 'package:chopper/chopper.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:quick_eats/src/models/responses/menu_response.dart';
import 'package:quick_eats/src/models/responses/restaurant_response.dart';
import 'server_settings.dart';

part 'restaurant_api_service.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class RestaurantApiService extends ChopperService {
  @Get(path: 'get-restaurants', headers: {'Content-Type': 'application/json'})
  Future<Response<RestaurantResponse>> getAllRestaurants();

  @Get(
      path: 'get-item-categories',
      headers: {'Content-Type': 'application/json'})
  Future<Response<MenuItemCategoriesResponse>> getMenuItemCategories();

  @Get(
      path: 'get-menu-items/{menu_id}',
      headers: {'Content-Type': 'application/json'})
  Future<Response<MenuItemsResponse>> getMenuItems(@Path("menu_id") String id);

  @Get(
      path: 'get-menu-category-items/{category_id}',
      headers: {'Content-Type': 'application/json'})
  Future<Response<MenuItemsByCategoryResponse>> getMenuItemsByCategory(@Path("category_id") String id);

  

  static RestaurantApiService create() {
    final client = ChopperClient(
      baseUrl: serverBaseUrl,
      services: [
        _$RestaurantApiService(),
      ],
      converter: BuiltValueConverter(),
      interceptors: [
        HeadersInterceptor({'Cache-Control': 'no-cache'}),
        HttpLoggingInterceptor(),
      ],
    );
    return _$RestaurantApiService(client);
  }
}
