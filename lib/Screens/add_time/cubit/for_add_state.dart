abstract class ForAddState {}

class ForAddInitial extends ForAddState {}

class ForAddLoading extends ForAddState {}

class ForAddSuccess extends ForAddState {
  final List response;

  ForAddSuccess(this.response);
}

class ForAddFailure extends ForAddState {
  final String errorMessage;

  ForAddFailure(this.errorMessage);
}

class AddToUserLoading extends ForAddState {}

class AddToUserSuccess extends ForAddState {
  final String response;

  AddToUserSuccess(this.response);
}

class AddToUserFailure extends ForAddState {
  final String errorMessage;

  AddToUserFailure(this.errorMessage);
}
