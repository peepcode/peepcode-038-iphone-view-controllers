//
//  TFParagraphCell.m
//  PeepCodeNews
//
//  Created by Geoffrey Grosenbach on 8/18/09.
//  Copyright 2009 Topfunky Corporation. All rights reserved.
//

#import "TFParagraphCell.h"
#import "../Helpers/TFAppHelpers.h"

#define TFParagraphCellTextFont [UIFont systemFontOfSize:[UIFont systemFontSize]]
#define TFParagraphCellTextLeftMargin 85.0f
#define TFParagraphCellMargin 10.0f

@implementation TFParagraphCell

// Runs a calculation only, does not set any values.
+ (CGFloat)heightForCellWithText:(NSString *)theText inFrame:(CGRect)aFrame
{
  // NOTE: FLT_MAX is a large float. Returned height will be less.
  CGSize targetSize = CGSizeMake(aFrame.size.width - TFParagraphCellTextLeftMargin - TFParagraphCellMargin, 
                                 FLT_MAX);
  CGSize cellSize = [theText sizeWithFont:TFParagraphCellTextFont 
                        constrainedToSize:targetSize
                            lineBreakMode:UILineBreakModeWordWrap];
  // HACK: Should be 2.0f, but only 4.0f looks right
  cellSize.height += (4.0f * TFParagraphCellMargin);
  return cellSize.height;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  CGRect labelFrame      = self.contentView.frame;
  labelFrame.size.width  = self.contentView.frame.size.width - TFParagraphCellTextLeftMargin - TFParagraphCellMargin;
  labelFrame.size.height = self.contentView.frame.size.height - (2.0f * TFParagraphCellMargin);
  labelFrame.origin.x    = TFParagraphCellTextLeftMargin;
  labelFrame.origin.y    = TFParagraphCellMargin;

  self.detailTextLabel.frame = labelFrame;
  self.detailTextLabel.font = TFParagraphCellTextFont;
  self.detailTextLabel.lineBreakMode = UILineBreakModeWordWrap;
  self.detailTextLabel.numberOfLines = self.detailTextLabel.frame.size.height / TFParagraphCellTextFont.leading;
}

- (void)dealloc {
  [super dealloc];
}

@end
