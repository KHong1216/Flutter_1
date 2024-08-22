import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project1/pages/content/chat/chat_list_page.dart';
import 'package:flutter_project1/pages/content/chat/chat_room_page.dart';
import 'package:flutter_project1/pages/content/community/community_detail_page.dart';
import 'package:flutter_project1/pages/content/reauthenticate/reauthenticate_page.dart';
import 'package:flutter_project1/repositories/auth/auth_repository_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_project1/config/router/route_names.dart';
import 'package:flutter_project1/constants/firebase_constants.dart';
import 'package:flutter_project1/pages/auth/reset_password/reset_password_page.dart';
import 'package:flutter_project1/pages/auth/signin/signin_page.dart';
import 'package:flutter_project1/pages/auth/signup/signup_page.dart';
import 'package:flutter_project1/pages/auth/verify_email/verify_email_page.dart';
import 'package:flutter_project1/pages/content/change_password/change_password_page.dart';
import 'package:flutter_project1/pages/content/community/community_page.dart';
import 'package:flutter_project1/pages/content/community/create_post_page.dart';
import 'package:flutter_project1/pages/content/home/home_page.dart';
import 'package:flutter_project1/pages/page_not_found.dart';
import 'package:flutter_project1/pages/product/create_product_page.dart';
import 'package:flutter_project1/pages/product/product_card_page.dart';
import 'package:flutter_project1/pages/product/product_list_page.dart';
import 'package:flutter_project1/pages/splash/firebase_error_page.dart';
import 'package:flutter_project1/pages/splash/splash_page.dart';

part 'router_provider.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authStateStreamProvider);

  return GoRouter(
    initialLocation: '/splash', //초기화면
    redirect: (context, state) {
      if (authState is AsyncLoading<User?>) {
        return '/splash';
      }

      if (authState is AsyncError<User?>) {
        return '/firebaseError';
      }

      final authenticated =
          authState.valueOrNull != null; // 인증상태가 null이 아니면 인증상태

      final authenticating = (state.matchedLocation == '/signin') ||
          (state.matchedLocation == 'signup') ||
          (state.matchedLocation == '/resetPassword'); //로그인 회원가입 비번재설정인경우 인증중

      if (authenticated == false) {
        return authenticating ? null : '/signup';
      } //인증상태도 아니고 인증중도 아니면 로그인으로

      if (!fbAuth.currentUser!.emailVerified) {
        return '/verifyEmail';
      }

      final verifyingEmail = state.matchedLocation == '/verifyEmail';
      final splashing = state.matchedLocation == '/splash';

      return (authenticating || verifyingEmail || splashing) ? '/home' : null;
    },
    routes: [
      GoRoute(
        path: '/splash',
        name: RouteNames.splash,
        builder: (context, state) {
          print('### Splash ###');
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/firebaseError',
        name: RouteNames.firebaseError,
        builder: (context, state) {
          return const FirebaseErrorPage();
        },
      ),
      GoRoute(
        path: '/signin',
        name: RouteNames.signin,
        builder: (context, state) {
          return const SigninPage();
        },
      ),
      GoRoute(
        path: '/signup',
        name: RouteNames.signup,
        builder: (context, state) {
          return const SignupPage();
        },
      ),
      GoRoute(
        path: '/resetPassword',
        name: RouteNames.resetPassword,
        builder: (context, state) {
          return const ResetPasswordPage();
        },
      ),
      GoRoute(
        path: '/verifyEmail',
        name: RouteNames.verifyEmail,
        builder: (context, state) {
          return const VerifyEmailPage();
        },
      ),
      GoRoute(
        path: '/home',
        name: RouteNames.home,
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/changePassword',
        name: RouteNames.changePassword,
        builder: (context, state) {
          return const ChangePasswordPage();
        },
      ),
      GoRoute(
        path: '/createProduct',
        name: RouteNames.createProduct,
        builder: (context, state) {
          return const CreateProductPage();
        },
      ),
      GoRoute(
        path: '/createPost',
        name: RouteNames.createPost,
        builder: (context, state) {
          return const CreatePostPage();
        },
      ),
      GoRoute(
        path: '/reauthenticate',
        name: RouteNames.reauthenticate,
        builder: (context, state) {
          return const ReauthenticatePage();
        },
      ),
      GoRoute(
        path: '/chatList',
        name: RouteNames.chatList,
        builder: (context, state) {
          return const ChatListPage();
        },
      ),
      GoRoute(
        path: '/chatRoom/:id',
        name: RouteNames.chatRoom,
        builder: (context, state) {
          return ChatRoomPage(id: state.pathParameters['id'].toString());
        },
      ),
      GoRoute(
        path: '/product',
        name: RouteNames.product,
        builder: (context, state) {
          return const ProductPage();
        },
      ),
      GoRoute(
        path: '/product/:id',
        name: RouteNames.productDetail,
        builder: (context, state) {
          return ProductCardPage(id: state.pathParameters['id'].toString());
        },
      ),
      GoRoute(
        path: '/community',
        name: RouteNames.community,
        builder: (context, state) {
          return const CommunityPage();
        },
      ),
      GoRoute(
        path: '/community/:id',
        name: RouteNames.communityDetail,
        builder: (context, state) {
          return CommunityDetailPage(id: state.pathParameters['id'].toString());
        },
      ),
    ],
    errorBuilder: (context, state) {
      return PageNotFound(errorMessage: state.error.toString());
    },
  );
}
