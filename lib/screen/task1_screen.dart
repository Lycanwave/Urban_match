import 'package:flutter/material.dart';
import 'package:urban_match_rohit/model/git_model.dart';
import 'package:urban_match_rohit/services/state_service.dart';

class FirstTask extends StatefulWidget {
  const FirstTask({super.key});

  @override
  State<FirstTask> createState() => _FirstTaskState();
}

class _FirstTaskState extends State<FirstTask> {
  @override
  Widget build(BuildContext context) {
    StateServices statesServices = StateServices();
    return Scaffold(
      appBar: AppBar(
        title: Text('Github Repository'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: statesServices.fetch_Git_State_Record(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  print(snapshot.error.toString());
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
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
                              title: snapshot.data![item]['name'],
                              isPrivate: snapshot.data![item]['private'],
                              profileImage: snapshot.data![item]['owner']
                                      ['avatar_url']
                                  .toString(),
                              forks: snapshot.data![item]['forks'].toString(),
                              //profileImage: snapshot.data![item]['owner'],
                            ),
                            width: MediaQuery.of(context).size.width,
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
  String title, profileImage, forks;
  bool isPrivate;

  Listtile(
      {super.key,
      required this.title,
      required this.isPrivate,
      required this.profileImage,
      required this.forks});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //tileColor: Colors.amberAccent,
      trailing: Container(
        alignment: Alignment.center,
        height: 20,
        width: 50,
        //color: Colors.black,
        child: Text(isPrivate ? "private" : "public"),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.white54),
            //color: Colors.red,
            borderRadius: BorderRadius.circular(40)),
      ),
      title: Text(title),
      subtitle: Text('Forks - $forks'),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profileImage),
      ),
    );
  }
}
