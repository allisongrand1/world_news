import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_events.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_states.dart';
import 'package:world_news/features/news/presentation/views/detail_news_views/comments_module_view.dart';
import 'package:world_news/features/news/presentation/views/detail_news_views/detail_info_module_view.dart';

class DetailNewsScreen extends StatefulWidget {
  final bool scrollToComment;
  final int id;

  const DetailNewsScreen({super.key, required this.id, this.scrollToComment = false});

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  late final ScrollController scrollController;
  final GlobalKey key = GlobalKey();

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();

    context.read<DetailNewsBloc>().add(DetailNewsEvent(id: widget.id));

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.scrollToComment) {
        final context = key.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(context, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<DetailNewsBloc, DetailNewsStates>(
        builder: (context, state) {
          final news = state.detailNews;

          return ListView(
            padding: const EdgeInsets.all(16),
            controller: scrollController,
            children: [DetailInfoModuleView(news: news), CommentsModuleView(key: key, id: news.id)],
          );
        },
      ),
    );
  }
}
