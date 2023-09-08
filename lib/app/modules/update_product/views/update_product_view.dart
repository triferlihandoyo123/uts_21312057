import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_get/app/modules/update_product/controllers/update_product_controller.dart';

class UpdateMahasiswaView extends GetView<UpdateMahasiswaController> { // Ganti dengan controller yang sesuai
  const UpdateMahasiswaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Mahasiswa'), // Ganti judul sesuai kebutuhan Anda
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
        future: controller.getData(Get.arguments),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNama.text = data['nama'];
            controller.cAlamat.text = data['alamat']; // Sesuaikan dengan field yang benar
            controller.cJK.text = data['jk']; // Sesuaikan dengan field yang benar
            controller.cNPM.text = data['npm'].toString(); // Sesuaikan dengan field yang benar
            controller.cProgramStudi.text = data['program_studi']; // Sesuaikan dengan field yang benar
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  TextField(
                    controller: controller.cNama,
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Nama Mahasiswa",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.cAlamat, // Sesuaikan dengan field yang benar
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Alamat Mahasiswa", // Sesuaikan dengan field yang benar
                    ),
                  ),
                  TextField(
                    controller: controller.cJK, // Sesuaikan dengan field yang benar
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Jenis Kelamin Mahasiswa", // Sesuaikan dengan field yang benar
                    ),
                  ),
                  TextField(
                    controller: controller.cNPM, // Sesuaikan dengan field yang benar
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "NPM Mahasiswa", // Sesuaikan dengan field yang benar
                    ),
                  ),
                  TextField(
                    controller: controller.cProgramStudi, // Sesuaikan dengan field yang benar
                    autocorrect: false,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "Program Studi Mahasiswa", // Sesuaikan dengan field yang benar
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed:()=>controller.updateMahasiswa(
                      controller.cNama.text,
                      controller.cAlamat.text, // Sesuaikan dengan field yang benar
                      controller.cJK.text, // Sesuaikan dengan field yang benar
                      controller.cNPM.text, // Sesuaikan dengan field yang benar
                      controller.cProgramStudi.text, // Sesuaikan dengan field yang benar
                      Get.arguments,
                    ),
                    child: Text("Ubah"),
                  ),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
