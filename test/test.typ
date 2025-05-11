#import "../plist.typ": plist

#plist(read("test.xml", encoding: none))

#let test-theme-path = "monokai.tmTheme"

#let data = plist(read(test-theme-path, encoding: none))
#let foreground = data.settings.at(0).settings.at("foreground", default: none)
#let background = data.settings.at(0).settings.at("background", default: none)

#set raw(theme: test-theme-path)
#show raw: set text(fill: rgb(foreground)) if foreground != none

#place(
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
