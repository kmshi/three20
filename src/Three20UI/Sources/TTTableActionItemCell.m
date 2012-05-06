//
//  TTTableActionItemCell.m
//  TTCatalog
//
//  Created by kshi on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Three20UI/TTTableActionItemCell.h"
#import "Three20UI/TTTableActionItem.h"

// Core
#import "Three20Core/TTCorePreprocessorMacros.h"

@interface TTTableActionItemCell()
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)buttonClicked:(TTButton*)btn;
@end


@implementation TTTableActionItemCell
///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
	self = [super initWithStyle:style reuseIdentifier:identifier];
    if (self) {
        self.accessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 68, 90)];
    }
    return self;
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)buttonClicked:(TTButton*)btn{
    TTTableActionItem* item = self.object;
    [item.target performSelector:item.action withObject:item withObject:_button];
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setObject:(id)object {
    if (_item != object) {
        [super setObject:object];
        TTTableActionItem* item = object;
        if (item.btnTitle.length) {
            [self.button setTitle:item.btnTitle forState:UIControlStateNormal];
        }
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTButton*)button {
    if (!_button) {
        _button = [[TTButton buttonWithStyle:@"toolbarButton:" title:@""] retain];
        _button.frame = CGRectMake(4, 27, 60, 36);
        [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.accessoryView addSubview:_button];
    }
    return _button;
}

@end
