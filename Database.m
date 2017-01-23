//
//  Database.m
//  Contento
//
//  Created by aadil on 23/11/15.
//  Copyright © 2015 Zaptech. All rights reserved.
//

#import "Database.h"


@implementation Database
-(instancetype)init{
    self = [super init];
    if(self) {
        self.dbAccess= [FMDBDataAccess new];
    }
    return self;
}
-(void)emptyDatabase{
    [self executeQuery:@"DELETE FROM channels; "];
    [self executeQuery:@"DELETE FROM articles;"];
    
}
#pragma mark Database Storage



// Core functions to Insert Query
-(BOOL)insertQueryWithDictionary:(NSDictionary *)dic inTable:(NSString *)table{
    Globals *sharedManager;
    sharedManager=[Globals sharedManager];
    FMDatabase *db = [FMDatabase databaseWithPath:[sharedManager getDatabasePath]];
    [db open];
    
    NSMutableString *insertQ=MString;
    NSArray *keys=[[NSArray alloc] initWithArray:[dic allKeys]];
    NSArray *values=[[NSArray alloc] initWithArray:[dic allValues]];
    [insertQ appendString:[NSString stringWithFormat: @"insert into %@(",table ]];
    for (int i=0; i<[keys count]; i++) {
        if(i==([keys count]-1))
        {
            [insertQ appendString:[NSString stringWithFormat: @" %@ ",[keys objectAtIndex:i] ]];
        }
        else{
            [insertQ appendString:[NSString stringWithFormat: @" %@ , ",[keys objectAtIndex:i] ]];
        }
    }
    [insertQ appendString:@") values ("];
    for (int i=0; i<[values count]; i++) {
        if(i==([values count]-1))
        {
            [insertQ appendString:[NSString stringWithFormat: @" '%@' ",[values objectAtIndex:i] ]];
        }
        else{
            [insertQ appendString:[NSString stringWithFormat: @" '%@' , ",[values objectAtIndex:i] ]];
        }
    }
    [insertQ appendString:@");"];
    BOOL success =  [db executeUpdate:insertQ,nil];
    NSLog(@"%@",insertQ);
    [db close];
    
    return success;
}

-(NSArray *)selectAllQueryWithTableName :(NSString *)tableName
{
    Globals *sharedManager;
    sharedManager=[Globals sharedManager];
    FMDatabase *db = [FMDatabase databaseWithPath:[sharedManager getDatabasePath]];
    [db open];
    NSString *query=[NSString stringWithFormat:@"select * from %@",tableName];
    FMResultSet *results = [db executeQuery:query];
    NSMutableArray *data=[[NSMutableArray alloc] init];
    while([results next])
    {
        NSMutableDictionary *d= [[NSMutableDictionary alloc] init];
        for (int j=0; j<[results columnCount]; j++) {
            [d setObject:[results stringForColumnIndex:j] forKey:[results columnNameForIndex:j] ];
           
        }
         [data addObject:d];
    }
    
    [db close];
    return data;
}
-(NSString *)generateQuery:(NSDictionary *)dic inTable:(NSString *)table{
    NSMutableString *insertQ=MString;
    NSArray *keys=[[NSArray alloc] initWithArray:[dic allKeys]];
    NSArray *values=[[NSArray alloc] initWithArray:[dic allValues]];
    [insertQ appendString:[NSString stringWithFormat: @"insert into %@(",table ]];
    for (int i=0; i<[keys count]; i++) {
        if(i==([keys count]-1))
        {
            [insertQ appendString:[NSString stringWithFormat: @" %@ ",[keys objectAtIndex:i] ]];
        }
        else{
            [insertQ appendString:[NSString stringWithFormat: @" %@ , ",[keys objectAtIndex:i] ]];
        }
    }
    [insertQ appendString:@") values ("];
    for (int i=0; i<[values count]; i++) {
        if(i==([values count]-1))
        {
            [insertQ appendString:[NSString stringWithFormat: @" '%@' ",[values objectAtIndex:i] ]];
        }
        else{
            [insertQ appendString:[NSString stringWithFormat: @" '%@' , ",[values objectAtIndex:i] ]];
        }
    }
    [insertQ appendString:@");"];
    return insertQ;
}
-(NSArray *)selectWhereQueryWithTableName :(NSString *)tableName andWithWhereCondition:(NSString *) where{
    Globals *sharedManager;
    sharedManager=[Globals sharedManager];
    FMDatabase *db = [FMDatabase databaseWithPath:[sharedManager getDatabasePath]];
    [db open];
    NSString *query=[NSString stringWithFormat:@"select * from %@ where %@",tableName, where];
    FMResultSet *results = [db executeQuery:query];
    NSMutableArray *data=[[NSMutableArray alloc] init];
    int i=0;
    while([results next])
    {
        NSMutableDictionary *d= [[NSMutableDictionary alloc] init];
        for (int j=0; j<[results columnCount]; j++) {
            [d setObject:[results stringForColumnIndex:j] forKey:[results columnNameForIndex:j] ];
        }
        [data addObject:d];
        i++;
    }
    [db close];
    return data;
}
-(BOOL)deleteQueryWithTable: (NSString *)table{
    Globals *sharedManager;
    sharedManager=[Globals sharedManager];
    FMDatabase *db = [FMDatabase databaseWithPath:[sharedManager getDatabasePath]];
    [db open];
    
    NSString *deleteQuery = [NSString stringWithFormat:@"DELETE FROM %@",table];
    BOOL success=[db executeUpdate:deleteQuery,nil];
    if(success){
        // Success
        success=true;
    }
    [db close];
    return success;
}

-(BOOL)executeQuery: (NSString *)query{
    Globals *sharedManager;
    sharedManager=[Globals sharedManager];
    FMDatabase *db = [FMDatabase databaseWithPath:[sharedManager getDatabasePath]];
    [db open];
    
    NSString *deleteQuery = [NSString stringWithFormat:@"%@",query];
    BOOL success=[db executeUpdate:deleteQuery,nil];
    if(success){
        // Success
       // success=true;
    }
    [db close];
    return success;
}
@end