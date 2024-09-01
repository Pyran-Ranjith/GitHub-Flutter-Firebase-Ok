import 'package:flutter_firebase_modal/firebasebloc/application/features/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter_firebase_modal/firebasebloc/application/features/auth/models/user_model.dart';
import 'package:flutter_firebase_modal/firebasebloc/application/features/auth/widgets/customtextformfiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPageWrapper extends StatelessWidget {
  const RegisterPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authbloc = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Authenticated) {
        WidgetsBinding.instance.addPostFrameCallback((_) {

          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        });
      }

      return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: const Color(0xfff263147),
          ),
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: double.infinity,
              width: double.infinity,
              child: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Register with Email",
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                            controller: _emailController,
                            hintText: "Enter Email"),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                            obscureText: true,
                            controller: _passwordController,
                            hintText: "Enter Password"),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                            controller: _nameController,
                            hintText: "Enter Name"),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomTextFormField(
                            controller: _phoneController,
                            hintText: "Enter Phone"),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkResponse(
                          onTap: () {
                            UserModel user = UserModel(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                phone: _phoneController.text);

                            authbloc.add(SignupEvent(user: user));
                          },
                          child: Container(
                            height: 52,
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.orange),
                            child: Center(
                              child: Text(
                                "Register",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an Account?",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Login",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )));
    });
  }
}
