//
//  XVimSettingsManager.m
//  XVim
//
//  Created by Chris Jimison on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XVimSettingsManager.h"

@implementation XVimSettingsManager

static XVimSettingsManager* _sInstance = nil;
@synthesize colors, compType;

+(XVimSettingsManager*) instance
{
    @synchronized([XVimSettingsManager class])
    {
        if(!_sInstance)
        {
            _sInstance = [[XVimSettingsManager alloc] init];
        }
    }
    
    return _sInstance;
}

+(id)alloc
{
    @synchronized([XVimSettingsManager class])
    {
        NSAssert(_sInstance == nil, @"Attempted to allocate a second instance of a singleton. This is bad");
        _sInstance = [super alloc];
    }
    return _sInstance;
}
+(void) destroy
{
    @synchronized([XVimSettingsManager class])
    {
        [_sInstance release];
        _sInstance = nil;
    }
    
}
-(id) init
{
    self = [super init];
    if(self)
    {
        // Check if the default settings file exists
        NSBundle* bundle = [NSBundle bundleForClass:[XVimSettingsManager class]];
        NSString* path = [bundle bundlePath];
        
        NSArray* pathArray = [path pathComponents];
        int len = (int)[pathArray count];
        thePath = @"";
        for(int idx = 0; idx < (len - 2); ++idx)
        {
            thePath = [NSString stringWithFormat:@"%@%@/", thePath, [pathArray objectAtIndex:idx]];
        }
        thePath = [NSString stringWithFormat:@"%@XVimSettings.plist", thePath];
        if([[NSFileManager defaultManager] fileExistsAtPath:thePath])
        {
            [self readFromFile];
        }
        else
        {
            colors = [[NSMutableDictionary alloc] init];
            [colors setObject:[NSColor colorWithSRGBRed:0.0 green:0.0 blue:0.0 alpha:0.0]
                       forKey:@"CommandLine_Background"];

            [colors setObject:[NSColor colorWithSRGBRed:0.0 green:0.0 blue:0.0 alpha:0.0]
                       forKey:@"CommandLine_Status_Background"];
            
            [colors setObject:[NSColor colorWithSRGBRed:0.0 green:0.0 blue:0.0 alpha:0.0]
                       forKey:@"CommandLine_String_Empty "];
            [colors setObject:[NSColor colorWithSRGBRed:0.0 green:0.0 blue:0.0 alpha:1.0]
                       forKey:@"CommandLine_String_Empty_Status_Color "];
            
            [colors setObject:[NSColor colorWithSRGBRed:0.0 green:0.0 blue:0.0 alpha:0.6]
                       forKey:@"CommandLine_String_Non_Empty "];
            [colors setObject:[NSColor colorWithSRGBRed:1.0 green:1.0 blue:1.0 alpha:1.0]
                       forKey:@"CommandLine_String_Non_Empty_Status_Color "];
            [colors setObject:[NSColor colorWithSRGBRed:1.0 green:1.0 blue:1.0 alpha:1.0]
                       forKey:@"CommandLine_String_Non_Empty_Text_Color "];
    
            [colors setObject:[NSColor colorWithDeviceRed:0.0 green:0.0 blue:0.0 alpha:0.5]
                       forKey:@"DVTSourceTextView_color"];
            
            compType = NSCompositePlusLighter;
           
            [self saveToFile];
        }
        compType = NSCompositePlusLighter;
    }
    
    return self;
}

-(void) dealloc
{
    [colors release];
}
-(void) readFromFile
{
    // Read the settings file
    NSDictionary* settings = [NSDictionary dictionaryWithContentsOfFile:thePath];
    
    // Read out the color dictionary
    colors = [[NSMutableDictionary alloc] init];
    NSDictionary* colorsDic = [settings objectForKey:@"colors"];
    for(NSString* key in colorsDic)
    {
        NSDictionary* colorDic = [colorsDic objectForKey:key];
        NSColor* color = [NSColor colorWithSRGBRed: [[colorDic objectForKey:@"r"] floatValue]
                                              green:[[colorDic objectForKey:@"g"] floatValue]
                                              blue:[[colorDic objectForKey:@"b"] floatValue]
                                              alpha:[[colorDic objectForKey:@"a"] floatValue]];
        [colors setObject:color forKey:key];
    }
    compType = [[settings objectForKey:@"CompType"] unsignedIntegerValue];
}

-(void) saveToFile
{  
    NSMutableDictionary* settings = [NSMutableDictionary dictionary];
    
    // Cache off the current values for the colors
    NSMutableDictionary* theColors = [NSMutableDictionary dictionary];
    for(NSString* key in colors)
    {
        NSColor* color = [colors objectForKey:key];
        NSMutableDictionary* values = [NSMutableDictionary dictionary];
        NSNumber* red = [NSNumber numberWithFloat:[color redComponent]];
        NSNumber* green = [NSNumber numberWithFloat:[color greenComponent]];
        NSNumber* blue = [NSNumber numberWithFloat:[color blueComponent]];
        NSNumber* alpha = [NSNumber numberWithFloat:[color alphaComponent]];
        [values setObject:red forKey:@"r"];
        [values setObject:green forKey:@"g"];
        [values setObject:blue forKey:@"b"];
        [values setObject:alpha forKey:@"a"];
        
        [theColors setObject:values forKey:key];
    }
    
    [settings setObject:theColors forKey:@"colors"];
    [settings setObject:[NSNumber numberWithUnsignedInteger:compType] forKey:@"CompType"];
    
    // Write the settings to the file
    [settings writeToFile:thePath atomically:NO];
}

@end
