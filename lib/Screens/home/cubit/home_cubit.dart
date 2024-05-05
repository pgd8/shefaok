import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shefa2ok/core/consts/const_text.dart';
import 'package:shefa2ok/core/services/cache_service.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  Future<void> deleteItemFromList(String itemId, String itemTime) async {
    try {
      // Get the current user's UID
      String currentUID = CacheService.getData(key: ConstText().currentUID);

      // Query for the document containing the user's UID
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: currentUID)
          .get();

      // Get the document reference
      DocumentReference documentReference = querySnapshot.docs.first.reference;

      // Get the current list from the document
      var data = querySnapshot.docs.first.data() as Map<String, dynamic>;

      List<dynamic> currentList = data['userMedicine'];

      // Remove the item from the list based on the itemId
      currentList.removeWhere(
          (item) => item['medicine'] == itemId && item['time'] == itemTime);
      print(currentList);
      // Update the document with the modified list
      await documentReference.update({'userMedicine': currentList});
      emit(const HomeSuccess(message: 'Item deleted successfully'));
      print('Item deleted from list successfully');
    } catch (e) {
      emit(const HomeFailure(message: 'Something went wrong'));
      print('Error deleting item from list: $e');
    }
  }

  
}
