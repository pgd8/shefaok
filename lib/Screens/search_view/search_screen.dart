import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> suggestions = [];
  List<String> suggestionsLoc = [];
  List<dynamic> interactions = [];
  List<dynamic> nonInteractions = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                _getSuggestions(value);
              },
              decoration: const InputDecoration(
                hintText: 'Search Medicine',
              ),
            ),
          ),
          suggestions.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    itemCount: suggestions.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () async {
                          if (nonInteractions.contains(suggestions[index])) {
                            await successDialog();
                          } else if (interactions
                              .contains(suggestions[index])) {
                            await failedDialog();
                          }
                        },
                        child: ListTile(
                          title: Text(suggestions[index]),
                          // Add onTap functionality to navigate or perform other actions
                        ),
                      );
                    },
                  ),
                )
              : const Text('لا يوجد بيانات في الوقت الحالي'),
        ],
      ),
    );
  }

  Future<void> _getSuggestions(String query) async {
    // Clear previous suggestions
    setState(() {
      suggestions.clear();
    });
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('medicine')
        .doc('interactionSearch')
        .get();
    var data = snapshot.data() as Map<String, dynamic>;
    if (data['interactionSearch'] != null) {
      interactions = data['interactionSearch'];
      for (var interaction in interactions) {
        if (interaction.toLowerCase().contains(query.toLowerCase())) {
          setState(() {
            suggestions.add('$interaction');
            suggestionsLoc.add('Found in interactionSearch');
          });
        }
      }
    }
    DocumentSnapshot snapshot2 = await FirebaseFirestore.instance
        .collection('medicine')
        .doc(' nonInteractionSearch')
        .get();
    if (snapshot2.exists) {
      var data2 = snapshot2.data() as Map<String, dynamic>;

      if (data2['nonInteractionSearch'] != null) {
        nonInteractions = data2['nonInteractionSearch'];
        for (var nonInteraction in nonInteractions) {
          if (nonInteraction.toLowerCase().contains(query.toLowerCase())) {
            setState(() {
              suggestions.add('$nonInteraction');
              suggestionsLoc.add('Found in nonInteractionSearch');
            });
          }
        }
      }
    }
  }

  Future successDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            // Make dialog background transparent
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.1), // Slightly visible background
                  ),
                ),
                AlertDialog(
                  surfaceTintColor: Colors.white,
                  insetPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.38,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(
                        top: 20.h, bottom: 18.h, left: 8.w, right: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/done.png",
                          height: 100.r,
                          width: 100.r,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "!تهنئة",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "العلاج مناسب",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15.sp),
                        ),
                        const Spacer(),
                        TextButton(
                          child: Container(
                            height: 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: const Color(0xff87cdce),
                            ),
                            child: Center(
                              child: Text(
                                "الرجوع",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  Future failedDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            insetPadding: EdgeInsets.zero,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            // Make dialog background transparent
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.1), // Slightly visible background
                  ),
                ),
                AlertDialog(
                  surfaceTintColor: Colors.white,
                  insetPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.38,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(
                        top: 20.h, bottom: 18.h, left: 8.w, right: 8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/failed.png",
                          height: 100.r,
                          width: 100.r,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Text(
                          "! للأسف",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          "العلاج غير مناسب",
                          style: TextStyle(
                              color: Colors.grey.shade600, fontSize: 15.sp),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextButton(
                                child: Container(
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: const Color(0xff87cdce),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "الرجوع",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
