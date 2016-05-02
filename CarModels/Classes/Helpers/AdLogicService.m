//
//  AdLogicService.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-04-30.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "AdLogicService.h"
#import "Constant.h"

@interface AdLogicService ()

@property (nonatomic) NSInteger adOpenCount;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation AdLogicService

+ (instancetype)sharedInstance {
    
    static AdLogicService *adLogicService;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        adLogicService = [[AdLogicService alloc] init];
        [adLogicService startTimer];
        adLogicService.adOpenCount = 0;
    });
    return adLogicService;
}

- (void)restart {
    
    [self.timer invalidate];
    self.adOpenCount = 0;
    [self startTimer];
}

- (void)startTimer {
    
    self.timer = [NSTimer timerWithTimeInterval:kAdShowTime
                                         target:self
                                       selector:@selector(timerScedulated)
                                       userInfo:nil
                                        repeats:NO];
}

- (void)timerScedulated {
    
    [self restart];
    [self needShow];
}

- (void)openedPoint:(NSInteger )point {
    
    self.adOpenCount += point;
    if (self.adOpenCount >= kAdShowCount) {
        
        [self restart];
        [self needShow];
    }
}

- (void)needShow {
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kShowAdNotification
                                                        object:nil];
    [self restart];
}

@end
