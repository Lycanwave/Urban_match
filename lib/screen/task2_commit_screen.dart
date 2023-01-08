import 'package:flutter/material.dart';
import 'package:urban_match_rohit/model/commit_model.dart';
import 'package:urban_match_rohit/services/state_service.dart';

import '../utils/commit_container.dart';

class Commit_Page extends StatelessWidget {
  String baseUrl;
  Commit_Page({super.key, required this.baseUrl});

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Commit Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<CommitStateModel>(
              future: stateServices.fetch_Commit_Data(baseUrl),
              builder: (context, AsyncSnapshot<CommitStateModel> snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return CommitContainer(
                          sha: snapshot.data!.sha.toString(),
                          commit: snapshot.data!.commit,
                          stats: snapshot.data!.stats,
                          files: snapshot.data!.files,
                        );
                      });
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
