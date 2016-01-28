//
//  SMVArtist.h
//  iHomework
//
//  Created by 2 on 1/28/16.
//  Copyright © 2016 2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMVEvent : NSObject<NSCoding>

@property (nonatomic) NSString *eventName;
@property (nonatomic) NSDate *eventDate;
@property (nonatomic) NSString *eventId;

- (instancetype)initWithName:(NSString *)name
                    withDate:(NSDate *)date;

+ (NSString *)getUUID;

@end
