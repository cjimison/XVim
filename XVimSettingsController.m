//
//  XVimSettingsController.m
//  XVim
//
//  Created by Chris Jimison on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XVimSettingsController.h"
#import "XVimSettingsManager.h"

@implementation XVimSettingsController

-(void) awakeFromNib
{   
    NSColor* theColor = [[[XVimSettingsManager instance] colors] objectForKey:@"CommandLine_Background"];
    if(theColor)
    {
        [commandLineBackground setColor:theColor];
    }

    theColor = [[[XVimSettingsManager instance] colors] objectForKey:@"CommandLine_Status_Background"];
    if(theColor)
    {
        [commandLineStatusBackground setColor:theColor];
    }

    theColor = [[[XVimSettingsManager instance] colors] objectForKey:@"CommandLine_String_Empty"];
    if(theColor)
    {
        [commandLineStringEmpty setColor:theColor];
    }

    theColor = [[[XVimSettingsManager instance] colors] objectForKey:@"CommandLine_String_Empty_Status_Color"];
    if(theColor)
    {
        [commandLineStringEmptyStatusColor setColor:theColor];
    }

    theColor = [[[XVimSettingsManager instance] colors] objectForKey:@"CommandLine_String_Non_Empty"];
    if(theColor)
    {
        [commandLineStringNonEmpty setColor:theColor];
    }

    theColor = [[[XVimSettingsManager instance] colors] objectForKey:@"CommandLine_String_Non_Empty_Status_Color"];
    if(theColor)
    {
        [commandLineStringNonEmptyStatusColor setColor:theColor];
    }

    theColor = [[[XVimSettingsManager instance] colors] objectForKey:@"CommandLine_String_Non_Empty_Text_Color"];
    if(theColor)
    {
        [commandLineStringNonEmptyTextColor setColor:theColor];
    }

    theColor = [[[XVimSettingsManager instance] colors] objectForKey:@"CommandLine_String_Non_Empty_Text_Color"];
    if(theColor)
    {
        [commandLineStringNonEmptyTextColor setColor:theColor];
    }

    theColor = [[[XVimSettingsManager instance] colors] objectForKey:@"DVTSourceTextView_color"];
    if(theColor)
    {
        [sourceTextViewColor setColor:theColor];
    }
    
    XVim* xvim = (XVim*)owner;
    [xvim setSheet:window];
}

-(IBAction)changeCommandLineBackground:(id)sender
{
    NSColor* color = [commandLineBackground color];
    [[[XVimSettingsManager instance] colors] setObject:color forKey:@"CommandLine_Background"];
    [[XVimSettingsManager instance] saveToFile];
}

-(IBAction)changeCommandLineStatusBackground:(id)sender
{
    NSColor* color = [commandLineStatusBackground color];
    [[[XVimSettingsManager instance] colors] setObject:color forKey:@"CommandLine_Status_Background"];
    [[XVimSettingsManager instance] saveToFile];
}

-(IBAction)changeCommandLineStringEmpty:(id)sender
{
    NSColor* color = [commandLineStringEmpty color];
    [[[XVimSettingsManager instance] colors] setObject:color forKey:@"CommandLine_String_Empty"];
    [[XVimSettingsManager instance] saveToFile];
}

-(IBAction)changeCommandLineStringEmptyStatusColor:(id)sender
{
    NSColor* color = [commandLineStringEmptyStatusColor color];
    [[[XVimSettingsManager instance] colors] setObject:color forKey:@"CommandLine_String_Empty_Status_Color"];   
    [[XVimSettingsManager instance] saveToFile];
}

-(IBAction)changeCommandLineStringNonEmpty:(id)sender
{
    NSColor* color = [commandLineStringNonEmpty color];
    [[[XVimSettingsManager instance] colors] setObject:color forKey:@"CommandLine_String_Non_Empty"];
    [[XVimSettingsManager instance] saveToFile];
}

-(IBAction)changeCommandLineStringNonEmptyStatusColor:(id)sender
{
    NSColor* color = [commandLineStringNonEmptyStatusColor color];
    [[[XVimSettingsManager instance] colors] setObject:color forKey:@"CommandLine_String_Non_Empty_Status_Color"];
    [[XVimSettingsManager instance] saveToFile];
}

-(IBAction)changeCommandLineStringNonEmptyTextColor:(id)sender
{
    NSColor* color = [commandLineStringNonEmptyTextColor color];
    [[[XVimSettingsManager instance] colors] setObject:color forKey:@"CommandLine_String_Non_Empty_Text_Color"];
    [[XVimSettingsManager instance] saveToFile];
}

-(IBAction)changeSourceTextViewColor:(id)sender
{
    NSColor* color = [sourceTextViewColor color];
    [[[XVimSettingsManager instance] colors] setObject:color forKey:@"DVTSourceTextView_color"];
    [[XVimSettingsManager instance] saveToFile];
}

- (IBAction)dismissSheet:(id)sender
{
    [[NSApplication sharedApplication] endSheet: window returnCode: [(NSControl*)sender tag]];
    [[XVimSettingsManager instance] saveToFile];
}

@end
