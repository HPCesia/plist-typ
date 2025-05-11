# plist.typ

`plist.typ` is a Typst package designed to parse and process Property List files, which are commonly used to store configuration data, especially in macOS and iOS applications. This package enhances the experience of reading plist files by optimizing the process. It takes plist files read using Typst's built-in `xml()` function and converts them into a more user-friendly dictionary format.

## Notes
- **Data Types**: The package supports plist data types: `dict`, `array`, `date`, `string`, `integer`, `real`, `boolean`, and `data`. But the `date` type **ONLY** support [RFC 3339](https://www.ietf.org/rfc/rfc3339.txt) format, and `data` will be process as a string, because you can use another package [based](https://typst.app/universe/package/based) to process Base64 data.

## Installation

Place the `plist.typ` file in Typst's local package directory:

```bash
# Assuming Typst's local package directory is ~/.local/share/typst/packages/local
mkdir -p ~/.local/share/typst/packages/local/plist
cd ~/.local/share/typst/packages/local/plist
git clone https://github.com/HPCesia/plist-typ.git "0.1.0"
```

## Usage Example

Here’s a simple example demonstrating how to use the `plist.typ` package in a Typst document:

```typst
#import "@local/plist:0.2.0": plist

#let data = plist(read("path/to/your/textmate-theme.tmTheme", encoding: none))
#let foreground = data.settings.at(0).settings.at("foreground", default: none)

#set raw(theme: "path/to/your/textmate-theme.tmTheme")
#show raw: set text(fill: rgb(foreground)) if foreground != none
```

This is also a most common usage because there are so many tools to convert plist to json, but typst only support `.tmTheme` file as raw code synatx theme.

## Contributing

Contributions are welcome! Feel free to submit issues, feature requests, or pull requests via [GitHub Issues](https://github.com/hpcesia/plist-typ/issues).

## License

`plist.typ` is licensed under the [MIT License](LICENSE).