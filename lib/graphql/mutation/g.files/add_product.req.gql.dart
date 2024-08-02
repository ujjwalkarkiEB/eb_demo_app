// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i6;
import 'package:eb_demo_app/graphql/mutation/g.files/add_product.ast.gql.dart'
    as _i5;
import 'package:eb_demo_app/graphql/mutation/g.files/add_product.data.gql.dart'
    as _i2;
import 'package:eb_demo_app/graphql/mutation/g.files/add_product.var.gql.dart'
    as _i3;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'add_product.req.gql.g.dart';

abstract class GAddProductReq
    implements
        Built<GAddProductReq, GAddProductReqBuilder>,
        _i1.OperationRequest<_i2.GAddProductData, _i3.GAddProductVars> {
  GAddProductReq._();

  factory GAddProductReq([void Function(GAddProductReqBuilder b) updates]) =
      _$GAddProductReq;

  static void _initializeBuilder(GAddProductReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'AddProduct',
    )
    ..executeOnListen = true;

  @override
  _i3.GAddProductVars get vars;
  @override
  _i4.Operation get operation;
  @override
  _i4.Request get execRequest => _i4.Request(
        operation: operation,
        variables: vars.toJson(),
        context: context ?? const _i4.Context(),
      );

  @override
  String? get requestId;
  @override
  @BuiltValueField(serialize: false)
  _i2.GAddProductData? Function(
    _i2.GAddProductData?,
    _i2.GAddProductData?,
  )? get updateResult;
  @override
  _i2.GAddProductData? get optimisticResponse;
  @override
  String? get updateCacheHandlerKey;
  @override
  Map<String, dynamic>? get updateCacheHandlerContext;
  @override
  _i1.FetchPolicy? get fetchPolicy;
  @override
  bool get executeOnListen;
  @override
  @BuiltValueField(serialize: false)
  _i4.Context? get context;
  @override
  _i2.GAddProductData? parseData(Map<String, dynamic> json) =>
      _i2.GAddProductData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GAddProductData data) => data.toJson();

  @override
  _i1.OperationRequest<_i2.GAddProductData, _i3.GAddProductVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GAddProductReq> get serializer =>
      _$gAddProductReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GAddProductReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GAddProductReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GAddProductReq.serializer,
        json,
      );
}
