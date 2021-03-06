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
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void) updateButtonState;
@end


@implementation TTTableActionItemCell
///////////////////////////////////////////////////////////////////////////////////////////////////
+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {
    TTTableActionItem* item = object;
    if (item.text.length) {
        return 90;
    }
    return 60;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
	self = [super initWithStyle:style reuseIdentifier:identifier];
    if (self) {
    }
    return self;
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)buttonClicked:(TTButton*)btn{
    TTTableActionItem* item = self.object;
    NSIndexPath *indexPath = [(UITableView*)self.superview indexPathForCell:self];
    [item.actionDelegate itemClicked:item atIndexPath:indexPath];
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setObject:(id)object {
    if (_item != object) {
        [super setObject:object];
        TTTableActionItem* item = object;
        item.cell = self;
        [self updateButtonState];
    }
}
///////////////////////////////////////////////////////////////////////////////////////////////////
- (TTButton*)button {
    if (!_button) {
        self.accessoryView = [[[UIView alloc] initWithFrame:
            CGRectMake(0, 0, 68, self.detailTextLabel.text.length?90:60)] autorelease];
        _button = [[TTButton buttonWithStyle:@"toolbarButton:" title:@""] retain];
        _button.frame = CGRectMake(2, self.detailTextLabel.text.length?27:12, 62, 36);
        [_button addTarget:self action:@selector(buttonClicked:)
          forControlEvents:UIControlEventTouchUpInside];
        [self.accessoryView addSubview:_button];
    }
    return _button;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void) updateButtonState{
    TTTableActionItem* item = self.object;
    if (item.buttonTitle.length) {
        [self.button setTitle:item.buttonTitle forState:UIControlStateNormal];
    }
    self.button.enabled = item.enabled;
}

@end
