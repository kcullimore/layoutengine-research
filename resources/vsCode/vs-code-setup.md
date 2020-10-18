# VS Code 

## Remote Development using SSH: Linux Server
- [Setup Instructions](https://code.visualstudio.com/docs/remote/ssh) 
  - [FAQ](https://code.visualstudio.com/docs/remote/faq)
  - [Remote Development plugin](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
  - General installation instructions:
    - Install VS code on your local machine
    - Install VS Code Remote Development plugin  (click "extensions" icon in left nav)
    - Make sure you can SSH into the remote machine via terminal first (correct as needed)
    - Click on the "Remote Explorer" icon on the left nav
    - Add a SSH host and enter password when prompted
  
## Remote Development using SSH: Docker
  - [Docker Plugin](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
  - [Overview](https://code.visualstudio.com/docs/containers/overview)
  - [Connect to remote Docker over SSH](https://code.visualstudio.com/docs/containers/ssh)
  
## Useful Features and Plugins
  - [Marketplace](https://marketplace.visualstudio.com/): Search and find plugins
  - [Markdown](https://code.visualstudio.com/docs/languages/markdown): Preview Markdown files out-of-the box and extend with themes and lintr's with additional plugsin. 
    - Include support for Rmarkdown by adding `"files.associations": {"*.Rmd": "markdown"}` to `$HOME/.config/Code/User/settings.json`
  - [HTML Preview](https://marketplace.visualstudio.com/items?itemName=tht13.html-preview-vscode): Preview HTML files
  - R Support 
    - [vscode-R](https://marketplace.visualstudio.com/items?itemName=Ikuyadeu.r): R Extension 
    - [vscode-r-lsp](https://marketplace.visualstudio.com/items?itemName=REditorSupport.r-lsp): R Language Server Client 
	    - Requires [R Language Server](https://github.com/REditorSupport/languageserver) is installed
        - `install.packages("languageserver")`
    - [vscode-pdf](https://marketplace.visualstudio.com/items?itemName=tomoki1207.pdf): View PDFs 


## Working with EC2

### Shell commands
Download and change ownership of key
mv ~/Downloads/iah-test.pem .
chmod 400 iah-test.pem

Setup EC2 with Public IP with SSH & HTML ports open

SSH into running EC2 
ssh -i "iah-test.pem" ubuntu@52.53.148.186

Copy file
scp -i "iah-test.pem" /home/krc/linCode/DOM_research/resources/ec2/ec2-setup.sh ubuntu@52.53.148.186:/home/ubuntu

Copy folder
scp -i "iah-test.pem" -r /home/krc/linBox/akl/X_PastClasses/ST_769/assess/lab_02 ubuntu@52.53.148.186:/home/ubuntu/code
