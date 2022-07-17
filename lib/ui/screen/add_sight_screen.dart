import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/domain/sight_type.dart';
import 'package:places/mocks.dart';
import 'package:places/presets/assets/images.dart';
import 'package:places/presets/strings/app_strings.dart';
import 'package:places/presets/styles/app_sizes.dart';
import 'package:places/providers/form_edit_sight_provider.dart';
import 'package:places/ui/components/input_add_preview_images.dart';
import 'package:places/ui/components/text_button_app_bar_leading_pop.dart';
import 'package:places/ui/widgets/app_bar/app_bar_standard.dart';
import 'package:places/ui/widgets/button/button_normal.dart';
import 'package:places/ui/widgets/inputs/input_fields_geo_coordinate.dart';
import 'package:places/ui/widgets/inputs/text_field_select_entity.dart';
import 'package:places/ui/widgets/inputs/text_field_with_clear_icon.dart';
import 'package:places/utils/input_formatters.dart';
import 'package:provider/provider.dart';

/// Экран для добавление новых мест
class AddSightScreen extends StatelessWidget {
  const AddSightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarStandard(
        title: AppStrings.srcTitleAddSightScreen,
        leading: TextButtonAppBarLeadingPop(
          text: AppStrings.cancel,
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingCommon,
                ),
                child: ChangeNotifierProvider(
                  create: (context) => FormEditSightProvider(),
                  child: const _FormAddSight(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormAddSight extends StatefulWidget {
  const _FormAddSight({
    Key? key,
  }) : super(key: key);

  @override
  State<_FormAddSight> createState() => _FormAddSightState();
}

class _FormAddSightState extends State<_FormAddSight> {
  @override
  Widget build(BuildContext context) {
    final formProvider = context.read<FormEditSightProvider>();
    final focusNodeName = FocusNode();

    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // компонент добавления и просмотра изображений
          Selector<FormEditSightProvider, List<String>>(
            selector: (_, provider) => provider.imageList,
            builder: (context, imageList, __) => InputAddPreviewImages(
              images: imageList,
              onImageAdd: formProvider.addImage,
              onImageDelete: formProvider.deleteImage,
            ),
          ),

          const SizedBox(
            height: AppSizes.paddingDetailContentDivider,
          ),
          // поле Категория
          TextFieldSelectEntity(
            label: AppStrings.labelCategory,
            initialValue: formProvider.sightTypeId,
            getListCallback: SightType.getList,
            getItemById: SightType.getById,
            onChange: (value) => formProvider.sightTypeId = value,
            validator: formProvider.validationSightType,
            nextFocusNode: focusNodeName,
          ),
          const SizedBox(
            height: AppSizes.paddingDetailContentDivider,
          ),
          // поле Название
          TextFieldWithClearIcon(
            label: AppStrings.labelName,
            maxLength: 150,
            textCapitalization: TextCapitalization.sentences,
            textInputFormatter: StringFormatter(),
            onChange: (value) => formProvider.name = value,
            validator: formProvider.validationName,
            textInputAction: TextInputAction.next,
            focusNode: focusNodeName,
          ),
          const SizedBox(
            height: AppSizes.paddingDetailContentDivider,
          ),
          // поля координат
          InputFieldsGeoCoordinate(
            onChangeLat: formProvider.setLat,
            onChangeLong: formProvider.setLong,
            validatorLat: formProvider.validationLat,
            validatorLong: formProvider.validationLong,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: AppSizes.paddingDetailContentDivider,
          ),
          // поле Описание
          TextFieldWithClearIcon(
            label: AppStrings.labelDescription,
            minLines: 3,
            onChange: (value) => formProvider.description = value,
            validator: formProvider.validationDescription,
            textInputAction: TextInputAction.done,
          ),
          const Spacer(),
          const SizedBox(
            height: AppSizes.paddingDetailContentDivider / 2,
          ),
          // кнопка Создать
          ButtonNormal(
            text: AppStrings.create.toUpperCase(),
            action: context.select<FormEditSightProvider, bool>(
              (value) => value.isValidFormData,
            )
                ? () => _saveData(formProvider)
                : null,
          ),
          const SizedBox(
            height: AppSizes.paddingDetailContentDivider / 2,
          ),
        ],
      ),
    );
  }

  void _saveData(FormEditSightProvider formProvider) {
    if (!formProvider.isValidFormData) return;
    mocks.add(
      Sight(
        name: formProvider.name,
        type: SightType.getById(formProvider.sightTypeId)!,
        urls: [
          ...formProvider.imageList,
        ],
        details: formProvider.description,
        lat: formProvider.lat!,
        lon: formProvider.long!,
      ),
    );
  }
}
