import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final userCollection = FirebaseFirestore.instance.collection('users');
final productCollection = FirebaseFirestore.instance.collection('products');
final communityCollection = FirebaseFirestore.instance.collection('community');
final chatCollection = FirebaseFirestore.instance.collection('chat');
final fbAuth = FirebaseAuth.instance;
