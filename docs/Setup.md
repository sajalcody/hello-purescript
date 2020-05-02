
## Purescript Project Setup
This setup uses [**pulp**](https://github.com/sajalcody/hello-purescript/blob/master/docs/Tools.md#pulp) as the _build tool_.

- [Project Initialisation, building, running](https://github.com/sajalcody/hello-purescript/blob/master/docs/Setup.md#project-initialisation)
- [Starting with an existing project](https://github.com/sajalcody/hello-purescript/blob/master/docs/Setup.md#starting-with-an-existing-project)
- [Installing a new dependency](https://github.com/sajalcody/hello-purescript/blob/master/docs/Setup.md#installing-a-new-dependency)
- [PSCi Setup](https://github.com/sajalcody/hello-purescript/blob/master/docs/Setup.md#psci-setup)

>### Project Initialisation
```sh
$ pulp init
```

```
creates
  - src/Main.purs (Project Source files)
  - test/Main.purs (Project test files)
  - bower.json(manifest file for package management) with basic dependencies
  - bower_components/ (Project Dependencies mentioned in bower.json)
  - .gitignore (is created automatically)
  - .purs-repl -> ??
```

>### Building Project

```sh
$ pulp build
```

- Compiles all the files (in bower_components and source files in `src/`)
```
creates
  - .pulp-cache/ An Empty directory
  - output/ (Compiled javascript files)
```
```sh
$ pulp -w build
``` 
- Build in watch mode

>### Running Project

```sh
$ pulp run
```

- compiles and runs the project
- This command will first run `pulp build` for you, if necessary, then launch your compiled code using `node`

>### REPL (PSCI) for Project

```sh
$ pulp repl
```
- Compiles all the files (bower_components, src/, test/) and opens PSCi (repl)
- Note: for repl, `purescript-psci-support` must be added as dependency.
```
creates
  - .psci_modules/
```

# Starting with an existing project

To install dependencies:
```sh
$ npm install
$ bower install
```
or
```sh
$ npm i
$ bower i
```
## Installing a new dependency
A new dependency can be installed either by
1. Manually adding in `bower.json` and reinstalling the dependencies.
2. Using bower
```sh
$ bower install --save purescript-package-name
```
This command will install the dependency and will add it `bower.json`.
## PSCi Setup

PSCi -> PureSCript Interactive: REPL(read-eval-print loop) for PureScript

Either of the following:

1. Using `spago`

    [Doc](https://github.com/purescript/documentation/blob/master/guides/PSCi.md)

2. Using `pulp`

    ```pulp repl```

## Resources

- [PureScript by Example Book](https://leanpub.com/purescript/read)