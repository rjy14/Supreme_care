import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supreme_care/models/products.dart';
import 'package:supreme_care/services/auth_service.dart';

class FirestoreService{

  AuthService authService = AuthService();
  addItemToCart(name, price,image
   ){
    return FirebaseFirestore.instance
        .collection('products')
        .add({'email': authService.getCurrentUser()!.email,'name':name, 'price': price, 'image': image});
  }

  removeProduct(id){
    return FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .delete();
  }

  Future <void> addUser(email,userName, phoneNo){
    return FirebaseFirestore.instance
        .collection('users')
        .doc(email)
        .set({'userName': userName, phoneNo: phoneNo});
  }

  Stream<List<Products>> getProducts(){

    return FirebaseFirestore.instance
        .collection('products')
        .where('email', isEqualTo: authService.getCurrentUser()!.email)
        .snapshots()
        .map((snapshot)=> snapshot.docs
        .map<Products>((doc)=> Products.fromMap(doc.data(), doc.id))
        .toList());
}}
