part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeSuccess extends HomeState {
  final String message;

  const HomeSuccess({required this.message});
}

class HomeFailure extends HomeState {
  final String message;

  const HomeFailure({required this.message});
}
