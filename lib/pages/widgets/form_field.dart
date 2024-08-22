import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:validators/validators.dart';

class EmailFormField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailFormField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false, //??
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        labelText: 'Email',
        hintText: 'your@email.com',
        prefixIcon: Icon(Icons.email),
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Email required';
        }
        if (!isEmail(value.trim())) {
          return 'Enter a valid email';
        }
        return null;
      },
    );
  }
}

class PasswordFormField extends StatelessWidget {
  final TextEditingController passwordController;

  const PasswordFormField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        labelText: 'Password',
        prefixIcon: Icon(Icons.lock),
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Password required';
        }
        if (value.trim().length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      },
    );
  }
}

class ConfirmPasswordFormField extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const ConfirmPasswordFormField({
    Key? key,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        labelText: 'Confirm Password',
        prefixIcon: Icon(Icons.lock),
      ),
      validator: (String? value) {
        if (confirmPasswordController.text != value) {
          return 'Passwords not match';
        }
        return null;
      },
    );
  }
}

class NameFormField extends StatelessWidget {
  final TextEditingController _nameController;

  const NameFormField({
    Key? key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        labelText: 'Name',
        prefixIcon: Icon(Icons.account_box),
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Name required';
        }
        if (value.trim().length < 2 || value.trim().length > 12) {
          return 'Name must be between 2 and 12 characters long';
        }
        return null;
      },
    );
  }
}

class ProductNameFormField extends StatelessWidget {
  final TextEditingController _nameController;

  const ProductNameFormField({
    Key? key,
    required TextEditingController nameController,
  }) : _nameController = nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        hintText: '제목을 입력해주세요',
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Name required';
        }
        return null;
      },
    );
  }
}

class PriceFormField extends StatelessWidget {
  final TextEditingController _priceController;

  const PriceFormField({
    Key? key,
    required TextEditingController priceController,
  }) : _priceController = priceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _priceController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        hintText: '금액을 입력해주세요',
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Price required';
        }
        return null;
      },
    );
  }
}

class DescFormField extends StatelessWidget {
  final TextEditingController _descController;

  const DescFormField({
    Key? key,
    required TextEditingController descController,
  }) : _descController = descController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _descController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        hintText: '설명을 입력해주세요',
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Description required';
        }
        return null;
      },
    );
  }
}

class ChatFormField extends StatelessWidget {
  final TextEditingController _chatController;

  const ChatFormField({
    Key? key,
    required TextEditingController chatController,
  }) : _chatController = chatController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _chatController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        hintText: '내용을 입력해주세요',
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Content required';
        }
        return null;
      },
    );
  }
}

class CommentFormField extends StatelessWidget {
  final TextEditingController _commentController;

  const CommentFormField({
    Key? key,
    required TextEditingController commentController,
  }) : _commentController = commentController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _commentController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        filled: true,
        hintText: '댓글을 입력해주세요',
      ),
      validator: (String? value) {
        if (value == null || value.trim().isEmpty) {
          return 'Content required';
        }
        return null;
      },
    );
  }
}
