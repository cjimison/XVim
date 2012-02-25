//
//  XVimSettingsController.h
//  XVim
//
//  Created by Chris Jimison on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "XVim.h"

@interface XVimSettingsController : NSObject
{
    IBOutlet NSColorWell* commandLineBackground;
    IBOutlet NSColorWell* commandLineStatusBackground;
    IBOutlet NSColorWell* commandLineStringEmpty;
    IBOutlet NSColorWell* commandLineStringEmptyStatusColor;
    IBOutlet NSColorWell* commandLineStringNonEmpty;

    IBOutlet NSColorWell* commandLineStringNonEmptyStatusColor;
    IBOutlet NSColorWell* commandLineStringNonEmptyTextColor;
    IBOutlet NSColorWell* sourceTextViewColor;
    IBOutlet NSWindow* window;
    IBOutlet NSObject* owner;
}

-(IBAction)changeCommandLineBackground:(id)sender;
-(IBAction)changeCommandLineStatusBackground:(id)sender;
-(IBAction)changeCommandLineStringEmpty:(id)sender;
-(IBAction)changeCommandLineStringEmptyStatusColor:(id)sender;
-(IBAction)changeCommandLineStringNonEmpty:(id)sender;

-(IBAction)changeCommandLineStringNonEmptyStatusColor:(id)sender;
-(IBAction)changeCommandLineStringNonEmptyTextColor:(id)sender;
-(IBAction)changeSourceTextViewColor:(id)sender;

- (IBAction)dismissSheet:(id)sender;

@end
