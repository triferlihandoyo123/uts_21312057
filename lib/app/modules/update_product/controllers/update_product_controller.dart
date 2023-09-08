import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateMahasiswaController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cJK;
  late TextEditingController cNPM;
  late TextEditingController cProgramStudi;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);

    return docRef.get();
  }

  void updateMahasiswa(String nama, String alamat, String jk, String npm, String programStudi, String id) async {
    DocumentReference mahasiswaById = firestore.collection("mahasiswa").doc(id);

    try {
      await mahasiswaById.update({
        "nama": nama,
        "alamat": alamat,
        "jk": jk,
        "npm": npm,
        "program studi": programStudi,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil Mengubah Data Mahasiswa.",
        onConfirm: () {
          cNama.clear();
          cAlamat.clear();
          cJK.clear();
          cNPM.clear();
          cProgramStudi.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Mengubah Mahasiswa.",
      );
    }
  }

  @override
  void onInit() {
    cNama = TextEditingController();
    cAlamat = TextEditingController();
    cJK = TextEditingController();
    cNPM = TextEditingController();
    cProgramStudi = TextEditingController();
    super.onInit();
  }

  @override
  void onClosed() {
    cNama.dispose();
    cAlamat.dispose();
    cJK.dispose();
    cNPM.dispose();
    cProgramStudi.dispose();
    super.onClose();
  }
}
