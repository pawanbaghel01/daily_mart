import 'package:daily_mart/views/addtocart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewAddressPage extends StatelessWidget {
  const AddNewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final addressController = TextEditingController();
    final cityController = TextEditingController();
    final stateController = TextEditingController();
    final zipcodeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Add a new address"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.add_location)),
                const Text("Use current location"),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  cutomTextField("Name",nameController),
                  cutomTextField("Phone",phoneController),
                  cutomTextField("Streat address",addressController),
                  cutomTextField("City", cityController),
                  cutomTextField("State",stateController),
                  cutomTextField("ZipCode",zipcodeController),
                  const SizedBox(height: 20,),
                  ElevatedButton(onPressed: (){
                    Get.to(const AddToCartPage());
                  }, child: const Text("Save")),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cutomTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          label: Text(label),
        ),
      ),
    );
  }
}
