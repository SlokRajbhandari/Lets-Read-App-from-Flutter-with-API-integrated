class Mymodel {
  List<HomeBanners>? homeBanners;
  List<Sections>? sections;

  Mymodel({this.homeBanners, this.sections});

  Mymodel.fromJson(Map<String, dynamic> json) {
    if (json['homeBanners'] != null) {
      homeBanners = <HomeBanners>[];
      json['homeBanners'].forEach((v) {
        homeBanners!.add(new HomeBanners.fromJson(v));
      });
    }
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
  }

  get length => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeBanners != null) {
      data['homeBanners'] = this.homeBanners!.map((v) => v.toJson()).toList();
    }
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeBanners {
  String? id;
  String? primaryText;
  String? secondaryText;
  String? backgroundUrl;
  String? buttonText;
  String? buttonUrl;
  String? collectionId;
  int? priority;

  HomeBanners(
      {this.id,
      this.primaryText,
      this.secondaryText,
      this.backgroundUrl,
      this.buttonText,
      this.buttonUrl,
      this.collectionId,
      this.priority});

  HomeBanners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    primaryText = json['primaryText'];
    secondaryText = json['secondaryText'];
    backgroundUrl = json['backgroundUrl'];
    buttonText = json['buttonText'];
    buttonUrl = json['buttonUrl'];
    collectionId = json['collectionId'];
    priority = json['priority'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['primaryText'] = this.primaryText;
    data['secondaryText'] = this.secondaryText;
    data['backgroundUrl'] = this.backgroundUrl;
    data['buttonText'] = this.buttonText;
    data['buttonUrl'] = this.buttonUrl;
    data['collectionId'] = this.collectionId;
    data['priority'] = this.priority;
    return data;
  }
}

class Sections {
  String? id;
  String? type;
  String? name;
  String? displayName;
  String? image;
  List<Items>? items;

  Sections(
      {this.id,
      this.type,
      this.name,
      this.displayName,
      this.image,
      this.items});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    displayName = json['displayName'];
    image = json['image'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['displayName'] = this.displayName;
    data['image'] = this.image;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? id;
  String? name;
  String? description;
  String? thumborCoverImageUrl;
  String? coverImageUrl;
  String? coverImageServingUrl;
  String? languageId;

  Items({
    this.id,
    this.name,
    this.description,
    this.thumborCoverImageUrl,
    this.coverImageUrl,
    this.coverImageServingUrl,
    this.languageId,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumborCoverImageUrl = json['thumborCoverImageUrl'];
    coverImageUrl = json['coverImageUrl'];
    coverImageServingUrl = json['coverImageServingUrl'];
    languageId = json['languageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['thumborCoverImageUrl'] = this.thumborCoverImageUrl;
    data['coverImageUrl'] = this.coverImageUrl;
    data['coverImageServingUrl'] = this.coverImageServingUrl;
    data['languageId'] = this.languageId;

    return data;
  }
}
