import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
 late TextEditingController cNama;
 late TextEditingController cHarga;
 FirebaseFirestore firestore=FirebaseFirestore.instance;

 void addProduct(String nama, String harga)async{
  CollectionReference products = firestore.collection("product");
  try {
    await products.add({
      "name": nama,
      "price":harga,
    });
    Get.defaultDialog(
      title: "Berhasil",
      middleText: "Berhasil menyimpan data",
      onConfirm: (){
        cNama.clear();
        cHarga.clear();
        Get.back();
        Get.back();
textConfirm:
"OK";
      }
    );
    
  } catch (e) {
    
  }
 }

 @override
  void onInit() {
    // TODO: implement onInit
    cNama=TextEditingController();
    cHarga=TextEditingController();
    super.onInit();
  }
  @override
  void onClose() {
    cNama.dispose();
    cHarga.dispose();
    super.onClose();

    // TODO: implement onClose
    super.onClose();
  }

}
