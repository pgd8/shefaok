// ignore_for_file: use_key_in_widget_constructors
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/Screens/Home_Screen/home_screen.dart';
import 'package:shefa2ok/Screens/auth/bloc/auth_bloc.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Account/Create_Accout_Components/add_image.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Account/Create_Accout_Components/birthdate_field.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Account/Create_Accout_Components/gender_field.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Account/Create_Accout_Components/name_field.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Account/Create_Accout_Components/phone_num_field.dart';
import 'package:shefa2ok/Screens/auth/view/Create_Account/Create_Accout_Components/screen_title.dart';
import 'package:shefa2ok/core/cache_service.dart';

class CreateAccountScreen extends StatefulWidget {
  static const String routeName = "Create Account";

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          CacheService.setData(key: 'authed', value: true);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ));

          isLoading = false;
        } else if (state is RegisterFailure) {
          isLoading = false;
          BotToast.showText(
            text: state.errorMsg!,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 4, bottom: 8),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CreateAccountScreenTitle(),
                      const AddImage(),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      NameField(
                        controller: bloc.nameController,
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      PhoneNumField(
                        controller: bloc.phoneController,
                      ),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      const BirthDateField(),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      GenderField(),
                      SizedBox(
                        height: 0.02.sh,
                      ),
                      PasswordField(controller: bloc.passwordController),
                      SizedBox(
                        height: 0.04.sh,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            bloc.add(RegisterEvent());
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
