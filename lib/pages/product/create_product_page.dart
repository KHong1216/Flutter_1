import 'package:flutter/material.dart';
import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/app_user/app_user.dart';
import 'package:flutter_project1/models/custom_error.dart';
import 'package:flutter_project1/models/product/product.dart';
import 'package:flutter_project1/pages/product/create_product_provider.dart';
import 'package:flutter_project1/pages/widgets/buttons.dart';
import 'package:flutter_project1/pages/widgets/form_field.dart';
import 'package:flutter_project1/utils/error_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreateProductPage extends ConsumerStatefulWidget {
  const CreateProductPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateProductPageState();
}

class _CreateProductPageState extends ConsumerState<CreateProductPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _autovalidateMode = AutovalidateMode.always;
    });

    final _form = _formKey.currentState;
    if (_form == null || !_form.validate()) return;

    final userDoc = await userCollection.doc(fbAuth.currentUser!.uid).get();
    final userData = AppUser.fromDoc(userDoc);

    Product product = Product(
        name: _nameController.text.trim(),
        price: _priceController.text.trim(),
        desc: _descController.text.trim(),
        region: '화정동',
        uid: fbAuth.currentUser!.uid,
        userName: userData.name,
        chatCount: '0',
        favoriteCount: '0');

    ref.read(createProductProvider.notifier).create(product: product);

    GoRouter.of(context).goNamed(RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(createProductProvider, (prev, next) {
      next.whenOrNull(error: (e, st) => errorDialog(context, e as CustomError));
    });

    final createProductState = ref.watch(createProductProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_left),
          onPressed: () => GoRouter.of(context).goNamed(RouteNames.home),
        ),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: ListView(
            shrinkWrap: true,
            reverse: true,
            children: [
              ProductNameFormField(nameController: _nameController),
              const SizedBox(
                height: 20,
              ),
              PriceFormField(priceController: _priceController),
              const SizedBox(
                height: 40,
              ),
              DescFormField(descController: _descController),
              const SizedBox(
                height: 20.0,
              ),
              CustomFilledButton(
                  onPressed: createProductState.maybeWhen(
                    loading: () => null,
                    orElse: () => _submit,
                  ),
                  fontsize: 20,
                  fontWeight: FontWeight.w600,
                  child: Text(createProductState.maybeWhen(
                      loading: () => '작성중...', orElse: () => '작성완료')))
            ].reversed.toList(),
          ),
        ),
      ),
    );
  }
}
