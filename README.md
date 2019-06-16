# Liveness-Verification-SDK
One Identity Liveness Verification SDK
This SDK is written in Swift and comes with a test project to showcase the usage of the library. The .framework library is located at
```
\MobileLivenessTest\LivenessVerification.framework
```
Includes the following .framework file into any location of your ios project
```
Your Project Folder
            |
            |---- LivenessVerification.framework
```
In your xcode **Project files explorer** on the left section, click on your **project root folder**, click on your name project located at **Targets**, navigate to **Build Phases** and click to expand **Link Binary With Library**. Click on the **+** icon and pick your framework from your project folder. 

Result will be as follow in json:
```
{
	"id":"e69f81d0-7f5d-11e9-a703-bdbc41d5c7bb",
	"type":"selfie",
	"file_name":"f46e42c0-7fac-11e9-8fea-15efd267c941.jpg"
}
```
To view the uploaded file, refer to the following document to trigger the function by passing in file_name value into document_name
[1id API Document](https://doc.1id.ai/#operation/view-upload)
