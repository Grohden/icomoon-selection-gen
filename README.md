# icomoon_selection_gen

A simple source generator for icomoon selection.json file,
you can use it to generate a similar class as the `Icons` material class.

## Not published

I'm just making this open source so people can look at the code.

### Why write it then?

I was just trying to write a code generator and got this idea after
some "manual codegen", so I'm not planning to publish it on pub.dev, and
I'm kinda lazy to make the desired build flags work (see TODOs)

### How to install then?

Just ref this git repo on `pubspec.yaml`
```yaml
dev_dependencies:
  ...
  icomoon_selection_gen:
    git:
      url: git://github.com/Grohden/icomoon-selection-gen
      ref: v0.0.1
```

To keep it working and not get a surprising error, use the git tags/versions on url.

## Usage

I'm assuming you already know how to use icomoon.

After you choose the place for your files (`selection.json` and `icomoon.ttf`)

```yaml
# your pubspec probably has something like this:
  fonts:
    - family: Icomoon # this is the font_name prop for build.yaml
      fonts:
        - asset: lib/assets/icons/icomoon.ttf
```

Configure your `build.yaml`

```yaml
targets:
  $default:
    builders:
      icomoon_selection_gen:
        generate_for:
          - lib/assets/icons/selection.json
        options:
          font_name: Icomoon # same as the `family` prop in pubspec.yaml
```

If it's correctly configured, you can run the `flutter packages pub run build_runner build`
and you will get a file named `selection.dart` with a `Icomoon` class with static `IconData` like
this:

```dart
class Icomoon {
  Icomoon._();

  static const _kFontFam = 'Icomoon';
  
  // Names are the snake_case version of the original ones (the ones you've set on icomoon)
  static const IconData my_icon = IconData(0xe941, fontFamily: _kFontFam);
}
```

so you can use it like:

```dart
const myIcon = Icon(Icomoon.my_icon);
```

### TODO

I may (and wish to) do these:

* [x] support custom name for the .json file (you can only use selection.json as the name)
    * [See `generate_for`](https://github.com/dart-lang/build/blob/master/build_config/README.md#configuring-builders-applied-to-your-package)
* [ ] support custom name for the generated file - (builder is confusing in this part)
* [ ] support for custom location for the generated file
* [ ] Try again `source_gen` to be able to support `ignore_for_file` - had problems
 because `source_gen` is basically only for dart (not json) files
* [ ] Add test cases
   