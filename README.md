# Mathemateach

Mathemateach is a typst package (not yet published on the [Typst  universe](https://typst.app/universe/)) which contains tools for writing lecture notes for teaching mathematics. For now, it only contains highly customisable theorem boxes and comes along with four themes that can be used out of the box.

> [!NOTE]
> As this package was primary build for personal use, there is currently no documentation. The code is also a bit messy (and not at all commented !)

## Dependencies
Mathemateach is build on top of the [showybox](https://github.com/Pablo-Gonzalez-Calderon/showybox-package) package and also uses [rich-counters](https://github.com/jbirnick/typst-rich-counters) counters and [elembic](https://github.com/PgBiel/elembic) custom elements and set/show rules.

## Quickstart
Simply download the package locally (as described on the [Typst Packages](https://github.com/typst/packages)) repository. Then import and use mathemateach

### simple theme
```typst
#import "@local/mathemateach:0.1.0": *

// import simple style
#import theorem.simple: * 

#set page(height: 12cm)

// *optional*: personal default settings (fonts, layout, etc.)
#show: apply-default 

// applies the imported style, with theorem counter based on level-1 headings
#show: show-theorem.with(counter-level: 1)  

// first chapter
= Géométrie euclidienne

// a simple definition
#definition[ #lorem(20) ]

// a simple theorem followed by its proof
#theorem(label: <thm1>, name: [Théorème de Pythagore])[ #lorem(30) ]
#proof[ Ceci est une démonstration du @thm1. #lorem(30) ]

```

![image](./examples/simple-test.png)

### box-colorful theme
```typst
#import "@local/mathemateach:0.1.0": *

// import box-colorful style
#import theorem.box-colorful: * 

#show: apply-default 
#show: show-theorem.with(counter-level: 1)  

[...]

```

![image](./examples/box-colorful-test.png)

### fancy-colorful theme
```typst
#import "@local/mathemateach:0.1.0": *

// import fancy-colorful style
#import theorem.fancy-colorful: * 

#show: apply-default 
#show: show-theorem.with(counter-level: 1)  

[...]

```

![image](./examples/fancy-colorful-test.png)

### bar-colorful theme
```typst
#import "@local/mathemateach:0.1.0": *

// import bar-colorful style
#import theorem.bar-colorful: * 

#show: apply-default 
#show: show-theorem.with(counter-level: 1)  

[...]

```

![image](./examples/bar-colorful-test.png)
