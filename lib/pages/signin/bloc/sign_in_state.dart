class SignInState {
  const SignInState({
    this.email = "",
    this.password = "",
  });

  final String email;
  final String password;

  SignInState copyWith({
    //optional named parameter
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
