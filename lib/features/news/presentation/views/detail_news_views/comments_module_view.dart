import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_events.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_states.dart';
import 'package:world_news/features/news/presentation/blocs/news_bloc/news_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/news_bloc/news_events.dart';

class CommentsModuleView extends StatefulWidget {
  final int id;

  const CommentsModuleView({super.key, required this.id});

  @override
  State<CommentsModuleView> createState() => _CommentsModuleViewState();
}

class _CommentsModuleViewState extends State<CommentsModuleView> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<DetailNewsBloc, DetailNewsStates>(
      listenWhen: (previous, current) => previous.comments != current.comments,
      listener: (context, state) {
        context.read<NewsBloc>().add(GetNewsEvent());
      },
      buildWhen: (previous, current) => previous.comments != current.comments,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(thickness: 1),
            Padding(
              padding: const EdgeInsets.only(bottom: 32, top: 16),
              child: Text('Comments', style: textTheme.bodyLarge),
            ),
            if (state.comments.isEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: Text('Здесь пока нет комментариев, но вы можете оставить', style: textTheme.bodyMedium),
              ),
            if (state.comments.isNotEmpty)
              ListView.builder(
                itemCount: state.comments.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  final comment = state.comments[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Icon(Icons.account_circle_sharp, color: Colors.grey[400]),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment.name,
                                style: textTheme.bodySmall,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(comment.comment, style: textTheme.bodyMedium!.copyWith(color: Colors.black)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(DateFormat('d.MM.y').format(comment.createdAt), style: textTheme.labelMedium),
                      ],
                    ),
                  );
                },
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'Add a comment...',
                  filled: true,
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      context.read<DetailNewsBloc>().add(CommentNewsEvent(id: widget.id, comment: controller.text));
                    },
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
