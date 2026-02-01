# Mathemateach

Mathemateach is a typst package (not yet published on the [Typst  universe](https://typst.app/universe/)) which contains tools for writing lecture notes for teaching mathematics. For now, it only contains highly customisable theorem boxes and comes along with four themes that can be used out of the box. But there will be additional features soon (for example some custom CetZ elements).

> [!NOTE]
> As this package was primary build for personal use, there is currently no documentation. The code is also a bit messy (and not at all commented !)

## Dependencies
Mathemateach is build on top of the [showybox](https://github.com/Pablo-Gonzalez-Calderon/showybox-package) package and also uses [rich-counters](https://github.com/jbirnick/typst-rich-counters) counters and [elembic](https://github.com/PgBiel/elembic) custom elements and set/show rules.

## Supported langages

French, German and English are supported and theorem titles depend on text langage (default to english). Can be changed by using the usual set rule:

```typst
#set text(lang: "en")
```

## Quickstart
Simply download the package locally (as described on the [Typst Packages](https://github.com/typst/packages)) repository. Then import and use mathemateach. 

### simple theme
```typst
// import simple style
#import theorem.simple: * 

#set page(height: auto, margin: 1cm)
#set heading(numbering: "1.")

// applies the imported style, with theorem counter based on level-1 headings
#show: show-theorem.with(counter-level: 1)  

= Géométrie euclidienne

// a generic customisable box with matching styling (use (counter, name) => [] for custom title)
#generic(title: (counter, name) => [*Formula*], counter: none)[This is an important formula.]

#definition[ #lorem(20) ]

#remark[ #lorem(20) ]

#lemma[ #lorem(20) ]

#example[ #lorem(20) ]

#proposition[ #lorem(20) ]

#notation[ #lorem(20) ]

// a theorem followed by its proof
#theorem(label: <thm1>, name: [Pythagorean Theorem])[ #lorem(30) ]
#proof[ This is a proof of @thm1. ]
```

![image](./theorem/examples/simple-test.png)

### box-colorful theme
```typst
#import "@local/mathemateach:0.1.0": *

// import box style
#import theorem.box: * 

#set page(height: auto, margin: 1cm)
#set heading(numbering: "1.")

#show: show-theorem.with(counter-level: 1)  

[...]

```

![image](./theorem/examples/box-test.png)

### fancy-colorful theme
```typst
#import "@local/mathemateach:0.1.0": *

// import fancy style
#import theorem.fancy: * 

#set page(height: auto, margin: 1cm)
#set heading(numbering: "1.")

#show: show-theorem.with(counter-level: 1)  

[...]

```

![image](./theorem/examples/fancy-test.png)

### bar-colorful theme
```typst
#import "@local/mathemateach:0.1.0": *

// import bar style
#import theorem.bar: * 

#set page(height: auto, margin: 1cm)
#set heading(numbering: "1.")

#show: show-theorem.with(counter-level: 1)  

[...]

```

![image](./theorem/examples/bar-test.png)

### tbar-colorful theme
```typst
#import "@local/mathemateach:0.1.0": *

// import tbar style
#import theorem.tbar: * 

#set page(height: auto, margin: 1cm)
#set heading(numbering: "1.")

#show: show-theorem.with(counter-level: 1)  

[...]

```

![image](./theorem/examples/tbar-test.png)

### smallbox-colorful theme
```typst
#import "@local/mathemateach:0.1.0": *

// import smallbox style
#import theorem.smallbox: * 

#set page(height: auto, margin: 1cm)
#set heading(numbering: "1.")

#show: show-theorem.with(counter-level: 1)  

[...]

```

![image](./theorem/examples/smallbox-test.png)
