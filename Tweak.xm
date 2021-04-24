#import "Tweak.h"

%hook YTAppViewController

- (void)viewDidLoad {
    %orig;
    [self startYouTubeDarkModeSync];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSDistributedNotificationCenter defaultCenter] removeObserver:self];
    %orig;
}

%new
- (void)startYouTubeDarkModeSync { //match YouTube's appearance to the current state of what "parent" to respect
	if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
		[self changeToDarkOrLightMode:3];
	}
	else if (self.traitCollection.userInterfaceStyle == UIUserInterfaceStyleLight) {
		[self changeToDarkOrLightMode:2];
	}
}

%new
- (void)changeToDarkOrLightMode:(NSInteger)newMode {
    YTPageStyleController *darkModeController = MSHookIvar<YTPageStyleController *>(self, "_pageStyleController"); //YTPageStyleController is an ivar of YTAppViewController, not an @property
    darkModeController.appThemeSetting = newMode; //pass 2 to change to YouTube's built-in light mode. pass 3 to change to dark mode
}
%end

%hook YTMainWindow
- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection { //this method is called when iOS 13's dark mode is toggled
    %orig;
    YTAppDelegate *delegate = (YTAppDelegate *)[[UIApplication sharedApplication] delegate];
    [(YTAppViewController *)delegate.window.rootViewController startYouTubeDarkModeSync];
}
%end
