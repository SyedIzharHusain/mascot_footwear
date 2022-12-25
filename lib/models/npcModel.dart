class NPC {
  String? id;
  MetaData? metaData;
  String? formName;
  List<FilledByInfos>? filledByInfos;
  List<Pages>? pages;
  Null? state;

  NPC(
      {this.id,
        this.metaData,
        this.formName,
        this.filledByInfos,
        this.pages,
        this.state});

  NPC.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    metaData = json['metaData'] != null
        ? MetaData.fromJson(json['metaData'])
        : null;
    formName = json['formName'];
    if (json['filledByInfos'] != null) {
      filledByInfos = <FilledByInfos>[];
      json['filledByInfos'].forEach((v) {
        filledByInfos!.add(FilledByInfos.fromJson(v));
      });
    }
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages!.add(Pages.fromJson(v));
      });
    }
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (metaData != null) {
      data['metaData'] = metaData!.toJson();
    }
    data['formName'] = formName;
    if (filledByInfos != null) {
      data['filledByInfos'] =
          filledByInfos!.map((v) => v.toJson()).toList();
    }
    if (pages != null) {
      data['pages'] = pages!.map((v) => v.toJson()).toList();
    }
    data['state'] = state;
    return data;
  }
}

class MetaData {
  String? createdAt;
  String? updatedAt;
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

class FilledByInfos {
  int? fieldNo;
  String? defaultValue;
  Display? display;
  Validation? validation;
  String? configId;
  List? configConditions;
  int? conditionFieldNo;
  Constraints? constraints;
  VisibilityCondition? visibilityCondition;
  bool? hidden;
  Null? moreInfo;
  List<String>? tags;
  String? casePreserve;
  Null? openAnotherForm;
  bool? required;

  FilledByInfos(
      {this.fieldNo,
        this.defaultValue,
        this.display,
        this.validation,
        this.configId,
        this.configConditions,
        this.conditionFieldNo,
        this.constraints,
        this.visibilityCondition,
        this.hidden,
        this.moreInfo,
        this.tags,
        this.casePreserve,
        this.openAnotherForm,
        this.required});

  FilledByInfos.fromJson(Map<String, dynamic> json) {
    fieldNo = json['fieldNo'];
    defaultValue = json['defaultValue'];
    display =
    json['display'] != null ? Display.fromJson(json['display']) : null;
    validation = json['validation'] != null
        ? Validation.fromJson(json['validation'])
        : null;
    configId = json['configId'];
    if (json['configConditions'] != null) {
      configConditions = <Null>[];
      json['configConditions'].forEach((v) {
        configConditions!.add((v));
      });
    }
    conditionFieldNo = json['conditionFieldNo'];
    constraints = json['constraints'] != null
        ? Constraints.fromJson(json['constraints'])
        : null;
    visibilityCondition = json['visibilityCondition'] != null
        ? VisibilityCondition.fromJson(json['visibilityCondition'])
        : null;
    hidden = json['hidden'];
    moreInfo = json['moreInfo'];
    tags = json['tags'].cast<String>();
    casePreserve = json['casePreserve'];
    openAnotherForm = json['openAnotherForm'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fieldNo'] = fieldNo;
    data['defaultValue'] = defaultValue;
    if (display != null) {
      data['display'] = display!.toJson();
    }
    if (validation != null) {
      data['validation'] = validation!.toJson();
    }
    data['configId'] = configId;
    if (configConditions != null) {
      data['configConditions'] =
          configConditions!.map((v) => v.toJson()).toList();
    }
    data['conditionFieldNo'] = conditionFieldNo;
    if (constraints != null) {
      data['constraints'] = constraints!.toJson();
    }
    if (visibilityCondition != null) {
      data['visibilityCondition'] = visibilityCondition!.toJson();
    }
    data['hidden'] = hidden;
    data['moreInfo'] = moreInfo;
    data['tags'] = tags;
    data['casePreserve'] = casePreserve;
    data['openAnotherForm'] = openAnotherForm;
    data['required'] = required;
    return data;
  }
}

class Display {
  String? tooltip;
  String? placeHolder;
  String? inputType;
  Null? className;
  Null? subLine;
  String? label;
  String? prefixText;
  String? suffixText;
  List? options;
  Null? inputBoxEnum;

