//
//  SMVArtist.m
//  iHomework
//
//  Created by 2 on 1/28/16.
//  Copyright © 2016 2. All rights reserved.
//

#import "SMVArtist.h"

@implementation SMVArtist

- (instancetype)initDefaultArtist {
    self = [super init];
    
    if(!self) return nil;
    
    self.eventName = @"Maksim";
    self.eventDate = [NSDate date];
    self.eventId = [SMVArtist getUUID];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if(!self) return nil;
    
    self.eventName = [aDecoder decodeObjectForKey:@"eventName"];
    self.eventDate = [aDecoder decodeObjectForKey:@"eventDate"];
    self.eventId = [aDecoder decodeObjectForKey:@"eventId"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.eventDate forKey:@"eventDate"];
    [aCoder encodeObject:self.eventName forKey:@"eventName"];
    [aCoder encodeObject:self.eventId forKey:@"eventId"];
}

+ (NSString *)getUUID {
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge_transfer NSString *)uuidStringRef;
}

@end
