import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../domain/models/usermodel.dart';
import '../../../repostitory/auth.repo.dart';
import 'sign_botton.dart';
import 'signin_container.dart';

class SignoutContainer extends StatefulWidget {
  const SignoutContainer({Key? key});

  @override
  State<SignoutContainer> createState() => _SgninLoginContainerState();
}

class _SgninLoginContainerState extends State<SignoutContainer> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordContriller =
      TextEditingController();

  bool visibility = true;

  void showError(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Adjust the value as needed
      ),
        content: Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (value) {
            setState(() {});
          },
          controller: nameController,
          decoration: const InputDecoration(
            hintText: "Name",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            FilteringTextInputFormatter.digitsOnly
          ],
          onChanged: (value) {
            setState(() {});
          },
          controller: phoneController,
          decoration: const InputDecoration(
            hintText: "phone",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (value) {
            setState(() {});
          },
          controller: emailController,
          decoration: const InputDecoration(
            hintText: "Email",
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextField(
          onChanged: (value) {
            setState(() {});
          },
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: "Password",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          onChanged: (value) {
            setState(() {});
          },
          controller: confirmPasswordContriller,
          obscureText: false,
          decoration: const InputDecoration(
            hintText: "Confirm Password",
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ValueListenableBuilder(
          valueListenable: circleBool,
          builder: (context, value, child) {
            return SignBotton(
              isloading: value,
              fieldIsfilled: passwordController.text.isNotEmpty &&
                      emailController.text.isNotEmpty &&
                      nameController.text.isNotEmpty &&
                      phoneController.text.isNotEmpty &&
                      confirmPasswordContriller.text.isNotEmpty
                  ? false
                  : true,
              onTap: () {
                var name = nameController.text;
                var phone = phoneController.text;
                var email = emailController.text;
                var password = passwordController.text;
                var confirmPassword = confirmPasswordContriller.text;


                if (email.isEmpty || password.isEmpty || phone.isEmpty || confirmPassword.isEmpty) {
                  showError("Please Enter All Details", context);
                  return;
                }
                if (phone.length < 10) {
                  showError("Enter minimum 10 digits", context);
                  return;
                }
                if (password == confirmPassword) {
                  final model = UserModel(
                      name: name,
                      phoneNo: phone,
                      email: email,
                      password: password);
                  AuthRepo.instance.signUp(model, context);
                  circleBool.value = false;
                } else {
                  showError("Passwords Are Not Matched", context);
                }
              },
              text: "Let's Go",
            );
          },
        )
      ],
    );
  }
}
