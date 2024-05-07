import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' as intll;
import 'package:shefa2ok/My_App/my_theme.dart';
import 'package:shefa2ok/Screens/home/cubit/home_cubit.dart';
import 'package:shefa2ok/core/consts/const_text.dart';
import 'package:shefa2ok/core/services/cache_service.dart';
import 'package:shefa2ok/core/services/firebase_api.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text(
                        'أهلا ',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        '${CacheService.getData(key: ConstText().name)}',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 37, 108, 111)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'العلاجات',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 37, 108, 111)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // ElevatedButton(onPressed: () {NotificationHelper.schedueledNotification(
                  //           'title', 'body');}, child: Text('schedule')),
                  medicineList()
                ],
              ),
            ),
          )),
    );
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> medicineList() {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('uid',
                isEqualTo: CacheService.getData(key: ConstText().currentUID))
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); // Display a loading indicator while waiting for data
          }

          if (snapshot.hasError) {
            return const Text(
                'Something went wrong try again later'); // Display an error message if there's an error
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            List<dynamic> medicineList =
                snapshot.data!.docs.first.data()['userMedicine'];
            medicineList.sort((a, b) {
              // Assuming 'time' is a string in the format 'HH:MM AM/PM'
              var timeA = intll.DateFormat("hh:mm a").parse(a['time']);
              var timeB = intll.DateFormat("hh:mm a").parse(b['time']);
              return timeA.compareTo(timeB);
            });
            if (medicineList.isNotEmpty &&
                CacheService.getData(key: ConstText().currentUID) != null) {
              for (var medicine in medicineList) {
                handleFCMMessage(medicine);
              }
            }
            // var currentTime = DateTime.now();
            // Sorting the medicine list
            // Separating future times and past times

            print(medicineList);
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: medicineContainer(medicineList[index]['medicine'],
                        medicineList[index]['time'], context, index),
                  );
                },
                itemCount: medicineList.length,
              ),
            );
          }
          if (snapshot.data!.docs.first.data()['userMedicine'] == [] ||
              snapshot.data!.docs.first.data()['userMedicine'] == null ||
              snapshot.data!.docs.first.data()['userMedicine'].isEmpty) {
            return const Text(
              'No data available',
              style: TextStyle(fontSize: 40),
            );
          }
          return const Text(
            'No data available',
            style: TextStyle(fontSize: 40),
          );
        });
  }

  Directionality medicineContainer(medicine, time, context, index) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: MyTheme.primaryColor)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    medicine, //'اسم العلاج',
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 37, 108, 111)),
                  ),
                  BlocListener<HomeCubit, HomeState>(
                    listener: (context, state) {
                      if (state is HomeSuccess) {
                        BotToast.showText(text: state.message);
                      } else if (state is HomeFailure) {
                        BotToast.showText(text: state.message);
                      }
                    },
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<HomeCubit>(context)
                            .deleteItemFromList(medicine, time);
                        // setState(() {});
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                        color: Color.fromARGB(255, 37, 108, 111),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                  color: MyTheme.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(time),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
