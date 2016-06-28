//
//  DAOCompany.m
//  CarModels
//
//  Created by Gevorg Ghukasyan on 2016-03-25.
//  Copyright © 2016 Gevorg Ghukasyan. All rights reserved.
//

#import "DAOCompany.h"
#import "CoreDataController.h"
#import "CoreDataCompany.h"

@interface DAOCompany ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation DAOCompany

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _managedObjectContext = [[CoreDataController sharedInstance] managedObjectContext];
    }
    return self;
}

- (CoreDataCompany *)getCompanyWithId:(NSString *)companyID {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Company"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", companyID];
    
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        
        NSLog(@"ERROR::: cant fetch company");
        return nil;
    }
    return [fetchedObjects firstObject];
}

- (CoreDataCompany *)configureCompanyCategoriesWithData:(id )data companyId:(NSString *)identifier {
    
    NSDictionary * myDictionary = data;
    NSData * dataaa = [NSPropertyListSerialization dataFromPropertyList:myDictionary
                                                               format:NSPropertyListBinaryFormat_v1_0 errorDescription:NULL];
    NSLog(@"size: %lu", (unsigned long)[dataaa length]);
    
    if (![data isKindOfClass:[NSDictionary class]]) {
        
        NSLog(@"ERROR::: data isnt dictionary");
        return nil;
    }
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Company"
                                              inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", identifier];

    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        
        NSLog(@"ERROR::: cant fetch company");
        return nil;
    }
    CoreDataCompany *company;
    if (fetchedObjects.count == 0) {
        
        company = [self saveNewCompanyObjectWithID:identifier];
    } else {
        company = [fetchedObjects firstObject];
    }
    
    [company configureWithData:data];
    [[CoreDataController sharedInstance] saveContext];
    return company;
}

- (CoreDataCompany *)saveNewCompanyObjectWithID:(NSString *)identifier {
    
    CoreDataCompany *newCompany = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:self.managedObjectContext];
    newCompany.identifier = identifier;
    return newCompany;
}

@end
