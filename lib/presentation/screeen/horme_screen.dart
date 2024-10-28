import 'package:dio_base_work/logic/cubits/post_cubit/post_cubit.dart';
import 'package:dio_base_work/logic/cubits/post_cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoadingState) {
            return CircularProgressIndicator();
          } else if (state is PostLoadedState) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.posts[index].title ?? "nothing inside"),
                );
              },
            );
          } else if (state is PostErrorState) {
            return Container(
              child: Text(state.error),
            );
          } else {
            return Text("An error");
          }
        },
      )),
    );
  }
}
