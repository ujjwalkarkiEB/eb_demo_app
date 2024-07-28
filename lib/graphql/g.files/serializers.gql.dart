// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart' show StandardJsonPlugin;
import 'package:eb_demo_app/graphql/g.files/schema.schema.gql.dart'
    show
        GCreateCategoryDto,
        GCreateProductDto,
        GCreateUserDto,
        GDateTime,
        GRole,
        GUpdateCategoryDto,
        GUpdateProductDto,
        GUpdateUserDto;
import 'package:eb_demo_app/graphql/query/category/g.files/get_all_categories.data.gql.dart'
    show GgetAllCategoriesData, GgetAllCategoriesData_categories;
import 'package:eb_demo_app/graphql/query/category/g.files/get_all_categories.req.gql.dart'
    show GgetAllCategoriesReq;
import 'package:eb_demo_app/graphql/query/category/g.files/get_all_categories.var.gql.dart'
    show GgetAllCategoriesVars;
import 'package:eb_demo_app/graphql/query/category/g.files/get_category_by_id.data.gql.dart'
    show
        GgetCategoryByIdData,
        GgetCategoryByIdData_category,
        GgetCategoryByIdData_category_products;
import 'package:eb_demo_app/graphql/query/category/g.files/get_category_by_id.req.gql.dart'
    show GgetCategoryByIdReq;
import 'package:eb_demo_app/graphql/query/category/g.files/get_category_by_id.var.gql.dart'
    show GgetCategoryByIdVars;
import 'package:eb_demo_app/graphql/query/product/g.files/get_product_by_id.data.gql.dart'
    show
        GgetProductDetailsData,
        GgetProductDetailsData_product,
        GgetProductDetailsData_product_category;
import 'package:eb_demo_app/graphql/query/product/g.files/get_product_by_id.req.gql.dart'
    show GgetProductDetailsReq;
import 'package:eb_demo_app/graphql/query/product/g.files/get_product_by_id.var.gql.dart'
    show GgetProductDetailsVars;
import 'package:eb_demo_app/graphql/query/product/g.files/search_products.data.gql.dart'
    show GsearchProductsData, GsearchProductsData_products;
import 'package:eb_demo_app/graphql/query/product/g.files/search_products.req.gql.dart'
    show GsearchProductsReq;
import 'package:eb_demo_app/graphql/query/product/g.files/search_products.var.gql.dart'
    show GsearchProductsVars;
import 'package:ferry_exec/ferry_exec.dart';
import 'package:gql_code_builder/src/serializers/operation_serializer.dart'
    show OperationSerializer;

part 'serializers.gql.g.dart';

final SerializersBuilder _serializersBuilder = _$serializers.toBuilder()
  ..add(OperationSerializer())
  ..addPlugin(StandardJsonPlugin());
@SerializersFor([
  GCreateCategoryDto,
  GCreateProductDto,
  GCreateUserDto,
  GDateTime,
  GRole,
  GUpdateCategoryDto,
  GUpdateProductDto,
  GUpdateUserDto,
  GgetAllCategoriesData,
  GgetAllCategoriesData_categories,
  GgetAllCategoriesReq,
  GgetAllCategoriesVars,
  GgetCategoryByIdData,
  GgetCategoryByIdData_category,
  GgetCategoryByIdData_category_products,
  GgetCategoryByIdReq,
  GgetCategoryByIdVars,
  GgetProductDetailsData,
  GgetProductDetailsData_product,
  GgetProductDetailsData_product_category,
  GgetProductDetailsReq,
  GgetProductDetailsVars,
  GsearchProductsData,
  GsearchProductsData_products,
  GsearchProductsReq,
  GsearchProductsVars,
])
final Serializers serializers = _serializersBuilder.build();
