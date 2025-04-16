import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_bloc.dart';
import 'package:world_news/features/news/presentation/blocs/detail_news_bloc/detail_news_events.dart';

class DetailNewsScreen extends StatefulWidget {
  final String id;

  const DetailNewsScreen({super.key, required this.id});

  @override
  State<DetailNewsScreen> createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  @override
  void initState() {
    super.initState();

    context.read<DetailNewsBloc>().add(DetailNewsEvent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: Center(child: Text(widget.id)));
  }
}
