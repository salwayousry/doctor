abstract class SignUpSpecialistState {}

final class SignUpSpecialistInitial extends SignUpSpecialistState {}

final class SignUpSpecialistLoading extends SignUpSpecialistState {
  final String message;

  SignUpSpecialistLoading({required this.message});
}

final class SignUpSpecialistSuccess extends SignUpSpecialistState {
  final String message;

  SignUpSpecialistSuccess({required this.message});
}

final class SignUpSpecialistFailure extends SignUpSpecialistState {
  final String errMessage;
  SignUpSpecialistFailure({required this.errMessage});
}
