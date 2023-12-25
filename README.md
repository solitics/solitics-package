# Solitics-Packge
### A Wrapper Package for Solitics Swift SDK.
_____
## Overview

SoliticsSDK relies on JFrog Artifactory to host its framework. The registry, in this case,
is private and can only be accessed through JFrog authentication. To integrate SoliticsSDK seamlessly,
setting the registry for Swift Package Manager becomes essential. This readme will guide you in the process of
gaining access to it.

## Table of Contents

1. [JFrog Configuration](#installation)
    - [Keychain Authentication](#keychain-authentication)
    - [Set Registry](#set-registry)

2. [Usage](#usage)
    - [Pulling the package using SPM](#pulling-the-package-using-spm)

3. [Support](#support)
    - [Troubleshoot](#troubleshoot)
    - [Contact Us](#contact-us) ###### TODO
____

## JFrog Configuration

* ### Keychain Authentication
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

* ### Set Registry
Swift Package Manager points to a default registry. In the following steps, 
we will point the registry to Solitics Artifactory instead.

A few side notes to consider before procedding:
* You can either set the registry **per Xcode project,** meaning only that project will have access
  to the registry, while others won't. **Or globally,** meaning every project will have access to it. Either way,
  there is a fallback that should point back to the default registry when a package is not found.
* Changing the registry requires a `Package.swift` file and can be deleted after the registry has been set.

1. Open Terminal
2. Navigate to your project directory

```bash
cd ~/MyAppDirectory/
```
3. Create a dummy 'Package.swift' file (if non exist)
```bash
touch ./Package.swift
```

4. Use the following command to set the registry
* If you want to add the registry for every project add the `--global` flag
```bash
swift package-registry set "https://soliticsmobilesdk.jfrog.io/artifactory/api/swift/"
```
If you want to double check the command sucedded run the following command
```bash
vi ./.swiftpm/configuration/registries.json
```
or if used the `--global` flag
```bash
vi ~/.swiftpm/configuration/registries.json
```
You should see the following content:
```json
{
  "authentication" : {

  },
  "registries" : {
    "[default]" : {
      "supportsAvailability" : false,
      "url" : "https://soliticsmobilesdk.jfrog.io/artifactory/api/swift/"
    }
  },
  "version" : 1
}
```
To exit enter `:qa!`

5. This step only applies to if you created a dummy `Package.swift`
```bash
rf -rf Package.swift
```
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
6. Choose a 'Dependency Rule' and select your target if not selected.
7. Click 'Add Pacakge'
    <br></br>
    ![Alt Text](./Images/4.png)
     <br></br>
8. Xcode will ask you to enter the password for the keychain we added above, once granted Xcode will fetch the repository and add it to your project.
9. You should now see the Solitics Package on the left side bar, navigate to your project target and make
sure the `SoliticsSwiftPackage` is present in `Frameworks, Libraries, and Embedded Content`
   ![Alt Text](./Images/5.png)

10. If its not present, click the `+` button and add from the manu
![Alt Text](./Images/6.png)

____

## Support

* ### Troubleshoot
When trying to add the Solitics .git repository
1. After setting the Keychain password xcode does not ask you to authenticate the jfrog registry, this means
you didnot configure the password correctly and should try the steps agian. [Keychain Authentication](#keychain-authentication)
2. When adding the swift package you are promoted with an error `no registry configured for 'swift' scope`.
   ![Alt Text](./Images/7.png)
    Either xcode holds an old registry cache and we need to force update it, or you didnt add the registry correctly,

first lets try to force update the registry:
   1. Clean you derived data folder,and build folder.
   2. Close xcode completly and reopen.
   
If this does not help, try re-adding the registry. [Set Registry](#set-registry)
      
