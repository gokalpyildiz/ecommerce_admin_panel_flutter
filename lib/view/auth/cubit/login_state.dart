// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isChecked = false,
    this.loading = false,
  });
  final bool isChecked;
  final bool loading;

  @override
  List<Object> get props => [isChecked, loading];

  LoginState copyWith({
    bool? isChecked,
    bool? loading,
  }) {
    return LoginState(
      isChecked: isChecked ?? this.isChecked,
      loading: loading ?? this.loading,
    );
  }
}
