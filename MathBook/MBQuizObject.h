//
//  MBQuizObject.h
//  MathBook
//
//  Created by 山田 宏道 on 2014/05/24.
//  Copyright (c) 2014年 Torques Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MBQuizObject : NSObject

- (void) createQuiz;

- (NSString*) question;
- (NSString*) answer;

@end
