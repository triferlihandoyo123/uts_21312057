import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_get/app/modules/add_product/controllers/add_product_controller.dart';


class AddMahasiswaController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cAlamat;
  late TextEditingController cJK;
  late TextEditingController cNPM;
  late TextEditingController cProgramStudi;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addMahasiswa(String nama, String alamat, String jk, String npm, String programStudi) async {
    CollectionReference mahasiswa = firestore.collection("mahasiswa");
    try {
      await mahasiswa.add({
        "nama": nama,
        "alamat": alamat,
        "jk": jk,
        "npm": npm,
        "program_studi": programStudi,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data",
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
        middleText: "Gagal menyimpan data Mahasiswa.",
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
  void onClose() {
    cNama.dispose();
    cAlamat.dispose();
    cJK.dispose();
    cNPM.dispose();
    cProgramStudi.dispose();
    super.onClose();
  }
}
