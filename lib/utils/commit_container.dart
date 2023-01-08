import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:urban_match_rohit/screen/task1_screen.dart';

import '../model/commit_model.dart';

class CommitContainer extends StatelessWidget {
  String sha;
  Commit? commit;
  Stats? stats;
  List<Files>? files;
  CommitContainer({
    super.key,
    required this.sha,
    required this.commit,
    required this.stats,
    required this.files,
  });

  @override
  Widget build(BuildContext context) {
    //print(files!.length);
    //print(files![0].filename.toString());
    String authorName = commit!.author!.name.toString();
    String authorEmail = commit!.author!.email.toString();
    DateTime authorDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
        .parse(commit!.author!.date.toString());

    String committerName = commit!.committer!.name.toString();
    String committerEmail = commit!.committer!.email.toString();
    DateTime committerDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
        .parse(commit!.committer!.date.toString());
    //print(tempDate);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Text('sha: $sha'),
          //const SizedBox(height: 10),
          Column(
            children: [
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

              //==============================================================================================

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
              const SizedBox(height: 10),

              //================================================================================================

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Statistics_Container(
                      stats_details: "Total", number: stats!.total),
                  const SizedBox(width: 10),
                  Statistics_Container(
                      stats_details: "Additions", number: stats!.additions),
                  const SizedBox(width: 10),
                  Statistics_Container(
                      stats_details: "Deletions", number: stats!.deletions),
                ],
              ),
            ],
          ),

          //==================================================================================================

          Column(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: files!.length,
                itemBuilder: (context, index) {
                  //print(index);
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      Files_Container(
                        fileName: files![index].filename.toString(),
                        status: files![index].status.toString(),
                        addition: files![index].additions.toString(),
                        deletion: files![index].deletions.toString(),
                        changes: files![index].changes.toString(),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),

          //=================================================================================================
        ],
      ),
    );
  }
}

class Statistics_Container extends StatelessWidget {
  final number;
  String stats_details;

  Statistics_Container({
    super.key,
    required this.stats_details,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 25,
      // width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(width: 1 * .5, color: Colors.white),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
        child: Text('$stats_details : $number'),
      ),
    );
  }
}

class Files_Container extends StatelessWidget {
  final addition, deletion, changes;
  String fileName, status;
  Files_Container({
    super.key,
    required this.fileName,
    required this.status,
    required this.addition,
    required this.deletion,
    required this.changes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              title: Text('Project: $fileName'),
              subtitle: Text('status: $status'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Statistics_Container(stats_details: 'Add', number: addition),
                Statistics_Container(stats_details: 'Del', number: deletion),
                Statistics_Container(
                    stats_details: 'Changes: ', number: changes)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
