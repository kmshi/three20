//
//  TTTableActionItem.h
//  TTCatalog
//
//  Created by kshi on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "Three20UI/TTTableMessageItem.h"

@interface TTTableActionItem : TTTableMessageItem{
    id _target;
    SEL _action;
    NSString* _btnTitle;
    BOOL _enabled;
    UITableViewCell* _cell;
}

@property (nonatomic, copy)   NSString* btnTitle;
@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL action;
@property (nonatomic, assign) UITableViewCell* cell;
@property (nonatomic, assign) BOOL enabled;

+ (id)itemWithTitle:(NSString*)title caption:(NSString*)caption text:(NSString*)text
          timestamp:(NSDate*)timestamp imageURL:(NSString*)imageURL target:(id)target
             action:(SEL)action buttonTitle:(NSString*)btnTitle;
@end
