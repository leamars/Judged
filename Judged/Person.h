//
//  Person.h
//  Judged
//
//  Created by Lea Marolt on 1/9/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong) UIImage *profilePic;
@property (nonatomic, strong) UIImage *judgedPic;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic) NSInteger loves;
@property (nonatomic) NSInteger loses;
@property (nonatomic) NSInteger judged;

+(instancetype)personWithName:(NSString *)aName Comment:(NSString *)aComment ProfilePic:(UIImage *)aPPic JudgedPic:(UIImage *)aJPic;

@end