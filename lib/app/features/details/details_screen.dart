import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/features/details/blocs/details_bloc.dart';
import 'package:flutter_application_1/app/widgets/article_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_application_1/di/di.dart';
import 'package:flutter_application_1/domain/repository/model/article.dart';
import 'package:flutter_application_1/domain/repository/inside_top_news/inside_top_news_repository.dart';
import 'package:flutter_application_1/app/widgets/error_card.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailsScreen> {
  final _detailBloc = DetailsBloc(getIt<InsideTopNewsRepository>());

  @override
  void initState() {
    _detailBloc.add(const DetailsLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Детали новостей'),
        ),
        body: BlocBuilder<DetailsBloc, DetailsState>(
          bloc: _detailBloc,
          builder: (context, state) {
            if (state is DetailsLoadInProgress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DetailsLoadSuccess) {
              Article article = state.selectedArticle; // Получаем первую статью
              return SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Новость',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 20), // Отступ между заголовком и статьей
                    ArticleScreen(article: article), // Передаем только одну статью
                  ],
                ),
              );
            }
            if (state is DetailsLoadFailure) {
              return ErrorCard(
                title: 'Ошибка',
                description: state.exception.toString(),
                onReload: () {
                  _detailBloc.add(const DetailsLoad());
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

 

 

