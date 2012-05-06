//
//  TTTableActionItemCell.h
//  TTCatalog
//
//  Created by kshi on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Three20UI/TTTableMessageItemCell.h"
#import "Three20UI/TTButton.h"

@interface TTTableActionItemCell : TTTableMessageItemCell{
    TTButton* _button;
}
@property (nonatomic, readonly, retain) TTButton*      button;
@end
