import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq/Bloc/Register%20Screen%20Cubit/register_screen_cubit.dart';
import 'package:souq/Repos/ApiConnect.dart';
import '../../Utilities/Images.dart';
import '../../Utilities/routes.dart';
import '../Widgets/LogButton_Widget.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerNumber = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerRepeat = TextEditingController();
  bool isHidePassword = true;
  bool isHideRepeat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  decoration: BoxDecoration(
                      color: Colors.amber.shade900,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5),
                      ),
                    ),
                    Image.asset(
                      registerImage,
                      height: MediaQuery.of(context).size.height * 0.450,
                    ),
                  ],
                )
              ],
            ),
            BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: controllerName,
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Enter a valid name",
                          decoration: const InputDecoration(
                            labelText: "Enter your name",
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextFormField(
                          controller: controllerEmail,
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Enter a valid email",
                          decoration: const InputDecoration(
                            labelText: "Enter your email",
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextFormField(
                          controller: controllerNumber,
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Enter a valid number",
                          decoration: const InputDecoration(
                            labelText: "Enter your number",
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextFormField(
                          controller: controllerPassword,
                          validator: (value) => value!.length < 6
                              ? "Your password is too short "
                              : null,
                          obscureText:
                              BlocProvider.of<RegisterScreenCubit>(context)
                                  .obscurePass,
                          decoration: InputDecoration(
                              labelText: "Enter your password",
                              suffixIcon: InkWell(
                                  overlayColor: const MaterialStatePropertyAll(
                                      Colors.transparent),
                                  onTap: () {
                                    BlocProvider.of<RegisterScreenCubit>(
                                            context)
                                        .showPass();
                                  },
                                  child: Icon(
                                      BlocProvider.of<RegisterScreenCubit>(
                                                      context)
                                                  .obscurePass ==
                                              true
                                          ? Icons.visibility
                                          : Icons.visibility_off))),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        TextFormField(
                          controller: controllerRepeat,
                          validator: (value) => value != controllerPassword.text
                              ? "Password is not correct"
                              : null,
                          obscureText:
                              BlocProvider.of<RegisterScreenCubit>(context)
                                  .obscureRepeat,
                          decoration: InputDecoration(
                              labelText: "Repeat password",
                              suffixIcon: InkWell(
                                  overlayColor: const MaterialStatePropertyAll(
                                      Colors.transparent),
                                  onTap: () {
                                    BlocProvider.of<RegisterScreenCubit>(
                                            context)
                                        .showRepeat();
                                  },
                                  child: Icon(
                                      BlocProvider.of<RegisterScreenCubit>(
                                                      context)
                                                  .obscureRepeat ==
                                              true
                                          ? Icons.visibility
                                          : Icons.visibility_off))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LogButton(
                            textColor: Colors.white,
                            text: 'Sign up',
                            backgroundColor: Colors.red.shade700,
                            onPressed: () async {
                              final SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              if (_formKey.currentState!.validate()) {
                                if (controllerName.text.isNotEmpty &&
                                    controllerEmail.text.isNotEmpty &&
                                    controllerNumber.text.isNotEmpty &&
                                    controllerPassword.text.isNotEmpty &&
                                    controllerRepeat.text.isNotEmpty) {
                                  await GetRequest().registerReq(
                                      controllerName.text,
                                      controllerEmail.text,
                                      controllerNumber.text,
                                      controllerPassword.text,
                                      controllerRepeat.text);
                                  preferences.setString(
                                      "email", controllerEmail.text);
                                  Navigator.pushReplacementNamed(context, home);
                                } else {
                                  const snackBar = SnackBar(
                                    content: Text('Please check your data'),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              }
                            }),
                        const SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, login);
                          },
                          child: const Text(
                            "Already have an account ?",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
