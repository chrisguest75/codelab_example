summary: Building Codelabs
id: building-codelabs
categories: codelabs
tags: build 
status: Published 
authors: ChrisGuest
Feedback Link: mailto:chris.guest
<!-- copied from  -->

# Building CodeLabs
<!-- ------------------------ -->
## Overview 
Duration: 1

### Information  
Codelabs are a great way of walking new starters and employees through team processes and conventions.
The public [Codelabs](https://codelabs.developers.google.com/) can be used to learn anything from Tensorflow through to using Cloud APIs.

This repo builds the [Tools](https://github.com/googlecodelabs/tools) into a container that can be used to build a statically hosted image.  

Walking through these steps will allow you build your own container and add your own Codelabs.

### How it works
We use the [Codelabs](https://codelabs.developers.google.com/) to build a base container, passing it into a multistage build that processes markdown files to build a final static hosted web folder in an nginx container.  

It requires the [process-labs.sh](labs/process-labs.sh) script to convert the markdown and copy across images, icons and append css.  

The processed output in the ./dist folder is then put into a container hosting static content (using nginx).

<!-- ------------------------ -->
## Clone or fork the repo 
Duration: 5

### Fork
You can use github to fork the repo into your own account.  

Goto [https://github.com/chrisguest75/codelab_example](https://github.com/chrisguest75/codelab_example) and fork  

### Clone
```
git clone https://github.com/chrisguest75/codelab_example
```

NOTE: If you choose to clone the repo then you need to set a new origin by removing the old one.  
```
git remote remove origin     
git remote add origin git@github.com:<account>/<repo> 
git push
```

<!-- ------------------------ -->
## Build it locally
Duration: 5

### Building
To build the base container used to build the example codelabs.  The base container will use the [Codelabs](https://codelabs.developers.google.com/) repo. It will install some necessary tools (claat) and set a structure to process a set of markdown defined codelabs.  

```
./build_base.sh
```

To rebuild the codelabs using the base container.  It will also run and host on port 8000 for testing.

```
./build_codelabs.sh
```

You should see a screen like the following.

![Codelabs](./assets/example_landing_page.png)


<!-- ------------------------ -->
## Add a new lab
Duration: 10

### Add markdown
Go to the ./labs folder and add a new markdown file

```
summary: My First Codelab
id: myfirst-codelab
categories: codelabs
tags: build 
status: Published 
authors: Your name
Feedback Link: mailto:your.name

# My First CodeLob
<!-- ------------------------ -->
## Overview 
Duration: 1

### Information  


<!-- ------------------------ -->
## Second page
Duration: 1

### Information  

```

<!-- ------------------------ -->
## Adding images
Duration: 10

### Add an image to your labs
Go to the ./labs/assets folder and add a png picture. 

Add a reference to it in the markdown. 
```
![Your picture](./assets/your_picture.png)
```

### Resizing
Install and use imagemagick to resize images
```
brew install imagemagick
```

```
mogrify -resize 50% ./assets/your_picture.png
```

<!-- ------------------------ -->
## Congratulations
Duration: 5

### Key Skills
You have now added your own lab.  Use your new found knowledge to build out more.