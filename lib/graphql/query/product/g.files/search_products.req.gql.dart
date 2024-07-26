// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:eb_demo_app/graphql/g.files/serializers.gql.dart' as _i6;
import 'package:eb_demo_app/graphql/query/product/g.files/search_products.ast.gql.dart'
    as _i5;
import 'package:eb_demo_app/graphql/query/product/g.files/search_products.data.gql.dart'
    as _i2;
import 'package:eb_demo_app/graphql/query/product/g.files/search_products.var.gql.dart'
    as _i3;
import 'package:ferry_exec/ferry_exec.dart' as _i1;
import 'package:gql_exec/gql_exec.dart' as _i4;

part 'search_products.req.gql.g.dart';

abstract class GsearchProductsReq
    implements
        Built<GsearchProductsReq, GsearchProductsReqBuilder>,
        _i1.OperationRequest<_i2.GsearchProductsData, _i3.GsearchProductsVars> {
  GsearchProductsReq._();

  factory GsearchProductsReq(
          [void Function(GsearchProductsReqBuilder b) updates]) =
      _$GsearchProductsReq;

  static void _initializeBuilder(GsearchProductsReqBuilder b) => b
    ..operation = _i4.Operation(
      document: _i5.document,
      operationName: 'searchProducts',
    )
    ..executeOnListen = true;

  @override
  _i3.GsearchProductsVars get vars;
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
  _i2.GsearchProductsData? Function(
    _i2.GsearchProductsData?,
    _i2.GsearchProductsData?,
  )? get updateResult;
  @override
  _i2.GsearchProductsData? get optimisticResponse;
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
  _i2.GsearchProductsData? parseData(Map<String, dynamic> json) =>
      _i2.GsearchProductsData.fromJson(json);

  @override
  Map<String, dynamic> varsToJson() => vars.toJson();

  @override
  Map<String, dynamic> dataToJson(_i2.GsearchProductsData data) =>
      data.toJson();

  @override
  _i1.OperationRequest<_i2.GsearchProductsData, _i3.GsearchProductsVars>
      transformOperation(_i4.Operation Function(_i4.Operation) transform) =>
          this.rebuild((b) => b..operation = transform(operation));

  static Serializer<GsearchProductsReq> get serializer =>
      _$gsearchProductsReqSerializer;

  Map<String, dynamic> toJson() => (_i6.serializers.serializeWith(
        GsearchProductsReq.serializer,
        this,
      ) as Map<String, dynamic>);

  static GsearchProductsReq? fromJson(Map<String, dynamic> json) =>
      _i6.serializers.deserializeWith(
        GsearchProductsReq.serializer,
        json,
      );
}
