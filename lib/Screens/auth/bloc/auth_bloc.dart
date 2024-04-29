import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefa2ok/core/cache_service.dart';
import 'package:shefa2ok/core/const_text.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String gender = 'ذكر';
  late String birthday;
  late String phone;
  File? imageFile;
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        phone = convertPhoneToEmail(phoneController.text.toString());
        await signInAuth();
        print(phone);
        emit(LoginSuccess());
      } on FirebaseAuthException catch (e) {
        // print(e);
        signInError(e, emit);
      } catch (e) {
        emit(LoginFailure(errorMsg: 'Something went wrong'));
      }
    });
    on<RegisterEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        phone = convertPhoneToEmail(phoneController.text.toString());

        await signUpAuth();
        await userInfo(
          phone,
          passwordController.text.toString(),
          nameController.text.toString(),
          phoneController.text.toString(),
          birthday,
          gender,
          imageFile?.path.toString(),
        );

        emit(RegisterSuccess('Account created successfully'));
      } on FirebaseAuthException catch (e) {
        print(e);
        signUpError(e, emit);
      } catch (e) {
        emit(RegisterFailure(errorMsg: 'Something went wrong'));
      }
    });
    on<SignOutEvent>((event, emit) async {
      emit(SignOutLoading());
      try {
        signOut;
        passwordController.clear();
        nameController.clear();
        phoneController.clear();
        emit(SignOutSuccess());
      } catch (e) {
        emit(SignOutFailure(errorMsg: 'Something went wrong'));
      }
    });
  }
  void signOut(context) async {
    try {
      await FirebaseAuth.instance.signOut();

      print('User signed out successfully');
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  void signInError(FirebaseAuthException e, Emitter<AuthState> emit) {
    if (e.code == 'user-not-found') {
      emit(LoginFailure(errorMsg: 'user-not-found'));
    } else if (e.code == 'wrong-password') {
      emit(LoginFailure(errorMsg: 'wrong-password'));
    }
  }

  void signUpError(FirebaseAuthException e, Emitter<AuthState> emit) {
    if (e.code == 'weak-password') {
      emit(RegisterFailure(errorMsg: 'weak-password'));
    } else if (e.code == 'email-already-in-use') {
      emit(RegisterFailure(errorMsg: 'Account already exist'));
    } else {
      print("errrrrrrrrrrrrroooooooooooorrrrrrrrrr" + e.code);
    }
  }

  Future<void> signUpAuth() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: phone,
      password: passwordController.text.toString(),
    );
  }

  Future<void> signInAuth() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: phone,
      password: passwordController.text.toString(),
    );
    print(FirebaseAuth.instance.currentUser!.uid);
  }
}

Future<void> userInfo(
    email, password, name, phone, birthday, gender, image) async {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final currentUser = FirebaseAuth.instance.currentUser;
  if (currentUser != null) {
    await users.add({
      "Name": name,
      "Phone": phone,
      "Email": email,
      "Password": password,
      "birthday": birthday,
      "gender": gender,
      "image": image,
      "uid": currentUser.uid,
    });
    CacheService.setData(
      key: ConstText().currentUID,
      value: currentUser.uid,
    );
    CacheService.setData(
      key: ConstText().name,
      value: name,
    );
  } else {
    // Handle the case where currentUser is null
    print('Current user is null');
  }
}

String convertPhoneToEmail(String phoneNum) {
  var phone = phoneNum.split('');
  for (int i = 0; i < phone.length; i++) {
    switch (phone[i]) {
      case '0':
        phone[i] = 'A';
        break;
      case '1':
        phone[i] = 'B';
        break;
      case '2':
        phone[i] = 'C';
        break;
      case '3':
        phone[i] = 'D';
        break;
      case '4':
        phone[i] = 'E';
        break;
      case '5':
        phone[i] = 'F';
        break;
      case '6':
        phone[i] = 'G';
        break;
      case '7':
        phone[i] = 'H';
        break;
      case '8':
        phone[i] = 'I';
        break;
      case '9':
        phone[i] = 'J';
        break;
    }
  }
  phone.add('@');
  phone.add('gmail.com');
  return phone.join().toLowerCase();
}
