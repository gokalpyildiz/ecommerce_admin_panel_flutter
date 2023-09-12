// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_cubit.dart';

class SplashState extends Equatable {
  const SplashState({this.isFirstInit = true});
  final bool isFirstInit;

  @override
  List<Object> get props => [isFirstInit];

  SplashState copyWith({
    bool? isFirstInit,
  }) {
    return SplashState(
      isFirstInit: isFirstInit ?? this.isFirstInit,
    );
  }
}
