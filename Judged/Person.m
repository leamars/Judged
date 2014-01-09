//
//  Person.m
//  Judged
//
//  Created by Lea Marolt on 1/9/14.
//  Copyright (c) 2014 Lea Marolt Sonnenschein. All rights reserved.
//

#import "Person.h"

@implementation Person

+(instancetype)personWithName:(NSString *)aName Comment:(NSString *)aComment ProfilePic:(UIImage *)aPPic JudgedPic:(UIImage *)aJPic {
    
    Person *person = [[Person alloc] init];
    [person setProfilePic:aPPic];
    [person setName:aName];
    [person setComment:aComment];
    [person setJudgedPic:aJPic];
    [person setLoses:0];
    [person setLoves:0];
    [person setJudged:0];
    
    return person;
}

@end
