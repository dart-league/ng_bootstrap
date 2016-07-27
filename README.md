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
    <link rel="stylesheet" href="packages/ng2_strap/styles/ng2_strap.css">
    ...
</head>
```

5\. Add needed `ng2_strap` directives to your components:

```dart
@Component(
    ...
    directives: const [N2S_ACCORDION_DIRECTIVES])
```

## Components

- [x] [Accordion](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Alert](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Buttons](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Carousel](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Collapse](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [DatePicker](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [DatePickerPopup](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Dropdown](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Modal](http://dart-league.github.io/ng2_strap/#modal)
- [x] [Pagination](http://dart-league.github.io/ng2_strap/#accordion)
- [ ] Popover
- [x] [Progressbar](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Rating](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Tabs](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Timepicker](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Tooltip](http://dart-league.github.io/ng2_strap/#accordion)
- [x] [Typeahead](http://dart-league.github.io/ng2_strap/#accordion)

- [x] N2sTransclude - to transclude templates
- [x] positional service

## Contribution

Please read central `ng2` modules [readme](https://github.com/valor-software/ng2-plans) for details, plans and approach and welcome :)

[Create new issues](https://github.com/luisvt/ng2_strap/issues/new)

[Fork me](https://github.com/luisvt/ng2_strap/issues#fork-destination-box)


### TODO
- [ ] support animation  (in progress...)
- [x] demo page
- [x] docs
