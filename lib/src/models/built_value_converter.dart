
import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:quick_eats/src/models/serializers.dart';



class BuiltValueConverter extends JsonConverter{

  @override
  Request convertRequest(Request request) {
    return super.convertRequest(request.copyWith(
        body: serializers.serializeWith(serializers.serializerForType(request.body.runtimeType)
            , request.body)
    ));
  }

  @override
  Response<BodyType> convertResponse<BodyType, SingleItemType>(Response response) {
    final Response dynamicResponse = super.convertResponse(response);
    final BodyType customBody = _convertToCustomObject<SingleItemType>(dynamicResponse.body);
    return dynamicResponse.copyWith<BodyType>(body: customBody);

  }


  dynamic _convertToCustomObject<SingleItemType>(dynamic element){
    if(element is SingleItemType) return element;

    if(element is List)
      return _deserializeListOf<SingleItemType>(element);
    else
      return __deserialize<SingleItemType>(element);
  }

  BuiltList<SingleItemType> _deserializeListOf<SingleItemType>(List dynamicList){
    return BuiltList<SingleItemType>(
        dynamicList.map((element)=> __deserialize<SingleItemType>(element))
    );
  }

  SingleItemType __deserialize<SingleItemType>(Map<String, dynamic> value){
    return serializers.deserializeWith(serializers.serializerForType(SingleItemType), value);
  }

}