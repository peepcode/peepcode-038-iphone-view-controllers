//
//  TFParagraphCell.h
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/18/09.
//  Copyright 2009 Topfunky Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TFParagraphCell : UITableViewCell {
}

+ (CGFloat)heightForCellWithText:(NSString *)theText inFrame:(CGRect)aFrame;

@end
