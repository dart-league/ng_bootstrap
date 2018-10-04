## 1.0.1

- upgrade `bootstrap_sass` to version `^4.1.3`
- fix demo links
- fix `accordion` style

## 1.0.0

- Add `ngClass` to `bs-column`
- rename `constants` to camelcase
- fix  `bsTable`
- add vertical tabs support to `bs-tabsx`
- `bs-progress` is resizeable
- fix bug on active tab not set correctly (fix #19)

## 1.0.0-beta+1

- Add ability to edit table inline
- upgrade dependencies to support dart-sdk `2.0.0`
- move css from `file_upload_demo.html` to `file_upload_demo.scss`

## 1.0.0-beta+0

- remove validators since angular ones accomplish the same
- upgrade to `angular: 5.0.0-beta+3`

## 1.0.0-alpha+4
   
   - upgrade `angular` to `5.0.0-alpha+15`
   - upgrade `angular_forms` to `2.0.0-alpha+7`
   - enhance `bs-inputs`

## 1.0.0-alpha+3

- upgrade `angular` to `5.0.0-alpha+13`
- upgrade `angular_forms` to `2.0.0-alpha+5`

## 1.0.0-alpha+2

- upgrade `angular` to `^5.0.0-alpha+2`
- upgrade `stream_transform` to `^0.0.11`
- change `bootstrapStatic` by `runApp`
- fixes #103
- fixes #104
- fixes #105

## 1.0.0-alpha+1

- upgrade `angular` to version `5.0.0-alpha+9`
- upgrade `bootstrap_sass` to version `4.0.0`
- add class `modal-open` to `body` when modal is open
- add `$dropdown-link-hover-bg: #e9ecef !default;` to make background color of dropdown links darker

## 1.0.0-alpha

- upgrade `angular` to version `5.0.0-alpha+7`
- upgrade `build_runner` to version `^0.7.0`
- fix bug in `bs-rating` component
- fix bug in `progress` caused by adding `bootstrap@^4.0.0-beta`
- add ability to create components inside modal

## 0.9.2
   
- add `bsPattern` to `bsInput`
- add ability to override error messages to `bsInput`

## 0.9.1

- add example of pagination custom text
- add card header
- fix card for bootstrap
- update tooltip_demo.html

## 0.9.0

- add popover component (fixes: #82)
- fix tooltip styles

## 0.8.6

- upgrade to `bootstrap@^4.0.0-beta`

## 0.8.5

- correct tooltip placement inside table element (fixes: #76)
- correct tooltip placement after fast hide and show
- correct accordion expand/collapse timing

## 0.8.4

- Upgrade to `angular_forms@^1.0.0` (fixes: #80)

## 0.8.3

- Upgrade to `angular@4.0.0`

## 0.8.2

- support `DDC` (fixes: #71)
- change `stream_transformers` library by `stream_transform`
- add input listener to components that extends `DefaultValueAccessor`

## 0.8.1

* Upgrade to `angular@4.0.0-beta` (fixes: #78)

## 0.8.0

* Upgrade to `angular@4.0.0-alpha+3`
* Change `bs-modal` logic to pass buttons instead actions
* Add `BsPromptService` to create a modal from a function

## 0.7.1

* Upgrade to `angular@4.0.0-alpha+2`
* add `bsPrompt`

## 0.7.0

* Upgrade to `angular@4.0.0-alpha+1`

## 0.6.7

* add BsInput to BS_DIRECTIVES list

## 0.6.6

* enhance BsInput component
* add BsMinLength Directive
* add BsMaxLength Directive

## 0.6.5

* remove date_picker_inner files and activeDate attribute from date-picker
* remove `initDate` from date-picker (fixes: #68)
* enhance layout and styling of date-picker

## 0.6.4

- upgrade `sass_builder` to `^0.1.1`

## 0.6.3

* replace `EventEmitter` by `Stream` and `StreamController`

## 0.6.2

* upgrade `markdown` to version `0.11.3`

## 0.6.1

* upgrade to `angular 3.0.0-beta+2`

## 0.5.3

* use `sass_builder 0.0.2`
* use `angular2 3.0.0-alpha+1`
* `bs-table` allows row selection and cell templates

## 0.5.2

* upgrade to `sass 1.0.0-alpha.9`
* upgrade to `intl 0.14.0`

## 0.5.1

* correct `date-picker-popup` not updating values correctly

## 0.5.0

* upgrade to `bootstrap_sass v4.0.0-alpha.5`
* remove unneded code in `date_picker_popup`

## 0.4.6

* add format and locale to datepicker-popup (fixes #51 and #45)

## 0.4.5

* correct path to font-awesome (fixes #59)

## 0.4.4

* make accordion panel grow to fit the content (fixes #55)

## 0.4.3

* Use `grinder` and `dart-sass` instead `sass_transformer` and `ruby-sass`.
* Upgrade angular to `2.2.0` and remove `Renderer` from files. (fixes #56)

## 0.4.2

* Typeahead:
    * increase the options limit to 200
    * process matches always user clicks dropdown button, or whenever user change search value
    * add clear text button
    * add `_typeahead.scss` which contains the styles for `clear-button`

## 0.4.1

* increase version of angular2 to `2.0.0-beta.22`
* change path of fontawesome in `all.scss` to use `packages` directory
* remove `web` folder. The content is going to be in `gh-pages` branch and it is going to work as separate project.
* remove print from BsModalComponent constructor

## 0.4.0

* rename `NG_BOOTSTRAP_TABLE_DIRECTIVES` to `BS_TABLE_DIRECTIVES`
* rename `NG_BOOTSTRAP_TABSX_DIRECTIVES` to `BS_TABSX_DIRECTIVES`
* rename `NG_BOOTSTRAP_DIRECTIVES` to `BS_DIRECTIVES`
* add `file-upload` directives

## 0.3.4

* correct wrong totalChange value change in pagination
* correct modal demo button class
* use `totalPages` value from pagination instead calculating it in `table-demo`
* correct back `removeTab` as proposed on PR #23

## 0.3.3

* correct bug of accordion-panel not opening by default

## 0.3.2

* add ability to use complex objects as data input for table component

## 0.3.1

* upgrade `bootstrap_sass` to `v4.0.0-alpha.3+4`
* upgrade `sass_transformer` to `v0.1.1`
* change `sass` to `sass_transformer` in README

## 0.3.0+1

* use `sass_transformer 0.1.0` instead `dart-sass 0.5.0`
* remove packages path from `all.scss`

## 0.3.0

* Rename components to use pattern `Bs<name>Component`
* Rename directives to use pattern `Bs<name>Directive`
* Make `BsTimePickerComponent.writeValue` method `async`
* Make `BsDatePickerComponent.writeValue` method `async`
* Add styling for `bs-pager`
* Add `min-width` to `bs-pagination` components in `bs-pagination-demo`
* Upgrade to `angular 2.0.0-alpha.20`

## 0.2.3

* add `BsTableComponent` and `BsColumnComponent`:
  - no column template supported
  - no complex objects as row input supported
  - no selection
  - no actions (delete, edit, view, ...)
* correct pagination directive totalItems change
* Collapse directive:
  - correct collapsing animation
  - remove `isCollapse` and `isCollapsed attributes`
  - add `bsCollapseChange` and `collapsingChange` event-emitters
* upgrade bootstrap_sass to 4.0.0-alpha.3+1
* use $ling-height-base instead $line-height in _panel.scss
* rename css-class scrollable-menu to scrollable-navbar-menu to avoid crashes with class in _dropdown.scss
* fix collapse_demo.html: collapse not being hidden
* correct panel-title font too big

## 0.2.2

* make `TypeAhead.dropdownMenu` scrollable. Fixes #7.
* add `noResults` and `loading` messages to `TypeAhead.dropdownMenu`
* correct `TypeAhead` case sensitivity results
* remove `TypeAhead._queryStream.distinct` processing, this avoids values not 
  gotten when same value has been typed before after passing debounce time

## 0.2.1

* rename `n2sCollapse` to `bsCollapse`
* fix bug in `accordion` caused when `closeOthers` attribute is null
* remove unneeded code on `DatePickerPopup` (solves #26)
* correct error caused by entering wrong date onto DatePickerPopup-TextBox

## 0.2.0

* upgrade to angular 2.0.0-beta.19
* Fix Removing tabs sometimes didn't work #23
* Added support for typeaheads to specify a `optionField` in complex Objects
* Rename NG_BOOTSTRAP_TABS_DIRECTIVES to NG_BOOTSTRAP_TABSX_DIRECTIVES
* Add NG_BOOTSTRAP_TABS_DIRECTIVES constant
* Remove components.dart and put the code into ng_bootstrap.dart directly
* Rename NGBS_CAROUSEL_DIRECTIVES to NG_BOOTSTRAP_CAROUSEL_DIRECTIVES

## 0.1.1

* correct bug sass not founding files doubt to usage of relative path instead of packages path
* change caret icon of typeahead to font-awesome icon
* Remove Getting Started and Migration links from demo header
* correct visual errors in dropdown demo
* add style display inline-block to bs-dropdown
