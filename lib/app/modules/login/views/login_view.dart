import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Image.asset('assets/images/lms-blue.png',
                    width: 300, height: 300)),
            const Text(
              'Selamat Datang di LMS',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Silahkan masuk menggunakan email dan password anda',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 25),
            Obx(() => TextField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    errorText: controller.emailError.value == ''
                        ? null
                        : controller.emailError.value,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: controller.emailError.value == ''
                            ? Colors.grey
                            : Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Email',
                  ),
                )),
            const SizedBox(height: 25),
            Obx(() => TextField(
                  controller: controller.passwordController,
                  obscureText: !controller.isShowPassword.value,
                  decoration: InputDecoration(
                    errorText: controller.passwordError.value == ''
                        ? null
                        : controller.passwordError.value,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: controller.passwordError.value == ''
                            ? Colors.grey
                            : Colors.red,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.isShowPassword.value =
                            !controller.isShowPassword.value;
                      },
                      icon: Icon(
                        controller.isShowPassword.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                )),
            const SizedBox(height: 25),
            Obx(() => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: const Color(0xFF071759),
                  ),
                  onPressed: controller.submit,
                  child: controller.isLoading.value
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : const Text('Masuk'),
                )),
          ],
        ),
      ),
    ));
  }
}
