import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shefa2ok/Screens/add_time/cubit/for_add_state.dart';
import 'package:shefa2ok/core/consts/const_text.dart';
import 'package:shefa2ok/core/services/cache_service.dart';

class ForAddCubit extends Cubit<ForAddState> {
  ForAddCubit() : super(ForAddInitial());

  Future<void> fetchMedicineData() async {
    emit(ForAddLoading());
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('medicine')
          .doc('addMedicine')
          .get();

      var data = snapshot.data() as Map<String, dynamic>;

      List<dynamic> medicineList = data['forAddMedicine'];

      emit(ForAddSuccess(medicineList));
    } catch (e) {
      print('Error fetching medicine data: $e');
      ForAddFailure('There is no Data right now');
    }
  }

  Future<void> addMedicineToUser(Map<String, dynamic> mapToAdd) async {
    emit(AddToUserLoading());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid',
              isEqualTo: CacheService.getData(key: ConstText().currentUID))
          .get();
      DocumentReference documentReference = querySnapshot.docs.first.reference;
      var data = querySnapshot.docs.first.data() as Map<String, dynamic>;

      List<dynamic> currentList = data['userMedicine'];

      currentList.add(mapToAdd);

      await documentReference.update({'userMedicine': currentList});
      emit(AddToUserSuccess('Medicine added successfully'));
      print(
          'Map added to list successfully for user with UID: ${CacheService.getData(key: ConstText().currentUID)}');
    } catch (e) {
      print('Error adding map to list: $e');
      AddToUserFailure('Something went wrong');
    }
  }
}
