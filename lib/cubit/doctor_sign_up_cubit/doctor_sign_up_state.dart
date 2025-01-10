
abstract class SignUpStateState {}
final class SignUpInitial extends SignUpStateState {}
final class SignUpLoading extends SignUpStateState {}
final class SignUpSuccess extends SignUpStateState {
  final String message;

  SignUpSuccess({required this.message});
}
final class SignUpFailure extends SignUpStateState {
  final String errMessage;
  SignUpFailure({required this.errMessage});
}
