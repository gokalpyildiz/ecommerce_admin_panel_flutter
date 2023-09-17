// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'left_bar_cubit.dart';

class LeftBarState extends Equatable {
  const LeftBarState({this.setState = false});
  final bool setState;

  @override
  List<Object> get props => [setState];

  LeftBarState copyWith({
    bool? setState,
  }) {
    return LeftBarState(
      setState: setState ?? this.setState,
    );
  }
}
