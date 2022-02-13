part of 'autorisation_cubit.dart';

@immutable
class AuthorisationState {
  final User? user;
  final bool isLoading;
  final String errorMessage;

  const AuthorisationState({
    required this.user,
    required this.isLoading,
    required this.errorMessage,
  });
}
