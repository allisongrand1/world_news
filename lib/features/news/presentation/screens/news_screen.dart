import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/news_bloc/news_events.dart';
import 'package:world_news/features/news/presentation/blocs/news_bloc/news_states.dart';
import 'package:world_news/features/news/presentation/views/news_views/news_error_view.dart';
import 'package:world_news/features/news/presentation/views/news_views/news_loading_view.dart';
import 'package:world_news/features/news/presentation/views/news_views/news_success_view.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<NewsBloc>().add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<NewsBloc>().add(LogoutEvent());
            },
            icon: Icon(Icons.logout_sharp),
          ),
        ],
      ),
      body: BlocBuilder<NewsBloc, NewsStates>(
        builder: (context, states) {
          return states.map(
            init: () => SizedBox.shrink(),
            loading: () => NewsLoadingView(),
            loaded: (state) => NewsSuccessView(news: state.news),
            error: (state) => NewsErrorView(state.error),
          );
        },
      ),
    );
  }
}
