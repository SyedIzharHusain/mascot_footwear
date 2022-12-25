class FFStructure {
  String? id;
  MetaData? metaData;
  FormRef? formRef;
  FormRef? organisationRef;
  List<Answers>? answers;
  String? submissionState;
  String? formTypeEnum;
  String? sequenceKey;
  int? conditionFieldNo;
  String? source;
  ExtraData? extraData;
  Null? filledByUserProfile;
  Null? feedbackBackRef;
  bool? submissionDone;
  String? clientTrafficId;

  FFStructure(
      {this.id,
      this.metaData,
      this.formRef,
      this.organisationRef,
      this.answers,
      this.submissionState,
      this.formTypeEnum,
      this.sequenceKey,
      this.conditionFieldNo,
      this.source,
      this.extraData,
      this.filledByUserProfile,
      this.feedbackBackRef,
      this.submissionDone,
      this.clientTrafficId});

  FFStructure.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    metaData =
        json['metaData'] != null ? MetaData.fromJson(json['metaData']) : null;
    formRef =
        json['formRef'] != null ? FormRef.fromJson(json['formRef']) : null;
    organisationRef = json['organisationRef'] != null
        ? FormRef.fromJson(json['organisationRef'])
        : null;
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(Answers.fromJson(v));
      });
    }
    submissionState = json['submissionState'];
    formTypeEnum = json['formTypeEnum'];
    sequenceKey = json['sequenceKey'];
    conditionFieldNo = json['conditionFieldNo'];
    source = json['source'];
    extraData = json['extraData'] != null
        ? ExtraData.fromJson(json['extraData'])
        : null;
    filledByUserProfile = json['filledByUserProfile'];
    feedbackBackRef = json['feedbackBackRef'];
    submissionDone = json['submissionDone'];
    clientTrafficId = json['clientTrafficId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (metaData != null) {
      data['metaData'] = metaData!.toJson();
    }
    if (formRef != null) {
      data['formRef'] = formRef!.toJson();
    }
    if (organisationRef != null) {
      data['organisationRef'] = organisationRef!.toJson();
    }
    if (answers != null) {
      data['answers'] = answers!.map((v) => v.toJson()).toList();
    }
    data['submissionState'] = submissionState;
    data['formTypeEnum'] = formTypeEnum;
    data['sequenceKey'] = sequenceKey;
    data['conditionFieldNo'] = conditionFieldNo;
    data['source'] = source;
    if (extraData != null) {
      data['extraData'] = extraData!.toJson();
    }
    data['filledByUserProfile'] = filledByUserProfile;
    data['feedbackBackRef'] = feedbackBackRef;
    data['submissionDone'] = submissionDone;
    data['clientTrafficId'] = clientTrafficId;
    return data;
  }
}

class MetaData {
  String? createdAt;
  Null? updatedAt;
  int? version;
  String? state;

  MetaData({this.createdAt, this.updatedAt, this.version, this.state});

  MetaData.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['version'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['version'] = version;
    data['state'] = state;
    return data;
  }
}

class FormRef {
  String? id;
  String? name;

  FormRef({this.id, this.name});

  FormRef.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Answers {
  int? fieldNo;
  String? value;
  String? type;
  String? label;
  String? casePreserve;
  int? parentWidgetNo;
  String? altValue;
  String? configId;

  Answers(
      {this.fieldNo,
      this.value,
      this.type,
      this.label,
      this.casePreserve,
      this.parentWidgetNo,
      this.altValue,
      this.configId});

  Answers.fromJson(Map<String, dynamic> json) {
    fieldNo = json['fieldNo'];
    value = json['value'];
    type = json['type'];
    label = json['label'];
    casePreserve = json['casePreserve'];
    parentWidgetNo = json['parentWidgetNo'];
    altValue = json['altValue'];
    configId = json['configId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fieldNo'] = fieldNo;
    data['value'] = value;
    data['type'] = type;
    data['label'] = label;
    data['casePreserve'] = casePreserve;
    data['parentWidgetNo'] = parentWidgetNo;
    data['altValue'] = altValue;
    data['configId'] = configId;
    return data;
  }
}

class ExtraData {
  ExtraData();

  ExtraData.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
