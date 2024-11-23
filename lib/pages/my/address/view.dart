import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tdesign_flutter/tdesign_flutter.dart';
import 'package:validatorless/validatorless.dart';
import 'package:woo_store/components/index.dart';
import 'package:woo_store/generated/l10n.dart';
import 'package:woo_store/style/index.dart';
import 'package:woo_store/widgets/index.dart';

import 'controller.dart';
import 'index.dart';

class AddressPage extends GetView<AddressController> {
  const AddressPage({this.type, super.key});
  final String? type;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddressController>(
      init: AddressController(type),
      id: "address",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
              title: Text(controller.type == "Billing"
                  ? S.current.address_page_title_bill.tr
                  : S.current.address_page_title_shipping.tr)),
          body: SafeArea(
            child: SingleChildScrollView(
              child: _buildView(context),
            ),
          ),
        );
      },
    );
  }

  // 主视图
  Widget _buildView(BuildContext context) {
    return <Widget>[
      TextWidget.h4(S.current.coding.tr),
      // 表单
      _buildForm(context).paddingBottom(30.h),

      // 保存按钮
      ButtonWidget.primary(
        S.current.save.tr,
        onTap: controller.onSave,
        width: double.infinity,
      ),
    ].toColumn().paddingAll(AppSpace.page);
  }

  Widget _buildForm(BuildContext context) {
    return Form(
        key: controller.formKey, //设置globalKey，用于后面获取FormState
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: <Widget>[
          TextFormWidget(
            isMustBeEnter: true,
            controller: controller.firstNameController,
            labelText: S.current.first_name_iput_label.tr,
            validator: Validatorless.multiple([]),
          ),
          TextFormWidget(
            isMustBeEnter: true,
            controller: controller.lastNameController,
            labelText: S.current.last_name_iput_label,
            validator: Validatorless.multiple([]),
          ),
          _buildHorizontalCascader(context),
          TextFormWidget(
            isMustBeEnter: true,
            controller: controller.postCodeController,
            labelText: S.current.postcode_iput_label.tr,
            validator: Validatorless.multiple([]),
          ),
          // TextFormWidget(
          //   isMustBeEnter: true,
          //   controller: controller.cityController,
          //   labelText: '城市',
          //   validator: Validatorless.multiple([]),
          // ),
          TextFormWidget(
            isMustBeEnter: true,
            controller: controller.address1Controller,
            labelText: S.current.address_iput_label.tr,
            validator: Validatorless.multiple([]),
          ),
          // TextFormWidget(
          //   controller: controller.address2Controller,
          //   labelText: '地址 2',
          // ),

          TextFormWidget(
            isMustBeEnter: true,
            controller: controller.companyController,
            labelText: S.current.company_iput_label.tr,
            validator: Validatorless.multiple([]),
          ),

          if (controller.type == "Billing")
            TextFormWidget(
              isMustBeEnter: true,
              keyboardType: TextInputType.phone,
              controller: controller.phoneNumberController,
              labelText: S.current.phone_iput_label.tr,
              validator: Validatorless.multiple([]),
            ),
          if (controller.type == "Billing")
            TextFormWidget(
              isMustBeEnter: true,
              keyboardType: TextInputType.emailAddress,
              controller: controller.emailController,
              labelText: S.current.email_iput_label.tr,
              validator: Validatorless.multiple([]),
            ),
          // end
        ].toColumn());
  }

  Widget _buildHorizontalCascader(BuildContext context) {
    return GestureDetector(
      onTap: () {
        TDCascader.showMultiCascader(context,
            title: S.current.choice_address.tr,
            subTitles: [
              S.current.choice_province.tr,
              S.current.choice_city.tr,
              S.current.choice_district.tr
            ],
            data: controller.data,
            initialData: controller.initData,
            theme: 'tab',
            onChange: controller.changeCity, onClose: () {
          context.pop();
        });
      },
      child: _buildSelectRow(
          context, controller.selected_1, S.current.choice_address.tr),
    );
  }

  Widget _buildSelectRow(BuildContext context, String output, String title) {
    final textColor = Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      height: 56,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TDText(
                title,
                font: TDTheme.of(context).fontBodyLarge,
                textColor: textColor,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Row(
                children: [
                  Expanded(
                      child: TDText(
                    output,
                    font: TDTheme.of(context).fontBodyLarge,
                    textColor: textColor.withOpacity(0.5),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Icon(
                      TDIcons.chevron_right,
                      color: textColor,
                    ),
                  ),
                ],
              )),
            ],
          ).paddingTop(14),
          TDDivider(
            color: TDTheme.of(context).grayColor9,
          )
        ],
      ),
    );
  }
}
