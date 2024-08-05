import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:eb_demo_app/core/utils/base/base_graphql_remote_source.dart';
import 'package:eb_demo_app/core/utils/error/exception/api_exception.dart';
import 'package:eb_demo_app/core/utils/network/client/graphql_client.dart';
import 'package:eb_demo_app/graphql/mutation/g.files/add_product.data.gql.dart';
import 'package:eb_demo_app/graphql/mutation/g.files/add_product.req.gql.dart';
import 'package:eb_demo_app/graphql/query/category/g.files/get_all_categories.data.gql.dart';
import 'package:eb_demo_app/graphql/query/category/g.files/get_all_categories.req.gql.dart';
import 'package:eb_demo_app/graphql/query/product/g.files/get_product_by_id.data.gql.dart';
import 'package:eb_demo_app/graphql/query/product/g.files/get_product_by_id.req.gql.dart';
import 'package:eb_demo_app/graphql/query/product/g.files/search_products.data.gql.dart';
import 'package:eb_demo_app/graphql/query/product/g.files/search_products.req.gql.dart';
import 'package:eb_demo_app/src/features/shop/data/model/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import '../../model/category.dart';

abstract class ShopRemoteSource {
  Future<List<ProductSummary>> getTrendingProducts();
  Future<List<CategorySummary>> getAllCategories();
  Future<List<ProductSummary>> searchProductsByTitle(
      String query, int offset, int limit);
  Future<ProductDetail> getProductDetails(String productID);
  Future<List<ProductSummary>> fetchCategoryProducts(
      {required double categoryID, required int offset});
  Future<List<ProductSummary>> applyPriceFilter(
      {required double categoryID,
      required int minPrice,
      required int maxPrice});

  Future<ProductSummary> createProduct(String title, double price,
      String description, double categoryId, List<String> images);
}

