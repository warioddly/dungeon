


class ProjectModel {

  final String title;
  final String description;
  final String url;
  final String? git;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.url,
    this.git,
  });


  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      title: json['title'] ?? "Project Name",
      description: json['description'] ?? "Project Description",
      url: json['url'] ?? "Project Url",
      git: json['git']
    );
  }

}