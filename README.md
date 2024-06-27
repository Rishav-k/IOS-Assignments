# IOS-Assignments
## Assignment 1

###a. App Launch
When the app is launched, the following methods are invoked:

**AppDelegate:**

**application(_:willFinishLaunchingWithOptions:)** – Called when the launch process is almost done, and the app is almost ready to run.
**application(_:didFinishLaunchingWithOptions:)** – Called when the app has finished launching and is about to enter the active state.
SceneDelegate:

**scene(_:willConnectTo:options:)** – Called when the system is connecting a scene session to the app.
**sceneDidBecomeActive(_:)** – Called when the scene has moved from an inactive state to an active state.

**b. App Background (Press iPhone home button)**
When the app is sent to the background, the following methods are invoked:

**AppDelegate:**

**applicationDidEnterBackground(_:)** – Called when the app enters the background.
SceneDelegate:

**sceneWillResignActive(_:)** – Called when the scene will move from an active state to an inactive state.
**sceneDidEnterBackground(_:)** – Called when the scene enters the background.


**c. Phone Locked (Lock Phone using simulator lock button)**
Locking the phone invokes these methods:

**AppDelegate:**

**applicationWillResignActive(_:)** – Called when the app is about to move from active to inactive state due to interruptions (such as incoming calls or SMS messages).
SceneDelegate:

**sceneWillResignActive(_:)** – Called when the scene will move from an active state to an inactive state.

**d. Simulate Memory Warning (Simulator option -> Debug -> Simulate memory warning)**
Simulating a memory warning triggers the following method:

**AppDelegate:**

**applicationDidReceiveMemoryWarning(_:)** – Called when the app receives a memory warning from the system.

**e. App Kill**
When the app is killed (either by the user or the system), the following methods are invoked:

**AppDelegate:**

**applicationWillTerminate(_:)** – Called when the app is about to terminate. This method is not called when the app is killed by the user from the app switcher.

