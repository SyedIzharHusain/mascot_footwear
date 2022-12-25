
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';


class UserData extends GetxController {


  final userData = GetStorage('user');


  String get getUserToken => (userData.read('userToken')) ?? '';

  Map<String, dynamic> get getUserData => userData.read('userData') ?? {};

  String get getUserName => userData.read('userName') ?? '';

  String get getUserEmail => userData.read('userEmail') ?? '';

  String get getUserCompany => userData.read('userCompany') ?? '';

  String get getUserIndustry => userData.read('userIndustry') ?? '';

  String get getUserRole => userData.read('userRole') ?? '';


  set updateUserName(String val) {
    userName.value = val;
    update();
  }


  RxString userName = ''.obs;


  // String get getUserEmail => getUserData.isNotEmpty ? getUserData['email'].toString():'';
  // String get getUserName => userName.value;
  // String get getCompanyName => getUserData.isNotEmpty ? getUserData['companyName'].toString():'';
  // String get getRole => getUserData.isNotEmpty ? getUserData['role'].toString():'';
  // String get getIndustryName => getUserData.isNotEmpty ? getUserData['industryName'].toString():'';
  bool get getUserGoogleAuth =>
      getUserData.isNotEmpty ? getUserData['isGoogleAuth'] : false;

  bool get getUserIsVerified =>
      getUserData.isNotEmpty ? getUserData['isVerified'] : false;

  String get getVerifiedAt =>
      getUserData.isNotEmpty ? getUserData['verifiedAt'].toString() : '';

  String get getLastLoginAt =>
      getUserData.isNotEmpty ? getUserData['lastLoginAt'].toString() : '';

  String get getCreatedAt =>
      getUserData.isNotEmpty ? getUserData['createdAt'].toString() : '';

  String get getIat =>
      getUserData.isNotEmpty ? getUserData['iat'].toString() : '';

  String get getExp =>
      getUserData.isNotEmpty ? getUserData['exp'].toString() : '';

  String get getUserId =>
      getUserData.isNotEmpty ? getUserData['_id'].toString() : '';


  addToken(String val) async {
    await userData.write('userToken', val);
    update();
  }

  addUserData(Map val) async {
    await userData.write('userData', val);
    update();
  }

  addUserName(String val) async {
    await userData.write('userName', val);
    update();
  }

  addUserEmail(String val) async {
    await userData.write('userEmail', val);
    update();
  }

  addUserCompany(String val) async {
    await userData.write('userCompany', val);
    update();
  }

  addUserIndustry(String val) async {
    await userData.write('userIndustry', val);
    update();
  }

  addUserRole(String val) async {
    await userData.write('userRole', val);
    update();
  }

  removeUserData() async {
    await userData.remove('userData');
    await userData.remove('userToken');
    await userData.remove('userName');
    await userData.remove('userEmail');
    await userData.remove('userCompany');
    await userData.remove('userIndustry');
    await userData.remove('userRole');
  }


