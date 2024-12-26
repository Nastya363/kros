import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/domain/repository/inside_top_news/inside_top_news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/di/di.dart';
//import 'package:flutter_application_1/app/widgets/article_card.dart';
//import 'package:flutter_application_1/domain/repository/top_news/top_news_repository.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';

part "details_event.dart";
part "details_state.dart";
class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
final InsideTopNewsRepository insideTopNewsRepository;

DetailsBloc(this.insideTopNewsRepository) : super(DetailsInitial()) {
on<DetailsLoad>(_detailLoad);
}

Future<void> _detailLoad(event, emit) async {

if (state is DetailsLoadSuccess) {
  return;}
emit(DetailsLoadInProgress());
try{
  int index = 0;
final articles = await insideTopNewsRepository.getTopNews(index);
emit(DetailsLoadSuccess(
selectedArticle : articles,
));
} catch (exception) {
emit(DetailsLoadFailure(exception: exception));
talker.handle(exception);
} finally {
event.completer?.complete();
}
}
@override
void onError(Object error, StackTrace stackTrace) {
super.onError(error, stackTrace);
talker.handle(error, stackTrace);
}
}