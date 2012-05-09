//
//  TTTableActionItem.h
//  TTCatalog
//
//  Created by kshi on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
#import "Three20UI/TTTableMessageItem.h"

@protocol TTTableActionDelegate;

@interface TTTableActionItem : TTTableMessageItem{
    id<TTTableActionDelegate> _actionDelegate;
    NSString* _buttonTitle;
    BOOL _enabled;
    UITableViewCell* _cell;
}

@property (nonatomic, copy)   NSString* buttonTitle;
@property (nonatomic, weak) id<TTTableActionDelegate> actionDelegate;
@property (nonatomic, weak) UITableViewCell* cell;
@property (nonatomic, assign) BOOL enabled;

+ (id)itemWithTitle:(NSString*)title caption:(NSString*)caption text:(NSString*)text
          timestamp:(NSDate*)timestamp imageURL:(NSString*)imageURL
        buttonTitle:(NSString*)buttonTitle actionDelegate:(id<TTTableActionDelegate>)actionDelegate;
@end

@protocol TTTableActionDelegate <NSObject>
- (void)itemClicked:(TTTableActionItem*)item atIndexPath:(NSIndexPath*)indexPath;
@end
