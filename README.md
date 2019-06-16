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
Assuming we would like to trigger LivenessViewController from our ViewController.swift:

```
import UIKit
import LivenessVerification

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonLivenessClicked(_ sender: UIButton)
    {
        let frameworkBundle = Bundle(identifier: "ai.1id.liveness.ios.LivenessVerification")
        //let storyboard = UIStoryboard(name: "LivenessStoryboard", bundle: frameworkBundle)
        
        if let viewController = UIStoryboard(name: "LivenessStoryboard", bundle: frameworkBundle).instantiateViewController(withIdentifier: "LivenessViewControllerID") as? LivenessViewController
        {
            viewController.token = "76d4098537eefb89d98a31c5d2a48cdc9c51c5a01c8becef1591c5de15f490b28e6a135425007f8c1b1c950ecf2399cb00aee878105b6ddfe7327ad848427718"
            viewController.apikey = "9c24abc8797a4554a54f3c6c26c705d9"
            viewController.callback = { message in
                let alert = UIAlertController(title:"Response", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                }))
                self.present(alert, animated: true)
            }
            if let navigator = navigationController {
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
}
```

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
