import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/Screens/tabs/tab_view.dart';
import 'package:shefa2ok/Screens/auth/bloc/auth_bloc.dart';
import 'package:shefa2ok/Screens/auth/widgets/phone_num_field.dart';
import 'package:shefa2ok/core/services/cache_service.dart';
import 'package:shefa2ok/core/consts/const_text.dart';
import 'package:shefa2ok/core/shared_widgets/button_builder.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  late final AuthBloc bloc;
  bool isLoading = false;
  @override
  void initState() {
    bloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is LoginSuccess) {
          CacheService.setData(key: ConstText().authed, value: true);
          isLoading = false;
          setState(() {});
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TabView(),
              ));
          BotToast.showText(text: 'Signed in Successfully');
        } else if (state is LoginFailure) {
          isLoading = false;
          BotToast.showText(
            text: state.errorMsg ?? 'There was a problem',
          );
          setState(() {});
        }
        // else {
        //   isLoading = false;
        //   // BotToast.showText(
        //   //   text: 'Signed in Failure',
        //   // );
        //   setState(() {});
        // }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginWidget(),
                    ButtonBuilder(
                      text: 'تسجيل الدخول',
                      ontap: () {
                        if (formKey.currentState!.validate()) {
                          bloc.add(LoginEvent());
                        }
                      },
                      isLoading: bloc.isLoading,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is LoginSuccess) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginWidget(),
                    ButtonBuilder(
                      text: 'تسجيل الدخول',
                      ontap: () {
                        if (formKey.currentState!.validate()) {
                          bloc.add(LoginEvent());
                        }
                      },
                      isLoading: bloc.isLoading,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is LoginFailure) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginWidget(),
                    ButtonBuilder(
                      text: 'تسجيل الدخول',
                      ontap: () {
                        if (formKey.currentState!.validate()) {
                          bloc.add(LoginEvent());
                        }
                      },
                      isLoading: false,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    loginWidget(),
                    ButtonBuilder(
                      text: 'تسجيل الدخول',
                      ontap: () {
                        if (formKey.currentState!.validate()) {
                          bloc.add(LoginEvent());
                        }
                      },
                      isLoading: bloc.isLoading,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Column loginWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'اهلا بعودتك',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        PhoneNumField(
          controller: bloc.phoneController,
        ),
        SizedBox(
          height: 0.02.sh,
        ),
        PasswordField(
          controller: bloc.passwordController,
        ),
        SizedBox(
          height: 0.04.sh,
        ),
        SizedBox(
          height: 0.04.sh,
        ),
      ],
    );
  }
}
