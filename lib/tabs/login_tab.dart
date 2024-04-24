import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var phone = TextEditingController();
  var password = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: const InkWell(
            child: CircleAvatar(
              backgroundColor: Color(0xffF4F2F4),
              child: Icon(
                Icons.arrow_downward_outlined,
                color: Color(0xff86191D),
              ),
            ),
          ),
          backgroundColor: const Color(0xffFFFFFF),
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100),
                  const Text(
                    'أهلا بعودتك',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'تسجيل الدخول للمتابعة',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      '',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: phone,
                    cursorColor: const Color(0xff86CDD1),
                    decoration: InputDecoration(
                      hintText: 'رقم الهاتف',
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      focusColor: const Color(0xff86CDD1),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xff86CDD1),
                          width: 2,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xff86191D),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: password,
                    obscureText: !isPasswordVisible,
                    cursorColor: const Color(0xff86CDD1),
                    decoration: InputDecoration(
                      hintText: 'كلمة المرور',
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(
                          isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      focusColor: const Color(0xff86CDD1),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xff86CDD1),
                          width: 2,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Color(0xff86191D),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'هل نسيت كلمة السر ؟',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff86191D),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    onPressed: () {},
                    color: const Color(0xff86CDD1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child:  const Text(
                      'تسجيل الدخول',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
