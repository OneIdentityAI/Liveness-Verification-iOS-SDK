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
In your xcode **Project files explorer** on the left section, click on your **project root folder**, click on your project name located at **Targets**, navigate to **Build Phases** and click to expand **Link Binary With Library**. Click on the **+** icon and pick your framework from your project folder. 

Navigate to **General**, click to expand **Embedded Binaries**. Click on the **+** icon and pick your framework from your project folder.

Open your **info.plist** and add the **Privacy - Camera Usage Description** with your own **Description on camera usage** to allows your app to request user for camera access permission.

You can now write code to trigger the LivenessViewController with callback on the response.
Assuming we would like to trigger LivenessViewController from our ViewController.swift, the most basic way to from a view controller with a single button is as follow:

```
import UIKit
import LivenessVerification

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func buttonLivenessClicked(_ sender: UIButton)
    {
        let frameworkBundle = Bundle(identifier: "ai.1id.liveness.ios.LivenessVerification")        
        if let viewController = UIStoryboard(name: "LivenessStoryboard", bundle: frameworkBundle).instantiateViewController(withIdentifier: "LivenessViewControllerID") as? LivenessViewController
        {
            viewController.token = "This is your wallet token"
            viewController.apikey = "This is your API Key"
            viewController.callback = { message in
                //message in JSON Response
            }
            if let navigator = navigationController
	    {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}
```
This line is important in order to load the storyboard from the LivesnessVerification.framework
```
let frameworkBundle = Bundle(identifier: "ai.1id.liveness.ios.LivenessVerification")        
```
We would then use the storyboard to initialize our LivesnessViewController as follow
```
if let viewController = UIStoryboard(name: "LivenessStoryboard", bundle: frameworkBundle).instantiateViewController(withIdentifier: "LivenessViewControllerID") as? LivenessViewController
{
}
```
In order to ensure everything works, we will need to have an api key. You can obtain a [Free API Key Here](https://dev.1id.ai)
```
viewController.token = "This is your wallet token"
viewController.apikey = "This is your API Key"
```
To trigger the LivenessViewController, just embed a navigation controller into your view controller and push view controller as follow
```
if let navigator = navigationController
{
    navigator.pushViewController(viewController, animated: true)
}
```
To receive the json response after the verification successful, add the following callback
```
viewController.callback = { message in
    //message in JSON Response
}
```
Result will be as follow in json:
```
{
    "status": "200",
    "type": "ok",
    "message": "Liveness verification successful",
    "selfie_image": "a3e40f30-7659-11e9-bada-bf2c9bd03a26.png"
}
```
To view the uploaded file, refer to the following document to trigger the function by passing in file_name value into document_name
[1id API Document](https://doc.1id.ai/#operation/view-upload)
