//
//  AppDelegate.m
//  Transit Authority
//
//  Created by Dan Grover on 6/6/13.
//  Copyright Brown Bag Labs LLC 2013. All rights reserved.
//

#import <TestFlightSDK/TestFlight.h>
#import "AppDelegate.h"
#import "GameScenario.h"
#import "GameState.h"
#import "MainGameScene.h"
#import "cocos2d.h"
#import "CCBReader.h"
#import "MainMenuController.h"

@implementation AppController{
    
    MainMenuController *mmControler;
}


//
-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// This is the only app delegate method you need to implement when inheriting from CCAppDelegate.
	// This method is a good place to add one time setup code that only runs when your app is first launched.
	
	// Setup Cocos2D with reasonable defaults for everything.
	// There are a number of simple options you can change.
	// If you want more flexibility, you can configure Cocos2D yourself instead of calling setupCocos2dWithOptions:.
	[self setupCocos2dWithOptions:@{
                                    // Show the FPS and draw call label.
                                    CCSetupShowDebugStats: @(NO),
                                    
                                    // More examples of options you might want to fiddle with:
                                    // (See CCAppDelegate.h for more information)
                                    
                                    // Use a 16 bit color buffer:
                                    //		CCSetupPixelFormat: kEAGLColorFormatRGB565,
                                    // Use a simplified coordinate system that is shared across devices.
                                    //		CCSetupScreenMode: CCScreenModeFixed,
                                    // Run in portrait mode.
                                    //		CCSetupScreenOrientation: CCScreenOrientationPortrait,
                                    // Run at a reduced framerate.
                                    //		CCSetupAnimationInterval: @(1.0/30.0),
                                    // Run the fixed timestep extra fast.
                                    //		CCSetupFixedUpdateInterval: @(1.0/180.0),
                                    // Make iPad's act like they run at a 2x content scale. (iPad retina 4x)
                                    //		CCSetupTabletScale2X: @(YES),
                                    }];
	
    
    [TestFlight setDeviceIdentifier:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
    [TestFlight takeOff:@"36d93e59-b263-4c26-a1e8-1fe37b7e934e"];
    
	return YES;
}



- (CCScene *) startScene{
    mmControler = [[MainMenuController alloc] init];
    return [CCBReader loadAsScene:@"MainMenu.ccbi" owner:mmControler];
}


/*
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Create the main window
	window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];


	// Create an CCGLView with a RGB565 color buffer, and a depth buffer of 0-bits
	CCGLView *glView = [CCGLView viewWithFrame:[window_ bounds]
								   pixelFormat:kEAGLColorFormatRGBA8	//kEAGLColorFormatRGBA8
								   depthFormat:GL_DEPTH24_STENCIL8
							preserveBackbuffer:NO
									sharegroup:nil
								 multiSampling:NO
							   numberOfSamples:0];
    [glView setMultipleTouchEnabled:YES];
    
    
	director_ = (CCDirectorIOS*) [CCDirector sharedDirector];
	director_.wantsFullScreenLayout = YES;
	[director_ setDisplayStats:NO]; // Display FSP and SPF
    [director_ setDelegate:self]; // for rotation and other messages
    [director_ setProjection:kCCDirectorProjection2D];
    [director_ setAnimationInterval:1.0/60];
	[director_ setView:glView]; // attach the openglView to the director
	

	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
	if( ! [director_ enableRetinaDisplay:YES] )	CCLOG(@"Retina Display Not supported");

	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
    [CCTexture2D PVRImagesHavePremultipliedAlpha:YES]; // Assume that PVR images have premultiplied alpha
    
	CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
	[sharedFileUtils setEnableFallbackSuffixes:NO];				// Default: NO. No fallback suffixes are going to be used
	[sharedFileUtils setiPhoneRetinaDisplaySuffix:@"@-hd"];		// Default on iPhone RetinaDisplay is "-hd"
	[sharedFileUtils setiPadSuffix:@""];					// Default on iPad is "ipad"
	[sharedFileUtils setiPadRetinaDisplaySuffix:@"@-hd"];	// Default on iPad RetinaDisplay is "-ipadhd"
    
	// Create a Navigation Controller with the Director
	navController_ = [[UINavigationController alloc] initWithRootViewController:director_];
	navController_.navigationBarHidden = YES;
	[window_ setRootViewController:navController_];
	[window_ makeKeyAndVisible];
    
    MainMenuViewController *mm = [[MainMenuViewController alloc] initWithNibName:nil bundle:nil];
    [navController_ pushViewController:mm animated:NO];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
	
  //  TouchCanceler *canceler = [[TouchCanceler alloc] init];
    //[director_.touchDispatcher addTargetedDelegate:canceler priority:0 swallowsTouches:YES];
    
    // testflight
    [TestFlight setDeviceIdentifier:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
    [TestFlight takeOff:@"36d93e59-b263-4c26-a1e8-1fe37b7e934e"];
    
    
    
	return YES;
}

*/



- (void) exitToMainMenu{
   
  
}
@end

