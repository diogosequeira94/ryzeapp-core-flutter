import 'package:firebaseblocryze/features/bottom_navigation_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:firebaseblocryze/features/explore/presentation/widgets/incomplete_profile_banner.dart';
import 'package:firebaseblocryze/features/home_page/presentation/blocs/jobs_bloc.dart';
import 'package:firebaseblocryze/features/home_page/presentation/pages/job/job_detail_page.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/home_page/widgets.dart';
import 'package:firebaseblocryze/features/home_page/presentation/widgets/shared/job_card_item.dart';
import 'package:firebaseblocryze/repository/job_posts/models/job_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/categories_horizontal_list.dart';
import 'widgets/no_results_found_widget.dart';

class ExploreOverviewPage extends StatefulWidget {
  ExploreOverviewPage({Key key}) : super(key: key);

  @override
  _ExploreOverviewPageState createState() => _ExploreOverviewPageState();
}

class _ExploreOverviewPageState extends State<ExploreOverviewPage> {
  @override
  Widget build(BuildContext context) {
    final _bottomNavBloc = context.watch<BottomNavigationBarBloc>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          iconTheme: Theme.of(context).iconTheme,
          title: Text('Explore',
              style: TextStyle(
                  color: Theme.of(context).textTheme.headline6.color)),
          actions: [
            BlocBuilder<JobsBloc, JobsState>(builder: (context, state) {
              if (state is JobsFetchSuccess) {
                return IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: ExploreModuleSearch(state.jobsList));
                  },
                  icon: Icon(Icons.search),
                );
              } else {
                return SizedBox.shrink();
              }
            }),
            IconButton(
              onPressed: () {
                _bottomNavBloc.add(BottomNavigationExploreMapPressed());
              },
              icon: Icon(Icons.map_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
            child:
                BlocConsumer<JobsBloc, JobsState>(listener: (context, state) {
          if (state is JobApplicationSuccess) {
            Future.delayed(const Duration(milliseconds: 750), () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Your application was submitted.'),
                duration: const Duration(milliseconds: 1250),
              ));
            });
          }
        }, builder: (context, state) {
          if (state is JobsFetchSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IncompleteProfileBanner(showAlert: true),
                _jobCategoriesSection(state.jobsList),
                _allJobPosts(state.jobsList, context),
              ],
            );
          } else if (state is JobsFetchInProgress) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IncompleteProfileBanner(showAlert: true),
                Expanded(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                )),
              ],
            );
          } else if (state is JobsFetchFailure) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IncompleteProfileBanner(showAlert: true),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 14.0),
                    child: Text('Oops something went wrong')),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                IncompleteProfileBanner(showAlert: true),
                Expanded(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).accentColor,
                )),
              ],
            );
          }
        })) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _jobCategoriesSection(List<JobPost> allJobsMock) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomePageSectionHeader(
          title: 'Job Categories',
        ),
        Container(
            height: 100.0, child: CategoriesHorizontalListWidget(allJobsMock)),
      ],
    );
  }

  Widget _allJobPosts(List<JobPost> allJobsMock, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
            child: Text('${allJobsMock.length.toString()} Jobs found'),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: allJobsMock.length,
            itemBuilder: (context, index) {
              final jobPost = allJobsMock[index];
              return JobCardItem(jobPost);
            },
          ),
        ],
      ),
    );
  }
}

class ExploreModuleSearch extends SearchDelegate {
  JobPost selectedJob;
  final List<JobPost> jobsList;
  ExploreModuleSearch(this.jobsList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
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
        ? resultsList.clear()
        : resultsList.addAll(jobsList.where(
            (element) =>
                element.title.toUpperCase().contains(query) ||
                element.title.toLowerCase().contains(query),
          ));

    return resultsList.length == 0
        ? NoResultsFound()
        : ListView.builder(
            itemCount: resultsList.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(resultsList[index].imageUrl,
                          width: 50, height: 50, fit: BoxFit.cover)),
                  title: Text(resultsList[index].title),
                  subtitle: Text(resultsList[index].city),
                  trailing: Text(resultsList[index].hourRate),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => JobDetailPage(
                                  jobPost: resultsList[index],
                                )));
                  },
                ),
              );
            },
          );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<JobPost> suggestionList = [];
    query.isEmpty
        ? suggestionList.clear()
        : suggestionList.addAll(jobsList.where(
            (element) =>
                element.title.toUpperCase().contains(query) ||
                element.title.toLowerCase().contains(query),
          ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(suggestionList[index].imageUrl,
                    width: 50, height: 50, fit: BoxFit.cover)),
            title: Text(suggestionList[index].title),
            subtitle: Text(suggestionList[index].city),
            trailing: Text(suggestionList[index].hourRate),
            onTap: () {
              selectedJob = suggestionList[index];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => JobDetailPage(
                            jobPost: suggestionList[index],
                          )));
            },
          ),
        );
      },
    );
  }
}
