//
//  NSColorWellWithAlpha.m
//  XVim
//
//  Created by Chris Jimison on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NSColorWellWithAlpha.h"

@implementation NSColorWellWithAlpha

- (void)activate:(BOOL)exclusive
{
    [[NSColorPanel sharedColorPanel] setShowsAlpha:YES];
    [super activate: exclusive];
}

@end
