import 'package:flutter/material.dart';
import 'package:urban_match_rohit/model/git_model.dart';
import 'package:urban_match_rohit/screen/task2_commit_screen.dart';
import 'package:urban_match_rohit/services/state_service.dart';

class SecondTask extends StatefulWidget {
  const SecondTask({super.key});

  @override
  State<SecondTask> createState() => _SecondTaskState();
}

class _SecondTaskState extends State<SecondTask> {
  @override
  Widget build(BuildContext context) {
    StateServices statesServices = StateServices();
    return Scaffold(
      appBar: AppBar(
        title: Text('Commit Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: statesServices.fetch_Git_Last_Commit(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  print(snapshot.error.toString());
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Commit_Page(
                                        baseUrl: snapshot.data![item]['url']
                                            .toString(),
                                      )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 37, 36, 36),
                                  // border:
                                  //     Border.all(width: 1, color: Colors.white54),
                                  //color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),

                              height: 100,
                              // ignore: sort_child_properties_last
                              child: Listtile(
                                title: snapshot.data![item]['sha'].toString(),
                                url: snapshot.data![item]['url'].toString(),

                                //profileImage: snapshot.data![item]['owner'],
                              ),
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Listtile extends StatelessWidget {
  String title, url;
  //bool isPrivate;

  Listtile({
    super.key,
    required this.title,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //tileColor: Colors.amberAccent,

      title: Text(title),
      subtitle: Text(url),
    );
  }
}