  Map demoData =
  {
    "id": "97b8f0b7-7695-43d7-bea0-127778ef0e97",
    "metaData": {
      "createdAt": "2022-03-17T11:07:44+0000",
      "updatedAt": "2022-10-21T08:52:38+0000",
      "version": 183,
      "state": "ACTIVE"
    },
    "formName": "Scholarship Estimator",
    "filledByInfos": [
      {
        "fieldNo": 1,
        "defaultValue": "",
        "display": {
          "tooltip": "First Name",
          "placeHolder": "First Name",
          "inputType": "TEXT",
          "className": "",
          "subLine": null,
          "label": "First Name",
          "prefixText": "",
          "suffixText": "",
          "options": [],
          "inputBoxEnum": null
        },
        "validation": {
          "minValue": 1,
          "maxValue": 50,
          "errorMessage": "This field can not be blank",
          "regex": null
        },
        "configId": "",
        "configConditions": [],
        "conditionFieldNo": 0,
        "constraints": {
          "size": 0,
          "type": null,
          "valueFormatRegex": null,
          "allowInputRegex": "[^a-zA-Z ]"
        },
        "visibilityCondition": {
          "visibleType": null,
          "conditions": [],
          "orConditions": []
        },
        "hidden": false,
        "moreInfo": null,
        "tags": [],
        "casePreserve": "FALSE",
        "openAnotherForm": null,
        "required": true
      },
      {
        "fieldNo": 2,
        "defaultValue": "",
        "display": {
          "tooltip": "Last Name",
          "placeHolder": "Last Name",
          "inputType": "TEXT",
          "className": "se-row flex lg:flex-row flex-col justify-beetween content-center items-left lg:items-center relative",
          "subLine": null,
          "label": "Last Name",
          "prefixText": "",
          "suffixText": "",
          "options": [],
          "inputBoxEnum": null
        },
        "validation": {
          "minValue": 0,
          "maxValue": 50,
          "errorMessage": "Last name can not be blank",
          "regex": null
        },
        "configId": "",
        "configConditions": [],
        "conditionFieldNo": 0,
        "constraints": {
          "size": 0,
          "type": "0",
          "valueFormatRegex": null,
          "allowInputRegex": "[^a-zA-Z ]"
        },
        "visibilityCondition": {
          "visibleType": null,
          "conditions": [],
          "orConditions": []
        },
        "hidden": false,
        "moreInfo": null,
        "tags": [],
        "casePreserve": "FALSE",
        "openAnotherForm": null,
        "required": false
      },
      {
        "fieldNo": 235,
          "defaultValue": "freshman",
        "display": {
          "tooltip": "Student Type",
          "placeHolder": "Select",
          "inputType": "SINGLE_SELECT_CHECKBOX",
          "className": "se-checkbox flex lg:flex-row flex-col justify-beetween content-center items-left lg:items-center relative",
          "subLine": null,
          "label": "Student Type",
          "prefixText": "",
          "suffixText": "",
          "options": [],
          "inputBoxEnum": null
        },
        "validation": {
          "minValue": 0,
          "maxValue": 0,
          "errorMessage": "",
          "regex": null
        },
        "configId": "studentType",
        "configConditions": [],
        "conditionFieldNo": 0,
        "constraints": {
          "size": 0,
          "type": null,
          "valueFormatRegex": null,
          "allowInputRegex": null
        },
        "visibilityCondition": {
          "visibleType": null,
          "conditions": [],
          "orConditions": []
        },
        "hidden": false,
        "moreInfo": null,
        "tags": [],
        "casePreserve": null,
        "openAnotherForm": null,
        "required": true
      },
      {
        "fieldNo": 30,
        "defaultValue": null,
        "display": {
          "tooltip": "High School Name",
          "placeHolder": "High School Name",
          "inputType": "AUTO_COMPLETE",
          "className": "school flex lg:flex-row flex-col justify-beetween content-center items-left lg:items-center relative",
          "subLine": null,
          "label": "High School Name",
          "prefixText": "",
          "suffixText": "",
          "options": [],
          "inputBoxEnum": null
        },
        "validation": {
          "minValue": 0,
          "maxValue": 0,
          "errorMessage": "This field can not be blank",
          "regex": null
        },
        "configId": "high_school",
        "configConditions": [],
        "conditionFieldNo": 0,
        "constraints": {
          "size": 0,
          "type": null,
          "valueFormatRegex": null,
          "allowInputRegex": "[^a-zA-Z0-9&-/, ]*"
        },
        "visibilityCondition": {
          "visibleType": "SHOWN",
          "conditions": [
            {
              "fieldId": 235,
              "compareWith": {
                "extactValue": "freshman",
                "minValue": null,
                "maxValue": null,
                "contains": null,
                "notContains": null
              }
            }
          ],
          "orConditions": []
        },
        "hidden": false,
        "moreInfo": null,
        "tags": [],
        "casePreserve": null,
        "openAnotherForm": null,
        "required": true
      },
      {
        "fieldNo": 279,
        "defaultValue": null,
        "display": {
          "tooltip": "Enter your last attended college name",
          "placeHolder": "Last College Attended",
          "inputType": "AUTO_COMPLETE",
          "className": "school flex lg:flex-row flex-col justify-beetween content-center items-left lg:items-center relative",
          "subLine": null,
          "label": "Last College Attended",
          "prefixText": "",
          "suffixText": "",
          "options": [],
          "inputBoxEnum": null
        },
        "validation": {
          "minValue": 0,
          "maxValue": 0,
          "errorMessage": "This field can not be blank",
          "regex": null
        },
        "configId": "college_index",
        "configConditions": [],
        "conditionFieldNo": 0,
        "constraints": {
          "size": 0,
          "type": null,
          "valueFormatRegex": null,
          "allowInputRegex": null
        },
        "visibilityCondition": {
          "visibleType": "SHOWN",
          "conditions": [
            {
              "fieldId": 235,
              "compareWith": {
                "extactValue": "transfer",
                "minValue": null,
                "maxValue": null,
                "contains": null,
                "notContains": null
              }
            }
          ],
          "orConditions": []
        },
        "hidden": false,
        "moreInfo": null,
        "tags": [],
        "casePreserve": null,
        "openAnotherForm": null,
        "required": true
      },
      {
        "fieldNo": 6,
        "defaultValue": "il",
        "display": {
          "tooltip": "Legal State of Residency",
          "placeHolder": "Select State",
          "inputType": "DROPDOWN",
          "className": "flex lg:flex-row flex-col justify-beetween content-center items-left lg:items-center relative",
          "subLine": null,
          "label": "Legal State of Residency",
          "prefixText": "",
          "suffixText": "",
          "options": [],
          "inputBoxEnum": null
        },
        "validation": {
          "minValue": 0,
          "maxValue": 0,
          "errorMessage": "",
          "regex": null
        },
        "configId": "state",
        "configConditions": [],
        "conditionFieldNo": 0,
        "constraints": {
          "size": 0,
          "type": null,
          "valueFormatRegex": null,
          "allowInputRegex": null
        },
        "visibilityCondition": {
          "visibleType": null,
          "conditions": [],
          "orConditions": []
        },
        "hidden": false,
        "moreInfo": null,
        "tags": [],
        "casePreserve": null,
        "openAnotherForm": null,
        "required": false
      }
    ],
    "pages": [
      {
        "pageNo": 1,
        "inputWidgets": [
          {
            "widgetNo": 1,
            "headerQuestion": {
              "fieldNo": 0,
              "defaultValue": null,
              "display": {
                "tooltip": "",
                "placeHolder": "",
                "inputType": "HEADING",
                "className": null,
                "subLine": null,
                "label": "",
                "prefixText": null,
                "suffixText": null,
                "options": [],
                "inputBoxEnum": null
              },
              "validation": null,
              "configId": null,
              "configConditions": [],
              "conditionFieldNo": 0,
              "constraints": null,
              "visibilityCondition": null,
              "hidden": false,
              "moreInfo": null,
              "tags": [],
              "casePreserve": null,
              "openAnotherForm": null,
              "required": false
            },
            "questions": [
              {
                "fieldNo": 266,
                "defaultValue": "4",
                "display": {
                  "tooltip": "Select GPA scale",
                  "placeHolder": "Select GPA scale",
                  "inputType": "DROPDOWN",
                  "className": "lg:pb-6",
                  "subLine": null,
                  "label": "GPA Scale",
                  "prefixText": "",
                  "suffixText": "",
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": "",
                  "regex": null
                },
                "configId": "gpaScaleOutOf4",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": null,
                  "conditions": [],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": true
              },
              {
                "fieldNo": 31,
                "defaultValue": null,
                "display": {
                  "tooltip": "GPA (on a scale of 4)",
                  "placeHolder": "GPA",
                  "inputType": "NUMBER",
                  "className": "lg:pb-3",
                  "subLine": "(Scale of 4)",
                  "label": "GPA",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 1,
                  "maxValue": 4,
                  "errorMessage": "Invalid input",
                  "regex": null
                },
                "configId": "",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 10,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": "^(\d.?\d{0,2})\d*\$"
                },
                "visibilityCondition": {
                  "visibleType": "SHOWN",
                  "conditions": [
                    {
                      "fieldId": 235,
                      "compareWith": {
                        "extactValue": "freshman",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    },
                    {
                      "fieldId": 266,
                      "compareWith": {
                        "extactValue": "4",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": true
              },
              {
                "fieldNo": 270,
                "defaultValue": null,
                "display": {
                  "tooltip": "Cumulative GPA (on a scale of 4)",
                  "placeHolder": "Cumulative GPA",
                  "inputType": "NUMBER",
                  "className": "lg:pb-3",
                  "subLine": "(Scale of 4)",
                  "label": "Cumulative GPA",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 1,
                  "maxValue": 4,
                  "errorMessage": "Invalid input",
                  "regex": null
                },
                "configId": "",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": "^(\d+.?\d{0,2})\d*\$"
                },
                "visibilityCondition": {
                  "visibleType": "SHOWN",
                  "conditions": [
                    {
                      "fieldId": 235,
                      "compareWith": {
                        "extactValue": "transfer",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    },
                    {
                      "fieldId": 266,
                      "compareWith": {
                        "extactValue": "4",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": true
              },
              {
                "fieldNo": 20028,
                "defaultValue": "yes",
                "display": {
                  "tooltip": "Do you plan to apply as a test optional student?",
                  "placeHolder": "Select",
                  "inputType": "DROPDOWN",
                  "className": "",
                  "subLine": null,
                  "label": "Do you plan to apply as a test optional student?",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": "This is a required field",
                  "regex": null
                },
                "configId": "confirm",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": "SHOWN",
                  "conditions": [
                    {
                      "fieldId": 235,
                      "compareWith": {
                        "extactValue": "freshman",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": true
              },
              {
                "fieldNo": 202,
                "defaultValue": "",
                "display": {
                  "tooltip": "ACT",
                  "placeHolder": "ACT",
                  "inputType": "NUMBER",
                  "className": "",
                  "subLine": "(between 18 and 36)",
                  "label": "ACT",
                  "prefixText": "",
                  "suffixText": "",
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 18,
                  "maxValue": 36,
                  "errorMessage": "Invalid input",
                  "regex": null
                },
                "configId": "",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 10,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": "^(\d+.?\d{0,2})\d*\$"
                },
                "visibilityCondition": {
                  "visibleType": "SHOWN",
                  "conditions": [
                    {
                      "fieldId": 20028,
                      "compareWith": {
                        "extactValue": "no",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": false
              },
              {
                "fieldNo": 201,
                "defaultValue": "",
                "display": {
                  "tooltip": "SAT",
                  "placeHolder": "SAT",
                  "inputType": "NUMBER",
                  "className": "",
                  "subLine": "(between 400 and 1600)",
                  "label": "SAT",
                  "prefixText": "",
                  "suffixText": "",
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 400,
                  "maxValue": 1600,
                  "errorMessage": "Invalid input",
                  "regex": null
                },
                "configId": "",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 10,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": "^(\d+.?\d{0,2})\d*\$"
                },
                "visibilityCondition": {
                  "visibleType": "SHOWN",
                  "conditions": [
                    {
                      "fieldId": 20028,
                      "compareWith": {
                        "extactValue": "no",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": false
              },
              {
                "fieldNo": 245,
                "defaultValue": null,
                "display": {
                  "tooltip": "Desired housing option",
                  "placeHolder": "Select",
                  "inputType": "DROPDOWN",
                  "className": "col-span-2 cols-ac",
                  "subLine": null,
                  "label": "Desired housing option",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": null,
                  "regex": null
                },
                "configId": "desiredHousingOptions",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": null,
                  "conditions": [],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [
                  "others"
                ],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": true
              },
              {
                "fieldNo": 20029,
                "defaultValue": "no",
                "display": {
                  "tooltip": "Is your permanent residence more than 50 miles from AU main campus?",
                  "placeHolder": "Select",
                  "inputType": "DROPDOWN",
                  "className": "col-span-2 cols-ac",
                  "subLine": null,
                  "label": "Is your permanent residence more than 50 miles from AU main campus?",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": null,
                  "regex": null
                },
                "configId": "confirm",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": null,
                  "conditions": [],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [
                  "others"
                ],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": false
              }
            ],
            "visibilityCondition": {
              "visibleType": null,
              "conditions": [],
              "orConditions": []
            },
            "widgetTitle": null,
            "widgetCss": null,
            "type": null,
            "table": null
          },
          {
            "widgetNo": 2,
            "headerQuestion": {
              "fieldNo": 0,
              "defaultValue": null,
              "display": {
                "tooltip": "",
                "placeHolder": "",
                "inputType": "HEADING",
                "className": null,
                "subLine": null,
                "label": "",
                "prefixText": null,
                "suffixText": null,
                "options": [],
                "inputBoxEnum": null
              },
              "validation": null,
              "configId": null,
              "configConditions": [],
              "conditionFieldNo": 0,
              "constraints": null,
              "visibilityCondition": null,
              "hidden": false,
              "moreInfo": null,
              "tags": [],
              "casePreserve": null,
              "openAnotherForm": null,
              "required": false
            },
            "questions": [
              {
                "fieldNo": 20006,
                "defaultValue": "no",
                "display": {
                  "tooltip": "Do you have a parent, brother and/or sister currently enrolled at Aurora University?",
                  "placeHolder": "Select",
                  "inputType": "DROPDOWN",
                  "className": "col-span-2 cols-ac",
                  "subLine": null,
                  "label": "Do you have a parent, brother and/or sister currently enrolled at Aurora University?",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": null,
                  "regex": null
                },
                "configId": "confirm",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": null,
                  "conditions": [],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": false
              },
              {
                "fieldNo": 20027,
                "defaultValue": "no",
                "display": {
                  "tooltip": "Are your parents or grandparents alumni of Aurora University?",
                  "placeHolder": "Select",
                  "inputType": "DROPDOWN",
                  "className": "col-span-2 cols-ac",
                  "subLine": null,
                  "label": "Are your parents or grandparents alumni of Aurora University?",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": null,
                  "regex": null
                },
                "configId": "confirm",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": null,
                  "conditions": [],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": false
              },
              {
                "fieldNo": 20023,
                "defaultValue": "",
                "display": {
                  "tooltip": "Student relation with immediate family member currently attending an undergraduate program at Aurora University?",
                  "placeHolder": "Select",
                  "inputType": "DROPDOWN",
                  "className": "",
                  "subLine": null,
                  "label": "Specify Relation",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": null,
                  "regex": null
                },
                "configId": "relation",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": "SHOWN",
                  "conditions": [
                    {
                      "fieldId": 20027,
                      "compareWith": {
                        "extactValue": "yes",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": false
              },
              {
                "fieldNo": 20004,
                "defaultValue": "no",
                "display": {
                  "tooltip": "Select “Yes” if you are, were an education major and a member of Educators Rising during your senior year of high school at Batavia, East Aurora, Hinckley-Big Rock, Kaneland, Metea Valley, Neuqua Valley, Oswego, Oswego East, Plano, St. Charles East, St. Charles North, Sandwich, Waubonsie Valley, West Aurora or Yorkville.",
                  "placeHolder": "Select",
                  "inputType": "DROPDOWN",
                  "className": "col-span-2 cols-ac",
                  "subLine": null,
                  "label": "Are you a member of Educators Rising?",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": null,
                  "regex": null
                },
                "configId": "confirm",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": null,
                  "conditions": [],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [
                  "others"
                ],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": false
              }
            ],
            "visibilityCondition": {
              "visibleType": null,
              "conditions": [],
              "orConditions": []
            },
            "widgetTitle": null,
            "widgetCss": null,
            "type": null,
            "table": null
          },
          {
            "widgetNo": 3,
            "headerQuestion": {
              "fieldNo": 0,
              "defaultValue": null,
              "display": {
                "tooltip": null,
                "placeHolder": null,
                "inputType": "HEADING",
                "className": null,
                "subLine": null,
                "label": "",
                "prefixText": null,
                "suffixText": null,
                "options": [],
                "inputBoxEnum": null
              },
              "validation": {
                "minValue": 0,
                "maxValue": 0,
                "errorMessage": null,
                "regex": null
              },
              "configId": null,
              "configConditions": [],
              "conditionFieldNo": 0,
              "constraints": {
                "size": 0,
                "type": null,
                "valueFormatRegex": null,
                "allowInputRegex": null
              },
              "visibilityCondition": {
                "visibleType": null,
                "conditions": [],
                "orConditions": []
              },
              "hidden": false,
              "moreInfo": null,
              "tags": [],
              "casePreserve": null,
              "openAnotherForm": null,
              "required": false
            },
            "questions": [
              {
                "fieldNo": 20024,
                "defaultValue": "no",
                "display": {
                  "tooltip": "Are you a member of Phi Theta Kappa?",
                  "placeHolder": "Select",
                  "inputType": "DROPDOWN",
                  "className": "cols-ac",
                  "subLine": null,
                  "label": "Are you a member of Phi Theta Kappa?",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": null,
                  "regex": null
                },
                "configId": "confirm",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": "SHOWN",
                  "conditions": [
                    {
                      "fieldId": 235,
                      "compareWith": {
                        "extactValue": "transfer",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": false
              },
              {
                "fieldNo": 20026,
                "defaultValue": "no",
                "display": {
                  "tooltip": "Are you a member of Alpha Beta Gamma?",
                  "placeHolder": "Select",
                  "inputType": "DROPDOWN",
                  "className": "cols-ac",
                  "subLine": null,
                  "label": "Are you a member of Alpha Beta Gamma?",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": null,
                  "regex": null
                },
                "configId": "confirm",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": "SHOWN",
                  "conditions": [
                    {
                      "fieldId": 235,
                      "compareWith": {
                        "extactValue": "transfer",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": false
              },
              {
                "fieldNo": 20025,
                "defaultValue": "no",
                "display": {
                  "tooltip": "Are you a member of Psi Beta",
                  "placeHolder": "Select",
                  "inputType": "DROPDOWN",
                  "className": "cols-ac",
                  "subLine": null,
                  "label": "Are you a member of Psi Beta?",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 0,
                  "errorMessage": null,
                  "regex": null
                },
                "configId": "confirm",
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": "SHOWN",
                  "conditions": [
                    {
                      "fieldId": 235,
                      "compareWith": {
                        "extactValue": "transfer",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": false
              }
            ],
            "visibilityCondition": {
              "visibleType": null,
              "conditions": [],
              "orConditions": []
            },
            "widgetTitle": null,
            "widgetCss": null,
            "type": null,
            "table": null
          }
        ],
        "pageTitle": null,
        "pageSubTitle": null
      },
      {
        "pageNo": 2,
        "inputWidgets": [
          {
            "widgetNo": 1,
            "headerQuestion": {
              "fieldNo": 100001,
              "defaultValue": "yes",
              "display": {
                "tooltip": "",
                "placeHolder": "",
                "inputType": "CHECKBOX",
                "className": "contacts",
                "subLine": null,
                "label": "",
                "prefixText": "",
                "suffixText": "",
                "options": [
                  {
                    "text": "Please check this box and share your contact details if you wish to be contacted by our counselors.",
                    "iconUrl": null,
                    "value": "yes",
                    "type": "TEXT"
                  }
                ],
                "inputBoxEnum": null
              },
              "validation": {
                "minValue": 0,
                "maxValue": 0,
                "errorMessage": "",
                "regex": null
              },
              "configId": null,
              "configConditions": [],
              "conditionFieldNo": 0,
              "constraints": {
                "size": 0,
                "type": null,
                "valueFormatRegex": null,
                "allowInputRegex": null
              },
              "visibilityCondition": {
                "visibleType": null,
                "conditions": [],
                "orConditions": []
              },
              "hidden": false,
              "moreInfo": null,
              "tags": [],
              "casePreserve": null,
              "openAnotherForm": null,
              "required": false
            },
            "questions": [
              {
                "fieldNo": 4,
                "defaultValue": null,
                "display": {
                  "tooltip": "Email Address",
                  "placeHolder": "",
                  "inputType": "TEXT",
                  "className": "se-row",
                  "subLine": null,
                  "label": "Email Address",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 0,
                  "maxValue": 50,
                  "errorMessage": "Invalid Email Id",
                  "regex": "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\$"
                },
                "configId": null,
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": null,
                  "allowInputRegex": null
                },
                "visibilityCondition": {
                  "visibleType": "ENABLED",
                  "conditions": [
                    {
                      "fieldId": 100001,
                      "compareWith": {
                        "extactValue": "yes",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": "FALSE",
                "openAnotherForm": null,
                "required": true
              },
              {
                "fieldNo": 5,
                "defaultValue": null,
                "display": {
                  "tooltip": "Phone Number",
                  "placeHolder": "",
                  "inputType": "TEXT",
                  "className": "se-row",
                  "subLine": null,
                  "label": "Phone Number",
                  "prefixText": null,
                  "suffixText": null,
                  "options": [],
                  "inputBoxEnum": null
                },
                "validation": {
                  "minValue": 10,
                  "maxValue": 10,
                  "errorMessage": "Mobile no. should be 10 digit.",
                  "regex": null
                },
                "configId": null,
                "configConditions": [],
                "conditionFieldNo": 0,
                "constraints": {
                  "size": 0,
                  "type": null,
                  "valueFormatRegex": "(\d{0,3})(\d{0,3})(\d{0,4})(\d{0,4})",
                  "allowInputRegex": "[^0-9]"
                },
                "visibilityCondition": {
                  "visibleType": "ENABLED",
                  "conditions": [
                    {
                      "fieldId": 100001,
                      "compareWith": {
                        "extactValue": "yes",
                        "minValue": null,
                        "maxValue": null,
                        "contains": null,
                        "notContains": null
                      }
                    }
                  ],
                  "orConditions": []
                },
                "hidden": false,
                "moreInfo": null,
                "tags": [],
                "casePreserve": null,
                "openAnotherForm": null,
                "required": true
              }
            ],
            "visibilityCondition": {
              "visibleType": null,
              "conditions": [],
              "orConditions": []
            },
            "widgetTitle": null,
            "widgetCss": null,
            "type": null,
            "table": null
          }
        ],
        "pageTitle": null,
        "pageSubTitle": null
      }
    ],
    "state": null
  };





}




