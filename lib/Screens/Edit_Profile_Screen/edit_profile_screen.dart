// ignore_for_file: use_key_in_widget_constructors
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefa2ok/Screens/auth/bloc/auth_bloc.dart';
import 'package:shefa2ok/Screens/auth/widgets/add_image.dart';
import 'package:shefa2ok/Screens/auth/widgets/birthdate_field.dart';
import 'package:shefa2ok/Screens/auth/widgets/gender_field.dart';
import 'package:shefa2ok/Screens/auth/widgets/name_field.dart';
import 'package:shefa2ok/Screens/auth/widgets/phone_num_field.dart';
import 'package:shefa2ok/Screens/auth/widgets/screen_title.dart';
import 'package:shefa2ok/Screens/tabs/tab_view.dart';
import 'package:shefa2ok/core/consts/const_text.dart';
import 'package:shefa2ok/core/shared_widgets/button_builder.dart';

class EditProfileScreen extends StatefulWidget {
  static const String routeName = "Edit Profile";

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  final TextEditingController nameController =
      TextEditingController(text: ConstText().name);
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(390, 844));
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const TabView(
                          index: 3,
                        )));
          },
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                CreateAccountScreenTitle(),
                SizedBox(
                  height: 0.02.sh,
                ),
                const AddImage(),
                SizedBox(
                  height: 0.02.sh,
                ),
                NameField(
                  controller: BlocProvider.of<AuthBloc>(context).nameController,
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
                PasswordField(
                    controller:
                        BlocProvider.of<AuthBloc>(context).passwordController),
                SizedBox(
                  height: 0.15.sh,
                ),
                BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is EditProfileLoading) {
                      isLoading = true;
                    } else if (state is EditProfileSuccess) {
                      isLoading = false;
                      BotToast.showText(text: state.msg!);
                      Navigator.pop(context);
                    } else if (state is EditProfileFailure) {
                      isLoading = false;
                      BotToast.showText(text: state.errorMsg!);
                    } else {
                      isLoading = false;
                      BotToast.showText(text: 'Something went wrong');
                    }
                  },
                  child: ButtonBuilder(
                    text: 'تعديل حساب',
                    ontap: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context)
                            .add(EditProfileEvent());
                      }
                    },
                    isLoading: isLoading,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
