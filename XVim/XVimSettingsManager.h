//
//  XVimSettingsManager.h
//  XVim
//
//  Created by Chris Jimison on 2/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


@interface XVimSettingsManager : NSObject
{
    NSString* thePath;
}

@property (readwrite, retain) NSMutableDictionary* colors;
@property (readwrite) NSCompositingOperation compType;

+(XVimSettingsManager*) instance;

-(void) saveToFile;
-(void) readFromFile;

@end
