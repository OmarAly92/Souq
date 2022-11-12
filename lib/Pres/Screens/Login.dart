import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souq/Bloc/Login%20Screen%20Cubit/login_screen_cubit.dart';
import 'package:souq/Repos/ApiConnect.dart';
import '../../Utilities/Images.dart';
import '../../Utilities/routes.dart';
import '../Widgets/LogButton_Widget.dart';

class Login extends StatelessWidget {
  Login({
    Key? key,
  }) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

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
                      height: 60,
                    ),
                    const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5),
                      ),
                    ),
                    Image.asset(
                      loginImage,
                      height: MediaQuery.of(context).size.height * 0.450,
                    ),
                  ],
                ),
              ],
            ),
            BlocBuilder<LoginScreenCubit, LoginScreenState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _controllerEmail,
                          validator: (value) =>
                              value!.isNotEmpty ? null : "Enter a valid email",
                          decoration: const InputDecoration(
                            labelText: "Enter your email",
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _controllerPassword,
                          validator: (value) => value!.length < 6
                              ? "Your password is too short"
                              : null,
                          obscureText:
                              BlocProvider.of<LoginScreenCubit>(context)
                                  .obscure,
                          decoration: InputDecoration(
                              labelText: "Enter your password",
                              suffixIcon: InkWell(
                                  overlayColor: const MaterialStatePropertyAll(
                                      Colors.transparent),
                                  onTap: () {
                                    BlocProvider.of<LoginScreenCubit>(context)
                                        .log();
                                  },
                                  child: Icon(
                                      BlocProvider.of<LoginScreenCubit>(context)
                                              .obscure
                                          ? Icons.visibility
                                          : Icons.visibility_off))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        LogButton(
                            textColor: Colors.white,
                            text: 'Login',
                            backgroundColor: Colors.red.shade700,
                            onPressed: () async {
                              final SharedPreferences preferences =
                                  await SharedPreferences.getInstance();
                              if (_formKey.currentState!.validate()) {
                                if (_controllerEmail.text.isNotEmpty &&
                                    _controllerPassword.text.isNotEmpty) {
                                  await GetRequest().loginReq(
                                      _controllerEmail.text,
                                      _controllerPassword.text);
                                  preferences.setString(
                                      "key", _controllerEmail.text);
                                  Navigator.pushReplacementNamed(context, home);
                                }
                              }
                            }),
                        const SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "Forget your password?",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                            "------------------------or------------------------"),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 100,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, register);
                          },
                          child: const Text(
                            "Don't have an account?",
                            style:
                                TextStyle(color: Colors.black54, fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

// class LoginForm extends StatelessWidget {
//   LoginForm({super.key});
//
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPassword = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 30),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 12,
//             ),
//             TextFormField(
//               keyboardType: TextInputType.emailAddress,
//               controller: _controllerEmail,
//               validator: (value) =>
//                   value!.isNotEmpty ? null : "Enter a valid email",
//               decoration: const InputDecoration(
//                 labelText: "Enter your email",
//               ),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             TextFormField(
//               keyboardType: TextInputType.visiblePassword,
//               controller: _controllerPassword,
//               validator: (value) =>
//                   value!.length < 6 ? "Your password is too short" : null,
//               obscureText: BlocProvider.of<LoginScreenCubit>(context).obscure,
//               decoration: InputDecoration(
//                   labelText: "Enter your password",
//                   suffixIcon: InkWell(
//                       overlayColor:
//                           const MaterialStatePropertyAll(Colors.transparent),
//                       onTap: () {
//                         BlocProvider.of<LoginScreenCubit>(context).log();
//                       },
//                       child: Icon(
//                           BlocProvider.of<LoginScreenCubit>(context).obscure
//                               ? Icons.visibility
//                               : Icons.visibility_off))),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             LogButton(
//                 textColor: Colors.white,
//                 text: 'Login',
//                 backgroundColor: Colors.red.shade700,
//                 onPressed: () async {
//                   final SharedPreferences preferences =
//                       await SharedPreferences.getInstance();
//                   if (_formKey.currentState!.validate()) {
//                     if (_controllerEmail.text.isNotEmpty &&
//                         _controllerPassword.text.isNotEmpty) {
//                       await GetRequest().loginReq(
//                           _controllerEmail.text, _controllerPassword.text);
//                       preferences.setString("email", _controllerEmail.text);
//                       Navigator.pushReplacementNamed(context, home);
//                     }
//                   }
//                 }),
//             const SizedBox(
//               height: 5,
//             ),
//             TextButton(
//               onPressed: () {},
//               child: const Text(
//                 "Forget your password?",
//                 style: TextStyle(color: Colors.black54, fontSize: 17),
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             const Text("------------------------or------------------------"),
//             SizedBox(
//               height: MediaQuery.of(context).size.height / 100,
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pushReplacementNamed(context, register);
//               },
//               child: const Text(
//                 "Don't have an account?",
//                 style: TextStyle(color: Colors.black54, fontSize: 17),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
