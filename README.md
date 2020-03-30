# DocumentationTools
## What is This Repository?
This repository provides support for [plantUML](https://plantuml.com), [ASCIIDoctor](https://asciidoctor.org), and Markdown based documentation.

## Pre-Requisities
1. [Visual Studio Code](https://code.visualstudio.com) 
2. Visual Studio Code plugin [Remote Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
3. Docker with access to internet.

## Tested On
1. Ubuntu-18.04
2. Machine with direct connection to internet. 

## Configurations for Machines Behind A Proxy
1. You may require an *authenticating proxy* such as [cntlm](http://cntlm.sourceforge.net)
2. You will need to configure Docker to work with your proxy 
3. You will need to configure ./devcontainer/devcontainer.json to work with proxy.

## How To Use 
1. Ensure pre-requisites are met,
2. Clone this repository, 
3. Open Visual Studio Code, Run the Remote-Containers: `Open Folder in Container...` command and select the folder where (the master branch of) this repository is cloned.
   1. See [this link](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) for more help.