@LazySingleton(as: ShopRemoteSource)
class ShopRemoteSourceImpl extends BaseGraphQLRemoteSource
    implements ShopRemoteSource {
  ShopRemoteSourceImpl(GraphqlClient graphqlClient)
      : super(graphqlClient.client);

  @override
  Future<List<CategorySummary>> getAllCategories() async {
    final GgetAllCategoriesReq req = GgetAllCategoriesReq();

    return graphqlRequest<List<CategorySummary>>(
      request: (client) => client.request(req).first,
      onResponse: (data) {
        if (data is GgetAllCategoriesData) {
          final categoriesData = data.categories;
          return categoriesData
              .map((category) => CategorySummary(
                  id: category.id, name: category.name, image: category.image))
              .toList();
        }
        throw Exception('Unexpected data type ');
      },
    );
  }

  @override
  Future<ProductDetail> getProductDetails(String productID) {
    final GgetProductDetailsReq req = GgetProductDetailsReq(
      (b) => b..vars.id = productID,
    );
    return graphqlRequest(
      request: (client) => client.request(req).first,
      onResponse: (data) {
        if (data is GgetProductDetailsData) {
          final res = ProductDetail.fromModel(data);
          return res;
        }
        throw Exception('Unexpected data type ');
      },
    );
  }

  @override
  Future<List<ProductSummary>> getTrendingProducts() {
    final GsearchProductsReq req = GsearchProductsReq(
      (b) => b
        ..vars.limit = 10
        ..vars.offset = 0,
    );
    return graphqlRequest(
      request: (client) => client.request(req).first,
      onResponse: (data) {
        if (data is GsearchProductsData) {
          final products = data.products;
          return products
              .map(
                (product) => ProductSummary(
                    id: product.id,
                    title: product.title,
                    price: product.price,
                    images: product.images.toList()),
              )
              .toList();
        }
        throw Exception('Unexpected data type ');
      },
    );
  }

  @override
  Future<List<ProductSummary>> searchProductsByTitle(
      String query, int limit, int offset) {
    final GsearchProductsReq req = GsearchProductsReq(
      (b) => b
        ..vars.title = query
        ..vars.limit = limit
        ..vars.offset = offset,
    );
    return graphqlRequest(
      request: (client) => client.request(req).first,
      onResponse: (data) {
        if (data is GsearchProductsData) {
          final products = data.products;
          return products
              .map(
                (product) => ProductSummary(
                    id: product.id,
                    title: product.title,
                    price: product.price,
                    images: product.images.toList()),
              )
              .toList();
        }
        throw Exception('Unexpected data type ');
      },
    );
  }

  @override
  Future<List<ProductSummary>> applyPriceFilter(
      {required double categoryID,
      required int minPrice,
      required int maxPrice}) {
    final GsearchProductsReq req = GsearchProductsReq(
      (b) => b
        ..vars.categoryId = categoryID
        ..vars.price_max = maxPrice
        ..vars.price_min = minPrice,
    );
    return graphqlRequest(
      request: (client) => client.request(req).first,
      onResponse: (data) {
        if (data is GsearchProductsData) {
          final products = data.products;
          return products
              .map(
                (product) => ProductSummary(
                    id: product.id,
                    title: product.title,
                    price: product.price,
                    images: product.images.toList()),
              )
              .toList();
        }
        throw Exception('Unexpected data type ');
      },
    );
  }

  @override
  Future<List<ProductSummary>> fetchCategoryProducts(
      {required double categoryID, required int offset}) {
    final GsearchProductsReq req = GsearchProductsReq(
      (b) => b
        ..vars.categoryId = categoryID
        ..vars.limit = 8
        ..vars.offset = offset,
    );
    return graphqlRequest(
      request: (client) => client.request(req).first,
      onResponse: (data) {
        if (data is GsearchProductsData) {
          final products = data.products;
          return products
              .map(
                (product) => ProductSummary(
                    id: product.id,
                    title: product.title,
                    price: product.price,
                    images: product.images.toList()),
              )
              .toList();
        }
        throw Exception('Unexpected data type ');
      },
    );
  }

  @override
  Future<ProductSummary> createProduct(String title, double price,
      String description, double categoryId, List<String> images) async {
    try {
      final productImages =
          await _uploadImagesToFirestore(pickedImages: images);
      print('Uploaded product images: $productImages'); // Debug print

      final GAddProductReq req = GAddProductReq(
        (b) => b
          ..vars.categoryId = categoryId
          ..vars.description = description
          ..vars.images = ListBuilder<String>(productImages)
          ..vars.title = title
          ..vars.price = price,
      );

      return graphqlRequest<ProductSummary>(
        request: (client) => client.request(req).first,
        onResponse: (data) {
          if (data is GAddProductData) {
            final createdProduct = data.addProduct;

            // Parse the images field
            List<String> imagesList = createdProduct.images
                .map<String>(
                    (image) => image.replaceAll(RegExp(r'\[|\]|\"'), ''))
                .toList();

            final product = ProductSummary(
              id: createdProduct.id,
              title: createdProduct.title,
              price: createdProduct.price,
              images: imagesList,
              categoryID: categoryId,
            );
            return product;
          }
          throw Exception('Unexpected data type');
        },
      );
    } catch (e) {
      throw UnknownException('Create product error: ${e.toString()}');
    }
  }
}

Future<List<String>> _uploadImagesToFirestore(
    {required List<String> pickedImages}) async {
  try {
    List<String> downloadUrls = [];
    for (String imagePath in pickedImages) {
      File imageFile = File(imagePath);
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref =
          FirebaseStorage.instance.ref().child('products/$fileName');
      UploadTask uploadTask = ref.putFile(imageFile);
      TaskSnapshot snapshot = await uploadTask;
      String downloadUrl = await snapshot.ref.getDownloadURL();
      print('downlaodd url: $downloadUrl');
      downloadUrls.add(downloadUrl);
    }
    return downloadUrls;
  } catch (e) {
    throw UnknownException('Firebasestorage upload error!');
  }
}
