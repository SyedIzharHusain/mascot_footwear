






import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:mascotfootwear/lib/app_manager/widgets/text_field/primary_text_field_util.dart';

import '../../app_color.dart';
import '../../text_theme.dart';


class CustomSD extends StatefulWidget {

  final bool? multiSelect;
  final bool? enabled;
  final TextStyle? labelStyle;
  final BoxDecoration? decoration;
  final ValueChanged onChanged;
  final List listToSearch;
  final String? label;
  final String valFrom;
  final IconData? prefixIcon;
  final List? initialValue;
  final bool? hideSearch;
  final double? height;
  final Color? borderColor;

  const CustomSD({Key? key,

    this.multiSelect,
    this.labelStyle,
    this.decoration,
    this.label,
    this.prefixIcon,
    required this.listToSearch,
    this.initialValue,
    this.hideSearch,
    this.height,
    this.borderColor,
    required this.valFrom,
    required this.onChanged, this.enabled,}) : super(key: key);

  @override
  _CustomSDState createState() => _CustomSDState();
}

class _CustomSDState extends State<CustomSD> {

  bool obscure=false;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return CustomSearchableDropDown(
      enabled: widget.enabled,
      searchBarHeight: 40,
      multiSelect: widget.multiSelect??false,
      padding: const EdgeInsets.all(0),
      initialValue: widget.initialValue,
      primaryColor: AppColor.greyDark,
      hideSearch: widget.hideSearch?? false,
      menuHeight: widget.height??80,
      menuMode: true,
      labelStyle: widget.labelStyle??MyTextTheme.mediumBCN,

      items: widget.listToSearch,
      label: widget.label??'Select Name',
      dropdownItemStyle: MyTextTheme.mediumBCN,


      dropDownMenuItems: widget.listToSearch.map((item) {
        return item[widget.valFrom];
      }).toList(),
      onChanged: (val){
        widget.onChanged(val);
      },
      decoration: widget.decoration??BoxDecoration(
          borderRadius: BorderRadius.circular(PrimaryTextFieldUtil.border),
          color: PrimaryTextFieldUtil.fillColor,
          border: Border.all(color: widget.borderColor??PrimaryTextFieldUtil.borderColor)
      ),

    );
  }
}
