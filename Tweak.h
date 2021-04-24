#import "UIKit/UIKit.h"

@interface NSDistributedNotificationCenter : NSNotificationCenter //detect when DarkModeToggle is toggled
@end

@interface YTAppViewController : UIViewController
@property UIViewController *childModalViewController;
- (void)viewDidLoad;
- (void)dealloc;
- (void)startYouTubeDarkModeSync;
- (void)changeToDarkOrLightMode:(NSInteger)newMode;
@end

@interface YTMainWindow : UIWindow //detect when iOS 13 dark mode is toggled
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection;
@end

@interface YTAppDelegate : UIResponder
- (UIWindow *)window;
@end

@interface YTPageStyleController : NSObject //this class controls YouTube's built-in dark mode
@property NSInteger appThemeSetting;
@end
