import 'package:auto_route/auto_route.dart';
import 'package:eb_demo_app/core/utils/constants/colors.dart';
import 'package:eb_demo_app/src/features/shop/presentation/blocs/store/store_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:quickalert/quickalert.dart';
import 'widget/caetgory_section.dart';
import 'widget/image_picker.dart';

@RoutePage()
class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  final formKey = GlobalKey<FormState>();

  String title = '';
  double price = 0.0;
  String description = '';

  void _createProduct() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      context.read<StoreBloc>().add(CreateProductEvent(
          title: title, description: description, price: price));
    }
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelMedium;

    return BlocListener<StoreBloc, StoreState>(
      listener: (context, state) {
        if (state is ProductInputFieldError) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: '${state.field} is not optional!',
            width: 50,
          );
        }

        if (state is ProductCreateSuccessful) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            text: 'The product has been created successfully!',
            width: 50,
          );
        }
        if (state is ProductCreateError) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            text: 'Failed to create product!',
            width: 50,
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Create Product'),
          backgroundColor: AppColors.buttonColor,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CategorySection(),
                  const Gap(10),
                  Text(
                    'Add Images',
                    style: labelStyle,
                  ),
                  const Gap(10),
                  const Align(
                    alignment: Alignment.center,
                    child: ImagePickerWidget(),
                  ),
                  const Gap(10),
                  Text(
                    'Product Title',
                    style: labelStyle,
                  ),
                  const Gap(10),
                  TextFormField(
                    maxLength: 30,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    onSaved: (val) {
                      if (val != null) {
                        title = val;
                      }
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Title is a non-empty field';
                      }
                      return null;
                    },
                  ),
                  const Gap(10),
                  Text(
                    'Product Price',
                    style: labelStyle,
                  ),
                  const Gap(10),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    onSaved: (val) {
                      if (val != null) {
                        price = double.parse(val);
                      }
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Price is a non-empty field';
                      }
                      if (double.tryParse(val) == null) {
                        return 'Please enter a valid price';
                      }
                      return null;
                    },
                  ),
                  const Gap(10),
                  Text(
                    'Description',
                    style: labelStyle,
                  ),
                  const Gap(10),
                  TextFormField(
                    keyboardType: TextInputType.text,
                    minLines: 2,
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    onSaved: (val) {
                      if (val != null) {
                        description = val;
                      }
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Description is required';
                      }
                      return null;
                    },
                  ),
                  const Gap(10),
                  ElevatedButton(
                    onPressed: _createProduct,
                    child: BlocBuilder<StoreBloc, StoreState>(
                      builder: (context, state) {
                        if (state is ProductCreateLoading) {
                          return const Center(
                              child: CupertinoActivityIndicator());
                        }
                        return const Text('Create Product');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
