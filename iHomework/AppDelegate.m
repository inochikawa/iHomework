//
//  AppDelegate.m
//  iHomework
//
//  Created by 2 on 1/28/16.
//  Copyright © 2016 2. All rights reserved.
//

#import "AppDelegate.h"
#import "SMVArtist.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)reastoreData {
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"artists"];
    self.artists = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
    if(!self.artists)
        self.artists = [NSMutableArray new];
    
    NSLog(@"Data restored");
}

- (void)saveData {
    NSData *data =  [NSKeyedArchiver archivedDataWithRootObject:self.artists];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"artists"];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self reastoreData];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [self.artists addObject:[[SMVArtist alloc] initDefaultArtist]];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [self saveData];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self.artists addObject:[[SMVArtist alloc] initDefaultArtist]];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self.artists addObject:[[SMVArtist alloc] initDefaultArtist]];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self.artists addObject:[[SMVArtist alloc] initDefaultArtist]];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