  Display(
      {this.tooltip,
        this.placeHolder,
        this.inputType,
        this.className,
        this.subLine,
        this.label,
        this.prefixText,
        this.suffixText,
        this.options,
        this.inputBoxEnum});

  Display.fromJson(Map<String, dynamic> json) {
    tooltip = json['tooltip'];
    placeHolder = json['placeHolder'];
    inputType = json['inputType'];
    className = json['className'];
    subLine = json['subLine'];
    label = json['label'];
    prefixText = json['prefixText'];
    suffixText = json['suffixText'];
    if (json['options'] != null) {
      options = <Null>[];
      json['options'].forEach((v) {
        options!.add((v));
      });
    }
    inputBoxEnum = json['inputBoxEnum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tooltip'] = tooltip;
    data['placeHolder'] = placeHolder;
    data['inputType'] = inputType;
    data['className'] = className;
    data['subLine'] = subLine;
    data['label'] = label;
    data['prefixText'] = prefixText;
    data['suffixText'] = suffixText;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    data['inputBoxEnum'] = inputBoxEnum;
    return data;
  }
}

class Validation {
  int? minValue;
  int? maxValue;
  String? errorMessage;
  Null? regex;

  Validation({this.minValue, this.maxValue, this.errorMessage, this.regex});

  Validation.fromJson(Map<String, dynamic> json) {
    minValue = json['minValue'];
    maxValue = json['maxValue'];
    errorMessage = json['errorMessage'];
    regex = json['regex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['minValue'] = minValue;
    data['maxValue'] = maxValue;
    data['errorMessage'] = errorMessage;
    data['regex'] = regex;
    return data;
  }
}

class Constraints {
  int? size;
  Null? type;
  Null? valueFormatRegex;
  String? allowInputRegex;

  Constraints(
      {this.size, this.type, this.valueFormatRegex, this.allowInputRegex});

  Constraints.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    type = json['type'];
    valueFormatRegex = json['valueFormatRegex'];
    allowInputRegex = json['allowInputRegex'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['size'] = size;
    data['type'] = type;
    data['valueFormatRegex'] = valueFormatRegex;
    data['allowInputRegex'] = allowInputRegex;
    return data;
  }
}

class VisibilityCondition {
  String? visibleType;
  List<Null>? conditions;
  List<OrConditions>? orConditions;

  VisibilityCondition({this.visibleType, this.conditions, this.orConditions});

