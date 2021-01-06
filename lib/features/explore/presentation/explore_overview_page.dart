import 'package:firebaseblocryze/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/model/job_post_dummy.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job_detail_page.dart';
import 'package:firebaseblocryze/features/login/utils/login_strings.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExploreOverviewPage extends StatefulWidget {
  ExploreOverviewPage({Key key}) : super(key: key);
  final List<String> list = List.generate(10, (index) => "Text $index");

  @override
  _ExploreOverviewPageState createState() => _ExploreOverviewPageState();
}

class _ExploreOverviewPageState extends State<ExploreOverviewPage> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    final _bottomNavBloc = context.watch<BottomNavigationBarBloc>();
    final allJobsMock = DUMMY_ALL_JOBS.map((job) {
      return JobPost(
          jobID: job.jobID,
          title: job.title,
          description: job.description,
          hourRate: job.hourRate,
          imageUrl: job.imageUrl,
          city: job.city,
          isRemote: job.isRemote,
          slotsAvailable: job.slotsAvailable,
          languages: job.languages);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('Explore', style: TextStyle(color: Colors.black)),
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: Search(allJobsMock));
              },
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {
                _bottomNavBloc.add(BottomNavigationExploreMapPressed());
              },
              icon: Icon(Icons.map_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: _allJobPosts(allJobsMock,
                context)) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _allJobPosts(List<JobPost> allJobsMock, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: allJobsMock.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(allJobsMock[index].imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover)),
              title: Text(allJobsMock[index].title),
              subtitle: Text(allJobsMock[index].city),
              trailing: Text(allJobsMock[index].hourRate),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => JobDetailPage(
                              jobPost: allJobsMock[index],
                            )));
              },
            ),
          );
        },
      ),
    );
  }
}

class Search extends SearchDelegate {
  String selectedResult;
  final List<JobPost> jobsList;
  Search(this.jobsList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<JobPost> resultsList = [];
    query.isEmpty
        ? resultsList = []
        : resultsList.addAll(jobsList.where(
            (element) => element.title.contains(query),
          ));

    return ListView.builder(
      itemCount: resultsList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.asset(LoginStrings.appLogoPath),
            title: Text(jobsList[index].title),
            subtitle: Text(jobsList[index].city),
            trailing: Text(jobsList[index].hourRate),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JobDetailPage(
                            jobPost: jobsList[index],
                          )));
            },
          ),
        );
      },
    );
  }

  List<JobPost> recentList = [];
  @override
  Widget buildSuggestions(BuildContext context) {
    List<JobPost> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(jobsList.where(
            (element) => element.title.contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: Image.asset(LoginStrings.appLogoPath),
            title: Text(jobsList[index].title),
            subtitle: Text(jobsList[index].city),
            trailing: Text(jobsList[index].hourRate),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JobDetailPage(
                            jobPost: jobsList[index],
                          )));
            },
          ),
        );
      },
    );
  }
}
