# Solitics-Packge
### A Wrapper Package for Solitics Swift SDK.
_____
## Overview

TO DO:...

## Table of Contents

1. [JFrog Registry Authentication](#installation)
    - [Keychain Setup](#keychain-setup)

2. [Usage](#usage)
    - [Pulling the package using SPM](#initializing-the-sdk)

3. [Support](#support)
    - [Contact Us](#contact-us)
    - [Issue Tracker](#issue-tracker)
____

### JFrog Registry Authentication

* #### Keychain Setup
For authentication with the private JFrog Swift Registry, you need to set up an internet password in your keychain. Follow these steps:

1. Open Keychain Access on your macOS.
2. Click on File > New Password Item.
   <br></br>
   ![Alt Text](./Images/1.png)
   <br></br>
3. Enter the following details:
   * Name: https://soliticsmobilesdk.jfrog.io
   * Account Name: [Your Email]
   * Password: [Your Password]
   <br></br>
   ![Alt Text](./Images/2.png)
   <br></br>
Add the password, and the SPM will use it for authentication with jfrog.
____

### Usage

* #### Pulling the package using SPM

To add a .git repository to your Xcode project, follow these steps:

1. Open Xcode and navigate to your project.
2. Select your project in the Project Navigator.
3. Click on "Swift Packages" tab.
4. Click on the "+" button to add a new package.
5. Enter the repository URL: https://github.com/solitics/solitics-package.
   <br></br>
   ![Alt Text](./Images/3.png)
   <br></br>
6. asd
    <br></br>
    ![Alt Text](./Images/4.png)
     <br></br>
6. Xcode will ask you to enter the password for the keychain we added above, once granted Xcode will fetch the repository and add it to your project.

