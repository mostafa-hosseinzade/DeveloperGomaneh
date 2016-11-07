/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function (config) {
    // Define changes to default configuration here. For example:
    config.language = 'fa';
    config.toolbar = [['Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates', 'Undo', 'Redo'], ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl']
                , ['Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat'], ['Format', 'FontSize', 'Font', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak'], ['TextColor', 'BGColor'], ['Maximize', 'ShowBlocks', 'Image', 'Link', 'Anchor', 'IFrame']];

    config.filebrowserImageUploadUrl = root + '/upload';
    config.filebrowserImageBrowseUrl = root + '/Admin/browser_image.xhtml';
    config.filebrowserUploadUrl = root + '/upload_file';
    config.filebrowserBrowseUrl = root + '/Admin/browser_file.xhtml';
    config.filebrowserWindowWidth = 800;
    config.filebrowserWindowHeight = 500;
    config.toolbarCanCollapse = true;
    config.font_names = 'B Nazanin/BNazanin;B Titr/BTitr;B Koodak/BKoodak;B Yekan/BYekan;Iran Nastaliq/IranNastaliq;' + config.font_names;
};
