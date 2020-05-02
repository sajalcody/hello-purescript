## Purescript
### Functional Programming for web
- Statically typed
- Strongly typed
- has Type inference
- indentation sensitive
- Developed by Phil Freeman.

[Purescript website](https://www.purescript.org/)

[Purescript documentation](https://github.com/purescript/documentation): Documentation for the PureScript language, compiler, and tools.

[Purescript Book](https://book.purescript.org/): Purescript by Example, by Phil Freeman

[Original Book](https://leanpub.com/purescript/read)
[Github repo](https://github.com/paf31/purescript-book)

**PureScript Types**
- `Number` 1.0
- `String` "purescript"
- `Boolean` true
- `Int` 1
- `Char` 'a'
- `Array` [1,2,3] (Arrays should take homogeneous values)
- Records
    Ex: intro = {language: "Purescript", features: ["Statically types", "Type Inference"]}
        :t intro => { features :: Array String, language :: String }
        intro.language => "Purescript"
        intro.features => ["Statically types","Type Inference"]
- Functions

**PureScript Operators**
- `(<>)` Diamond operator for concatenation
- `($)`  Right Associative, Low Precedence operator , alias to `apply`
- `(<<<)` Backward Composition operator
- `(>>>)` Forward Composition operator
- `(<$>)` Left-associative map operator

**Other Concepts**
- Eta Conversion
- point-free form: functions defined without reference to their arguments.