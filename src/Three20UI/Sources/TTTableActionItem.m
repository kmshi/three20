//
//  TTTableActionItem.m
//  TTCatalog
//
//  Created by kshi on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Three20UI/TTTableActionItem.h"

// Core
#import "Three20Core/TTCorePreprocessorMacros.h"

@implementation TTTableActionItem

@synthesize target     = _target;
@synthesize action     = _action;
@synthesize btnTitle     = _btnTitle;

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_btnTitle);
    _target = nil;
    _action = nil;
    [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithTitle:(NSString*)title caption:(NSString*)caption text:(NSString*)text
          timestamp:(NSDate*)timestamp imageURL:(NSString*)imageURL 
          target:(id)target action:(SEL)action buttonTitle:(NSString*)btnTitle{
    TTTableActionItem* item = [TTTableActionItem itemWithTitle:title caption:caption 
                                                          text:text timestamp:timestamp 
                                                      imageURL:imageURL URL:nil];
    item.target = target;
    item.action = action;
    item.btnTitle = btnTitle;
    return item;
}

#pragma mark -
#pragma mark NSCoding


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithCoder:(NSCoder*)decoder {
	self = [super initWithCoder:decoder];
    if (self) {
        self.btnTitle = [decoder decodeObjectForKey:@"btnTitle"];
    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)encodeWithCoder:(NSCoder*)encoder {
    [super encodeWithCoder:encoder];
    if (self.btnTitle) {
        [encoder encodeObject:self.btnTitle forKey:@"btnTitle"];
    }
}

@end
