import 'package:flutter/material.dart';
import 'package:lesson36/helpers/custom_button.dart';
import 'package:lesson36/screens/profile_info_screen.dart';

import '../helpers/common_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  final bool isMan;

  const RegistrationScreen({super.key, required this.isMan});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.isMan ? "Man" : "Woman"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 37,
          right: 37,
          bottom: 43,
          top: 33,
        ),
        child: Column(
          children: [
            RegistrationCard(
              nameController: nameController,
              title: "Your name",
            ),
            SizedBox(height: 35),
            RegistrationCard(
              nameController: ageController,
              title: "Age",
            ),
            SizedBox(height: 35),
            RegistrationCard(
              nameController: imageController,
              title: "Image Url",
            ),
            Spacer(),
            CustomButton(
              title: "Next",
              onPressed: () {
                if (nameController.text.isEmpty ||
                    ageController.text.isEmpty ||
                    imageController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 3),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Заполните все поля",
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfileInfoScreen(
                        name: nameController.text,
                        age: ageController.text,
                        imageUrl: imageController.text,
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationCard extends StatelessWidget {
  const RegistrationCard({
    super.key,
    required this.nameController,
    required this.title,
  });

  final TextEditingController nameController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 36),
        CommonTextField(controller: nameController),
      ],
    );
  }
}
