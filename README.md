# ng_bootstrap

[![Join the chat at https://gitter.im/dart-league/ng_bootstrap](https://badges.gitter.im/dart-league/ng_bootstrap.svg)](https://gitter.im/dart-league/ng_bootstrap?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[Usage & Demo](http://dart-league.github.io/ng_bootstrap/)

# Getting Started

1\. Create a new angular2-dart app: https://angular.io/docs/dart/latest/quickstart.html

2\. Add `ng_bootstrap` to `pubspect.yaml`:

```yaml
dependencies:
    ...
    ng_bootstrap: any
    ...
```

3\. Add css stylesheet link to `index.html`:

```html
<head>
    ...
    <link rel="stylesheet" href="packages/ng_bootstrap/all.css">
    ...
</head>
```

4\. Add needed `ng_bootstrap` directives to your components:

```dart
@Component(
    // ...
    directives: const [BS_DIRECTIVES])
```

## Customize Styles - Create Custom Themes

To customize default styles to create custom themes based on `ng_bootstrap` theme,
the best option is to create an `scss` file that imports the `package:ng_bootstrap/all.scss`
file, for example:

```scss
// variables should be set before importing default theme
$brand-primary: red !important;

// you could also import a custom variables theme if you prefer
// but it should be done before importing default theme
@import 'path/to/_my-variables';

@import 'package:ng_bootstrap/all';
```

Then in your `index.html` file change the `link` tag to point to the new theme.


```html
<head>
    ...
    <link rel="stylesheet" href="path/to/my-theme.css">
    ...
</head>
```

## Components

- [x] [Accordion](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Alert](http://dart-league.github.io/ng_bootstrap/#alert)
- [x] [Buttons](http://dart-league.github.io/ng_bootstrap/#buttons)
- [x] [Carousel](http://dart-league.github.io/ng_bootstrap/#carousel)
- [x] [Collapse](http://dart-league.github.io/ng_bootstrap/#collapse)
- [x] [DatePicker](http://dart-league.github.io/ng_bootstrap/#datepicker)
- [x] [DatePickerPopup](http://dart-league.github.io/ng_bootstrap/#datepicker)
- [x] [Dropdown](http://dart-league.github.io/ng_bootstrap/#dropdown)
- [x] [Modal](http://dart-league.github.io/ng_bootstrap/#modal)
- [x] [Pagination](http://dart-league.github.io/ng_bootstrap/#pagination)
- [ ] Popover
- [x] [Progressbar](http://dart-league.github.io/ng_bootstrap/#progressbar)
- [x] [Rating](http://dart-league.github.io/ng_bootstrap/#rating)
- [x] [Tabs](http://dart-league.github.io/ng_bootstrap/#tabs)
- [x] [Timepicker](http://dart-league.github.io/ng_bootstrap/#timepicker)
- [x] [Tooltip](http://dart-league.github.io/ng_bootstrap/#tooltip)
- [x] [Typeahead](http://dart-league.github.io/ng_bootstrap/#typeahead)
- [x] [Grid/Table](http://dart-league.github.io/ng_bootstrap/build/web/index.html#table)
- [x] [FileInput](http://dart-league.github.io/ng_bootstrap/build/web/index.html#file_upload)
- [ ] ImageInput
- [ ] SignItInput
- [ ] SignInput
- [ ] Charts
- [ ] Header Bar
- [ ] Scafold - Base Layout

### Others
- [x] BsTemplateOutlet - to transclude templates (Most likely will be removed in future versions)
- [x] positional service

## Contribution

[Create new issues](https://github.com/dart-league/ng_bootstrap/issues/new)

[Fork me](https://github.com/dart-league/ng_bootstrap/issues#fork-destination-box)


### TODO
- [ ] support animation  (in progress...)