  VisibilityCondition.fromJson(Map<String, dynamic> json) {
    visibleType = json['visibleType'];
    if (json['conditions'] != null) {
      conditions = <Null>[];
      json['conditions'].forEach((v) {
        conditions!.add((v));
      });
    }
    if (json['orConditions'] != null) {
      orConditions = <OrConditions>[];
      json['orConditions'].forEach((v) {
        orConditions!.add(OrConditions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['visibleType'] = visibleType;
    if (conditions != null) {
      data['conditions'] = conditions!.map((v) => v).toList();
    }
    if (orConditions != null) {
      data['orConditions'] = orConditions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrConditions {
  int? fieldId;
  CompareWith? compareWith;

  OrConditions({this.fieldId, this.compareWith});

  OrConditions.fromJson(Map<String, dynamic> json) {
    fieldId = json['fieldId'];
    compareWith = json['compareWith'] != null
        ? CompareWith.fromJson(json['compareWith'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fieldId'] = fieldId;
    if (compareWith != null) {
      data['compareWith'] = compareWith!.toJson();
    }
    return data;
  }
}

class CompareWith {
  Null? extactValue;
  Null? minValue;
  Null? maxValue;
  String? contains;
  Null? notContains;

  CompareWith(
      {this.extactValue,
        this.minValue,
        this.maxValue,
        this.contains,
        this.notContains});

  CompareWith.fromJson(Map<String, dynamic> json) {
    extactValue = json['extactValue'];
    minValue = json['minValue'];
    maxValue = json['maxValue'];
    contains = json['contains'];
    notContains = json['notContains'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extactValue'] = extactValue;
    data['minValue'] = minValue;
    data['maxValue'] = maxValue;
    data['contains'] = contains;
    data['notContains'] = notContains;
    return data;
  }
}

class Pages {
  int? pageNo;
  List<InputWidgets>? inputWidgets;
  String? pageTitle;
  String? pageSubTitle;

  Pages({this.pageNo, this.inputWidgets, this.pageTitle, this.pageSubTitle});

  Pages.fromJson(Map<String, dynamic> json) {
    pageNo = json['pageNo'];
    if (json['inputWidgets'] != null) {
      inputWidgets = <InputWidgets>[];
      json['inputWidgets'].forEach((v) {
        inputWidgets!.add(InputWidgets.fromJson(v));
      });
    }
    pageTitle = json['pageTitle'];
    pageSubTitle = json['pageSubTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageNo'] = pageNo;
    if (inputWidgets != null) {
      data['inputWidgets'] = inputWidgets!.map((v) => v.toJson()).toList();
    }
    data['pageTitle'] = pageTitle;
    data['pageSubTitle'] = pageSubTitle;
    return data;
  }
}

class InputWidgets {
  int? widgetNo;
  HeaderQuestion? headerQuestion;
  List<Questions>? questions;
  VisibilityCondition? visibilityCondition;
  String? widgetTitle;
  String? widgetCss;
  Null? type;
  Null? table;

  InputWidgets(
      {this.widgetNo,
        this.headerQuestion,
        this.questions,
        this.visibilityCondition,
        this.widgetTitle,
        this.widgetCss,
        this.type,
        this.table});

  InputWidgets.fromJson(Map<String, dynamic> json) {
    widgetNo = json['widgetNo'];
    headerQuestion = json['headerQuestion'] != null
        ? HeaderQuestion.fromJson(json['headerQuestion'])
        : null;
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
    visibilityCondition = json['visibilityCondition'] != null
        ? VisibilityCondition.fromJson(json['visibilityCondition'])
        : null;
    widgetTitle = json['widgetTitle'];
    widgetCss = json['widgetCss'];
    type = json['type'];
    table = json['table'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['widgetNo'] = widgetNo;
    if (headerQuestion != null) {
      data['headerQuestion'] = headerQuestion!.toJson();
    }
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    if (visibilityCondition != null) {
      data['visibilityCondition'] = visibilityCondition!.toJson();
    }
    data['widgetTitle'] = widgetTitle;
    data['widgetCss'] = widgetCss;
    data['type'] = type;
    data['table'] = table;
    return data;
  }
}

class Questions {
  int? fieldNo;
  String? defaultValue;
  Display? display;
  Validation? validation;
  String? configId;
  List<Null>? configConditions;
  int? conditionFieldNo;
  Constraints? constraints;
  VisibilityCondition? visibilityCondition;
  bool? hidden;
  Null? moreInfo;
  List<String>? tags;
  Null? casePreserve;
  Null? openAnotherForm;
  bool? required;

  Questions(
      {this.fieldNo,
        this.defaultValue,
        this.display,
        this.validation,
        this.configId,
        this.configConditions,
        this.conditionFieldNo,
        this.constraints,
        this.visibilityCondition,
        this.hidden,
        this.moreInfo,
        this.tags,
        this.casePreserve,
        this.openAnotherForm,
        this.required});

  Questions.fromJson(Map<String, dynamic> json) {
    fieldNo = json['fieldNo'];
    defaultValue = json['defaultValue'];
    display =
    json['display'] != null ? Display.fromJson(json['display']) : null;
    validation = json['validation'] != null
        ? Validation.fromJson(json['validation'])
        : null;
    configId = json['configId'];
    if (json['configConditions'] != null) {
      configConditions = <Null>[];
      json['configConditions'].forEach((v) {
        configConditions!.add((v));
      });
    }
    conditionFieldNo = json['conditionFieldNo'];
    constraints = json['constraints'] != null
        ? Constraints.fromJson(json['constraints'])
        : null;
    visibilityCondition = json['visibilityCondition'] != null
        ? VisibilityCondition.fromJson(json['visibilityCondition'])
        : null;
    hidden = json['hidden'];
    moreInfo = json['moreInfo'];
    tags = json['tags'].cast<String>();
    casePreserve = json['casePreserve'];
    openAnotherForm = json['openAnotherForm'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fieldNo'] = fieldNo;
    data['defaultValue'] = defaultValue;
    if (display != null) {
      data['display'] = display!.toJson();
    }
    if (validation != null) {
      data['validation'] = validation!.toJson();
    }
    data['configId'] = configId;
    if (configConditions != null) {
      data['configConditions'] =
          configConditions!.map((v) => v).toList();
    }
    data['conditionFieldNo'] = conditionFieldNo;
    if (constraints != null) {
      data['constraints'] = constraints!.toJson();
    }
    if (visibilityCondition != null) {
      data['visibilityCondition'] = visibilityCondition!.toJson();
    }
    data['hidden'] = hidden;
    data['moreInfo'] = moreInfo;
    data['tags'] = tags;
    data['casePreserve'] = casePreserve;
    data['openAnotherForm'] = openAnotherForm;
    data['required'] = required;
    return data;
  }
}


class HeaderQuestion {
  int? fieldNo;
  Null? defaultValue;
  Display? display;
  Validation? validation;
  Null? configId;
  List<Null>? configConditions;
  int? conditionFieldNo;
  Constraints? constraints;
  VisibilityCondition? visibilityCondition;
  bool? hidden;
  Null? moreInfo;
  List<Null>? tags;
  Null? casePreserve;
  Null? openAnotherForm;
  bool? required;

  HeaderQuestion(
      {this.fieldNo,
        this.defaultValue,
        this.display,
        this.validation,
        this.configId,
        this.configConditions,
        this.conditionFieldNo,
        this.constraints,
        this.visibilityCondition,
        this.hidden,
        this.moreInfo,
        this.tags,
        this.casePreserve,
        this.openAnotherForm,
        this.required});

  HeaderQuestion.fromJson(Map<String, dynamic> json) {
    fieldNo = json['fieldNo'];
    defaultValue = json['defaultValue'];
    display =
    json['display'] != null ? Display.fromJson(json['display']) : null;
    validation = json['validation'] != null
        ? Validation.fromJson(json['validation'])
        : null;
    configId = json['configId'];
    if (json['configConditions'] != null) {
      configConditions = <Null>[];
      json['configConditions'].forEach((v) {
        configConditions!.add((v));
      });
    }
    conditionFieldNo = json['conditionFieldNo'];
    constraints = json['constraints'] != null
        ? Constraints.fromJson(json['constraints'])
        : null;
    visibilityCondition = json['visibilityCondition'] != null
        ? VisibilityCondition.fromJson(json['visibilityCondition'])
        : null;
    hidden = json['hidden'];
    moreInfo = json['moreInfo'];
    if (json['tags'] != null) {
      tags = <Null>[];
      json['tags'].forEach((v) {
        tags!.add((v));
      });
    }
    casePreserve = json['casePreserve'];
    openAnotherForm = json['openAnotherForm'];
    required = json['required'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fieldNo'] = fieldNo;
    data['defaultValue'] = defaultValue;
    if (display != null) {
      data['display'] = display!.toJson();
    }
    if (validation != null) {
      data['validation'] = validation!.toJson();
    }
    data['configId'] = configId;
    if (configConditions != null) {
      data['configConditions'] =
          configConditions!.map((v) => v).toList();
    }
    data['conditionFieldNo'] = conditionFieldNo;
    if (constraints != null) {
      data['constraints'] = constraints!.toJson();
    }
    if (visibilityCondition != null) {
      data['visibilityCondition'] = visibilityCondition!.toJson();
    }
    data['hidden'] = hidden;
    data['moreInfo'] = moreInfo;
    if (tags != null) {
      data['tags'] = tags!.map((v) => v).toList();
    }
    data['casePreserve'] = casePreserve;
    data['openAnotherForm'] = openAnotherForm;
    data['required'] = required;
    return data;
  }
}


