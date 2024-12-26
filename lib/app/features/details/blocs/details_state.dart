part of "details_bloc.dart";
sealed class DetailsState extends Equatable {
const DetailsState();
@override
List<Object> get props => [];

  get firstArticle => null;

  get exception => null;
}
final class DetailsInitial extends DetailsState {}
final class DetailsLoadInProgress extends DetailsState {}
final class DetailsLoadSuccess extends DetailsState {
const DetailsLoadSuccess({
 required this.selectedArticle,
});
final Article selectedArticle;
@override
List<Object> get props => [selectedArticle];
}
final class DetailsLoadFailure extends DetailsState {
const DetailsLoadFailure({
required this.exception,
});
@override
  final Object? exception;
@override
List<Object> get props => [];
}