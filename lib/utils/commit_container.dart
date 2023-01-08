import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/commit_model.dart';

class CommitContainer extends StatelessWidget {
  String sha;
  Commit? commit;
  Stats? stats;
  CommitContainer({
    super.key,
    required this.sha,
    required this.commit,
    required this.stats,
  });

  @override
  Widget build(BuildContext context) {
    String authorName = commit!.author!.name.toString();
    String authorEmail = commit!.author!.email.toString();
    DateTime authorDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
        .parse(commit!.author!.date.toString());

    String committerName = commit!.committer!.name.toString();
    String committerEmail = commit!.committer!.email.toString();
    DateTime committerDate = new DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
        .parse(commit!.committer!.date.toString());
    //print(tempDate);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('sha: $sha'),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Author Details'),
                    const SizedBox(height: 10),
                    Text('Name - $authorName'),
                    const SizedBox(height: 3),
                    Text('E-Mail - $authorEmail'),
                    const SizedBox(height: 3),
                    Text('Date & Time - $authorDate'),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Committer Details'),
                    const SizedBox(height: 10),
                    Text('Name - $committerName'),
                    const SizedBox(height: 3),
                    Text('E-Mail - $committerEmail'),
                    const SizedBox(height: 3),
                    Text('Date & Time - $committerDate'),
                    const SizedBox(height: 3),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Statistics_Container(
                    stats_details: "Total", number: stats!.total),
                SizedBox(width: 10),
                Statistics_Container(
                    stats_details: "Additions", number: stats!.additions),
                SizedBox(width: 10),
                Statistics_Container(
                    stats_details: "Deletions", number: stats!.deletions),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Statistics_Container extends StatelessWidget {
  final number;
  String stats_details;
  Statistics_Container(
      {super.key, required this.stats_details, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(width: 1 * .5, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text('$stats_details - $number'),
    );
  }
}
