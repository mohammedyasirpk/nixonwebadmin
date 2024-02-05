import 'package:flutter/material.dart';
import 'package:nixon/domain/models/usermodel.dart';

import '../../../repostitory/auth.repo.dart';
import 'sign_botton.dart';

ValueNotifier<bool> circleBool = ValueNotifier(true);

class SgninLoginContainer extends StatefulWidget {
  const SgninLoginContainer({super.key});

  @override
  State<SgninLoginContainer> createState() => _SgninLoginContainerState();
}

final TextEditingController emailController = TextEditingController();

final TextEditingController passwordController = TextEditingController();

bool visibility = true;
bool circle = true;

class _SgninLoginContainerState extends State<SgninLoginContainer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(
          height: 50,
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
          obscureText: visibility,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    visibility = !visibility;
                  });
                },
                icon:
                    Icon(visibility ? Icons.visibility : Icons.visibility_off)),
            hintText: "Password",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Forgot Password"),
        const SizedBox(
          height: 50,
        ),
        ValueListenableBuilder(
          valueListenable: circleBool,
          builder: (context, value, child) {
            return SignBotton(
                isloading: value,
                fieldIsfilled: passwordController.text.isNotEmpty &&
                        emailController.text.isNotEmpty
                    ? false
                    : true,
                onTap: () {
                  var password = passwordController.text;
                  var email = emailController.text;
                  var model = UserModel(password: password, email: email);
                  AuthRepo.instance.signIn(model, context);
                  circleBool.value = false;
                },
                text: "Let Me In");
          },
        )
      ],
    );
  }
}
