// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      id: json['id'] as int,
      description: json['description'] as String?,
      author: UserModel.fromJson(json['author'] as Map<String, dynamic>),
      authorClub: json['authorClub'] as String?,
      caption: json['caption'] as String?,
      createdAt: json['createdAt'] as String?,
      postComments: json['postComments'] as List<dynamic>,
      postMedia: (json['postMedia'] as List<dynamic>)
          .map((e) => PostMediaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      postType: json['postType'] as String?,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'author': instance.author,
      'authorClub': instance.authorClub,
      'postComments': instance.postComments,
      'createdAt': instance.createdAt,
      'caption': instance.caption,
      'postMedia': instance.postMedia,
      'postType': instance.postType,
    };
