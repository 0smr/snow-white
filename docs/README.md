# Documentation

This file only offers documentation for the additional properties of components given by the SnowWhite theme.<br>
On [doc.qt.io](https://doc.qt.io/qt-6/qtquick-controls2-qmlmodule.html), you can find the documentation for the remaining components.

## Table Of Content
- [Quick Start](#quick-start)
- [Change Color Theme](#change-color-theme)
- [Components](#components)
  + **base**
    * [DashedRing](#dashed-ring) `[base]`
  + [Button](#dial)
  + [Dial](#dial)
  + [ProgressBar](#progressbar)
  + [SnowWhite](#snowwhite) `[singleton]`

## Quick Start

See the <em>Usage</em> section of the main [README](../README.md#usage) page.

## Change Color Theme

To alter the color scheme of a component, update the palette properties on the <em>parent component</em> so that all children are affected.

**button**:
+ `palette.button`
+ `palette.buttonText`

**window & base**:
+ `palette.base`
+ `palette.text`
+ `palette.window`
+ `palette.windowText`

**highlights**:
+ `palette.highlight`
+ `palette.highlightedText`

## Components

### Dashed Ring

This is a basic component which generates a dashed ring.

#### Component properties:
##### `[property]` `[real]` dashCount: 2
The number of dashes on the ring is specified by this property.
##### `[property]` `[real]` borderWidth: 2
This property specifies the width of the border, which can range from $0$ to $\dfrac{width}{2}$.
##### `[property]` `[real]` dashWidth: 2
This property specifies the width of dashes.
##### `[property]` `[color]` palette.base
This property derives from the `Control` component, which specifies the `color` of the dashes.

```qml
DashedRing {
    width: 100
    height: 100

    borderWidth: 2
    dashWidth: 2
    dashCount: 25
    palette.base: 'blue'
}
```
----
### Button
#### Component properties:
##### `[property]` `[real]` radius
This property determines the radius of background.

----
### Dial
#### Component properties:
##### `[property]` `[DashedRing]` dottedRing
This property refers to the [DashedRing](#dashed-ring) component used in the Dial component.

----
### ProgressBar
#### Component properties:
##### `[property]` `[int]` orientation: Qt.Horizontal
This property determines the orientation of the ProgressBar component.<br>
Either `Qt.Horizontal` or `Qt.Vertical` can be the value.

----
### SnowWhite
#### Component functions:
##### function blend(`color` color1, `color` color2): `color`
This function returns an average color from two input color RGBA values.
```javascript
SnowWhite.blend(Qt.rgba(0, 0, 0, 1), Qt.rgba(1, 1, 1, 0));
// Qt.rgba(.5, .5, .5, .5)
```

##### function setAlpha(`color` color, `real` alpha): `color`
This function set new alpha values for given color.
```javascript
SnowWhite.setAlpha(Qt.rgba(1, 1, 1, 1), 0.3); // Qt.rgba(1, 1, 1, 0.3)
```

##### function clamp(`real` x, `real` a, `real` b): `real`
This functions constrain `x` to lie between `a` and `b`.
```javascript
SnowWhite.clamp(1, 3, 5); // 3
SnowWhite.clamp(1, 8, 5); // 5
SnowWhite.clamp(1,-4, 5); // 1
```

##### function remap(`real` value, `real` low1, `real` high1, `real` low2, `real` high2): `real`
This function re-maps a number from one range to another.
```javascript
SnowWhite.remap(2, 1, 3, 0, 10); // 5
```

##### function invertColor(`color` color): `color`
This function invert RGB values of input color.
```javascript
SnowWhite.invertColor(Qt.rgba(0.2, 1, 0.5, 1)); // Qt.rgba(0.8, 0, 0.5, 1)
```
