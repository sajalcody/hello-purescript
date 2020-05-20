## Purescript
### Functional Programming for web
- Statically typed
- Strongly typed
- has Type inference
- indentation sensitive
- Developed by Phil Freeman.

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
- `(<>)` Diamond operator for concatenation, alias for `append`
- `($)`  Right Associative, Low Precedence operator , alias for `apply`
- `(>>=)` Bind operator
- `(<<<)` Backward Composition operator, alias for `compose`
- `(>>>)` Forward Composition operator, alias for `composeFlipped`
- `(<$>)` Left-associative map operator, alias for `map`

**Type Classes**
- `Show`
- `Generic`

**Other Concepts**
- Currying
- Eta Conversion
- point-free form: functions defined without reference to their arguments.

## Resources

- [Purescript website](https://www.purescript.org/)

- [Purescript documentation](https://github.com/purescript/documentation): Documentation for the PureScript language, compiler, and tools.

- [Purescript Book](https://book.purescript.org/): Purescript by Example, by Phil Freeman

- [Original Book](https://leanpub.com/purescript/read) and [Github repo](https://github.com/paf31/purescript-book)