//
//  DAOEngine.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-25.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "DAOEngine.h"
#import "CoreDataController.h"
#import "CoreDataEngine.h"

@interface DAOEngine ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation DAOEngine

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _managedObjectContext = [[CoreDataController sharedInstance] managedObjectContext];
    }
    return self;
}

- (CoreDataEngine *)createOrUpdateEngineData:(NSDictionary *)data; {
    
    NSString *identifier = [data objectForKey:@"id"];
    
    if (![data isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"ERROR::: data isnt dictionary");
        return nil;
    }
    
    if (!identifier) {
        
        NSLog(@"ERROR::: engine identifier is nil");
        return nil;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Engine"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", identifier];
    
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        
        NSLog(@"ERROR::: cant fetch engine");
        //... error handling code
    }
    CoreDataEngine *engine;
    if (fetchedObjects.count == 0) {
        
        engine = [self saveNewEngineObjectWithID:identifier];
    } else {
        engine = [fetchedObjects firstObject];
    }
    
    [engine configureWithData:data];
    return engine;
}

- (CoreDataEngine *)saveNewEngineObjectWithID:(NSString *)identifier {
    
    CoreDataEngine *newEngine = [NSEntityDescription insertNewObjectForEntityForName:@"Engine" inManagedObjectContext:self.managedObjectContext];
    newEngine.identifier = identifier;
    return newEngine;
}


@end
