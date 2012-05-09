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

@synthesize actionDelegate      = _actionDelegate;
@synthesize buttonTitle         = _buttonTitle;
@synthesize cell                = _cell;
@synthesize enabled             = _enabled;

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)dealloc {
    TT_RELEASE_SAFELY(_buttonTitle);
    _actionDelegate = nil;
    _cell   = nil;
    [super dealloc];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
+ (id)itemWithTitle:(NSString*)title caption:(NSString*)caption text:(NSString*)text
          timestamp:(NSDate*)timestamp imageURL:(NSString*)imageURL
        buttonTitle:(NSString*)buttonTitle actionDelegate:(id<TTTableActionDelegate>)actionDelegate{
    TTTableActionItem* item = [TTTableActionItem itemWithTitle:title caption:caption
                                                          text:text timestamp:timestamp
                                                      imageURL:imageURL URL:nil];
    item.actionDelegate = actionDelegate;
    item.buttonTitle = buttonTitle;
    item.enabled = YES;
    return item;
}

#pragma mark -
#pragma mark NSCoding


///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithCoder:(NSCoder*)decoder {
	self = [super initWithCoder:decoder];
    if (self) {
        self.buttonTitle = [decoder decodeObjectForKey:@"buttonTitle"];
        self.enabled = [[decoder decodeObjectForKey:@"enabled"] boolValue];
    }
    return self;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)encodeWithCoder:(NSCoder*)encoder {
    [super encodeWithCoder:encoder];
    if (self.buttonTitle) {
        [encoder encodeObject:self.buttonTitle forKey:@"buttonTitle"];
        [encoder encodeObject:[NSNumber numberWithBool:self.enabled] forKey:@"enabled"];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setEnabled:(BOOL)enabled{
    if (_enabled != enabled) {
        _enabled = enabled;
        if (_cell) [_cell performSelector:@selector(updateButtonState)];
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setButtonTitle:(NSString *)buttonTitle{
    if (![_buttonTitle isEqualToString:buttonTitle]) {
        _buttonTitle = [buttonTitle copy];
        if (_cell) [_cell performSelector:@selector(updateButtonState)];
    }
}

@end
