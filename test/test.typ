#import "../plist.typ": plist
#import "@preview/based:0.2.0": base64

#show heading.where(level: 1): align.with(center)

#let data = plist(
  read("test.xml", encoding: none),
  parsers: (data: base64.decode),
)

// Asserts
#assert.eq(type(data), dictionary)
#assert.eq(type(data.aDate), datetime)
#assert.eq(
  data.aDate,
  datetime(
    year: 2025,
    month: 1,
    day: 6,
    hour: 23,
    minute: 13,
    second: 39,
  ),
)

#assert.eq(type(data.aDict), dictionary)
#assert.eq(data.aDict.aString, "<Mässig, Maß>")
#assert.eq(data.aDict.aEmptyString, "")
#assert.eq(data.aDict.aFalseValue, false)
#assert.eq(data.aDict.aTrueValue, true)

#assert.eq(data.aFloat, 0.1)
#assert.eq(data.anInt, 114514)

#assert.eq(type(data.aList), array)
#assert.eq(data.aList.at(0), "A")
#assert.eq(type(data.aList.at(1)), array)
#assert.eq(data.aList.at(1).at(0), "B")

#assert.eq(str(data.helloWorldData), "Hello, world!")

= A Typst Logo
#align(center, image(data.typstLogoData))

= A Monokai Theme Code Block

#let test-theme-path = "monokai.tmTheme"

#let data = plist(read(test-theme-path, encoding: none))
#let foreground = data.settings.at(0).settings.at("foreground", default: none)
#let background = data.settings.at(0).settings.at("background", default: none)

#set raw(theme: test-theme-path)
#show raw: set text(fill: rgb(foreground)) if foreground != none

#align(
  block(
    radius: 0.5em,
    inset: 1em,
    fill: if background != none { rgb(background) } else { none },
    ```rust
    fn main() {
      println!("Hello, world!");
    }
    ```,
  ),
  center,
)
