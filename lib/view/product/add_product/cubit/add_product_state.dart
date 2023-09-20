part of 'add_product_cubit.dart';

class AddProductState extends Equatable {
  const AddProductState({this.files});
  final List<PlatformFile?>? files;

  @override
  List<Object?> get props => [files];

  AddProductState copyWith({
    List<PlatformFile?>? files,
  }) {
    return AddProductState(
      files: files ?? this.files,
    );
  }
}
