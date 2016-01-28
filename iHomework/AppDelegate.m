//
//  AppDelegate.m
//  iHomework
//
//  Created by 2 on 1/28/16.
//  Copyright © 2016 2. All rights reserved.
//

#import "AppDelegate.h"
#import "SMVEvent.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)restoreData {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"events"];
    self.events = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if(!self.events)
        self.events = [NSMutableArray new];
    
    NSLog(@"Data restored");
}

- (void)saveData {
    NSData *data =  [NSKeyedArchiver archivedDataWithRootObject:self.events];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"events"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self restoreData];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    SMVEvent *event = [[SMVEvent alloc] initWithName:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]
                                            withDate:[NSDate date]];
    [self.events addObject:event];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self saveData];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    SMVEvent *event = [[SMVEvent alloc] initWithName:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]
                                            withDate:[NSDate date]];
    [self.events addObject:event];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    SMVEvent *event = [[SMVEvent alloc] initWithName:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]
                                            withDate:[NSDate date]];
    [self.events addObject:event];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    SMVEvent *event = [[SMVEvent alloc] initWithName:[NSString stringWithFormat:@"%s", __PRETTY_FUNCTION__]
                                            withDate:[NSDate date]];
    [self.events addObject:event];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
