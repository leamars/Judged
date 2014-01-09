//
//  PersonCell.h
//  Judged
//
//  Created by Lea Marolt on 1/9/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PersonCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *loveNum;
@property (strong, nonatomic) IBOutlet UILabel *loseNum;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *friendsLabel;
@property (strong, nonatomic) IBOutlet UILabel *judgedLabel;
@property (strong, nonatomic) IBOutlet UIImageView *profileImg;
@property (strong, nonatomic) IBOutlet UIImageView *judgedImg;
@property (strong, nonatomic) IBOutlet UIButton *loveButton;
@property (strong, nonatomic) IBOutlet UIButton *loseButton;

@end
