import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/Screens/Home_Screen/home_screen.dart';
import 'package:shefa2ok/Screens/auth/bloc/auth_bloc.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Account/Create_Accout_Components/phone_num_field.dart';
import 'package:shefa2ok/core/cache_service.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  late final AuthBloc bloc;
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
        } else if (state is LoginSuccess) {
          CacheService.setData(key: 'authed', value: true);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          BotToast.showText(
            text: state.errorMsg!,
          );
        }
      },
      builder: (context, state) {
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
                  GestureDetector(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        bloc.add(LoginEvent());
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: MyTheme.primaryColor,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                            child: Text(
                          'تم',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.04.sh,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
