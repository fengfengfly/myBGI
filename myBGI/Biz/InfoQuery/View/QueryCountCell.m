//
//  QueryCountCell.m
//  InfoCapture
//
//  Created by lx on 2017/5/5.
//  Copyright © 2017年 feng. All rights reserved.
//

#import "QueryCountCell.h"

@implementation QueryCountCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.badgeLabel.layer.masksToBounds = YES;
    self.badgeLabel.layer.cornerRadius = self.badgeLabel.frame.size.height/2;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
