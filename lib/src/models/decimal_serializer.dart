import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

class DoubleSerializer implements PrimitiveSerializer<double>{
  @override
  double deserialize(Serializers serializers, Object serialized, {FullType specifiedType = FullType.unspecified}) {
      return double.parse(serialized as String);
    }
  
    @override
    Object serialize(Serializers serializers, double object, {FullType specifiedType = FullType.unspecified}) {
    return object.toStringAsFixed(2);
  }

  @override
  // TODO: implement types
  Iterable<Type> get types => BuiltList<Type>(<Type>[double]);

  @override
  // TODO: implement wireName
  String get wireName => 'double';

}