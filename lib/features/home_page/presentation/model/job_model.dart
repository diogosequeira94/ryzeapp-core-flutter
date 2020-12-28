import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class JobPostModel extends Equatable {
  final String title;
  final String description;
  final String imageUrl;
  final String city;
  final String hourRate;
  final bool isRemote;
  final int slotsAvailable;
  final List<String> languages;

  const JobPostModel({
    @required this.title,
    @required this.description,
    @required this.imageUrl,
    @required this.city,
    @required this.hourRate,
    this.isRemote,
    @required this.slotsAvailable,
    @required this.languages,
  });

  @override
  List<Object> get props => [
    title,
    description,
    imageUrl,
    city,
    hourRate,
    isRemote,
    slotsAvailable,
    languages,
  ];
}
