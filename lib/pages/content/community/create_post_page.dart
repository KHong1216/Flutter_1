import 'package:flutter/material.dart';
import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/models/app_user/app_user.dart';
import 'package:flutter_project1/models/community/community.dart';
import 'package:flutter_project1/models/custom_error.dart';
import 'package:flutter_project1/pages/content/community/create_post_provider.dart';
import 'package:flutter_project1/pages/widgets/buttons.dart';
import 'package:flutter_project1/pages/widgets/form_field.dart';
import 'package:flutter_project1/utils/error_dialog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CreatePostPage extends ConsumerStatefulWidget {
  const CreatePostPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ConsumerState<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
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

    Community community = Community(
        uid: fbAuth.currentUser!.uid,
        writer: userData.name,
        name: _nameController.text.trim(),
        desc: _descController.text.trim(),
        region: '화정동',
        viewCount: '0',
        goodCount: '0',
        commentCount: '0',
        comment: List.empty());

    ref.read(createPostProvider.notifier).create(community: community);

    GoRouter.of(context).goNamed(RouteNames.home);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<void>>(createPostProvider, (prev, next) {
      next.whenOrNull(error: (e, st) => errorDialog(context, e as CustomError));
    });

    final createPostState = ref.watch(createPostProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_left),
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
              DescFormField(descController: _descController),
              const SizedBox(
                height: 20.0,
              ),
              CustomFilledButton(
                  onPressed: createPostState.maybeWhen(
                    loading: () => null,
                    orElse: () => _submit,
                  ),
                  fontsize: 20,
                  fontWeight: FontWeight.w600,
                  child: Text(createPostState.maybeWhen(
                      loading: () => '작성중...', orElse: () => '작성완료')))
            ].reversed.toList(),
          ),
        ),
      ),
    );
  }
}
