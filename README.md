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

3\. Add sass transformer:

```yaml
dependencies:
    ...
    sass: any
    ...
transformers:
- sass
```

> you need to [install sass](http://sass-lang.com/install) previously


4\. Add css stylesheet link to `index.html`:

```html
<head>
    ...
    <link rel="stylesheet" href="packages/ng_bootstrap/all.css">
    ...
</head>
```

5\. Add needed `ng_bootstrap` directives to your components:

```dart
@Component(
    ...
    directives: const [BS_ACCORDION_DIRECTIVES])
```

## Components

- [x] [Accordion](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Alert](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Buttons](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Carousel](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Collapse](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [DatePicker](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [DatePickerPopup](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Dropdown](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Modal](http://dart-league.github.io/ng_bootstrap/#modal)
- [x] [Pagination](http://dart-league.github.io/ng_bootstrap/#accordion)
- [ ] Popover
- [x] [Progressbar](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Rating](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Tabs](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Timepicker](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Tooltip](http://dart-league.github.io/ng_bootstrap/#accordion)
- [x] [Typeahead](http://dart-league.github.io/ng_bootstrap/#accordion)

- [x] BsTemplateOutlet - to transclude templates (Most likely will be removed in future versions)
- [x] positional service

## Contribution

[Create new issues](https://github.com/dart-league/ng_bootstrap/issues/new)

[Fork me](https://github.com/dart-league/ng_bootstrap/issues#fork-destination-box)


### TODO
- [ ] support animation  (in progress...)
- [x] demo page
- [x] docs
