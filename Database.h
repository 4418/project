//
//  Database.h
//  Contento
//
//  Created by aadil on 23/11/15.
//  Copyright © 2015 Zaptech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "Authors.h"
#import "Users.h"
#import "Articles.h"
#import "FMDBDataAccess.h"
@class FMDBDataAccess;
@interface Database : NSObject
@property FMDBDataAccess *dbAccess;
-(void)emptyDatabase;
-(BOOL)insertQueryWithDictionary:(NSDictionary *)dic inTable:(NSString *)table;
-(NSArray *)selectAllQueryWithTableName :(NSString *)tableName;
-(NSArray *)selectWhereQueryWithTableName :(NSString *)tableName andWithWhereCondition:(NSString *) where;
-(NSString *)generateQuery:(NSDictionary *)dic inTable:(NSString *)table;
-(BOOL)executeQuery: (NSString *)query;
@end
