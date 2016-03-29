//
//  DAOModel.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-25.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "DAOModel.h"
#import "CoreDataCarModel.h"
#import "CoreDataController.h"

@interface DAOModel ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation DAOModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _managedObjectContext = [[CoreDataController sharedInstance] managedObjectContext];
    }
    return self;
}

- (CoreDataCarModel *)createOrUpdateCarModelData:(NSDictionary *)data {
    
    NSString *identifier = [data objectForKey:@"id"];
    
    if (![data isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"ERROR::: data isnt dictionary");
        return nil;
    }
    
    if (!identifier) {
        
        NSLog(@"ERROR::: model identifier is nil");
        return nil;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Model"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", identifier];
    
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        
        NSLog(@"ERROR::: cant fetch model");
    }
    CoreDataCarModel *carModel;
    if (fetchedObjects.count == 0) {
        
        carModel = [self saveNewModelObjectWithID:identifier];
    } else {
        carModel = [fetchedObjects firstObject];
    }
    
    [carModel configureWithData:data];
    return carModel;
}

- (CoreDataCarModel *)saveNewModelObjectWithID:(NSString *)identifier {
    
    CoreDataCarModel *newModel = [NSEntityDescription insertNewObjectForEntityForName:@"Model" inManagedObjectContext:self.managedObjectContext];
    newModel.identifier = identifier;
    return newModel;
}

@end
