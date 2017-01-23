//
//  Users.m
//  Rover
//
//  Created by   on 3/17/15.
//  Copyright (c) 2015  . All rights reserved.
//

#import "Users.h"
#import "APICall.h"
#import "Constant.h"
#import "Globals.h"

@implementation Users
{
    Globals *OBJGlobal;
}

-(instancetype)init
{
    self = [super init];
    if(self) {
        self.email = [[NSMutableString alloc]init];
        self.firstName = [[NSMutableString alloc]init];
        self.lastName = [[NSMutableString alloc]init];
        self.licensedSheet = [[NSMutableString alloc]init];
        self.admin = [[NSMutableString alloc]init];
        self.rowID = [[NSMutableString alloc]init];
        self.toTop = [[NSMutableString alloc]init];
        self.subject = [[NSMutableString alloc]init];
        self.message = [[NSMutableString alloc]init];
        self.ccMe = [[NSMutableString alloc]init];
        self.columnId = [[NSMutableString alloc]init];
        self.includeAttachments = [[NSMutableString alloc]init];
        self.includeDiscussions = [[NSMutableString alloc]init];
        self.strDeleteRowID = [[NSMutableString alloc]init];
        self.cell = [[NSMutableArray alloc]init];
        self.sendTo = [[NSMutableArray alloc]init];
        self.arrColumnID = [[NSMutableArray alloc]init];
        self.arrRowID = [[NSMutableArray alloc]init];
        self.strFinalFilePath = [[NSMutableString alloc]init];
        self.strFileName = [[NSMutableString alloc]init];
        self.strDeviceToken = [[NSMutableString alloc]init];
        self.strOsType = [[NSMutableString alloc]init];
        self.strcommunication = [[NSMutableString alloc]init];
        self.strMode = [[NSMutableString alloc]init];
        self.strNotificationID = [[NSMutableString alloc]init];
        self.strUsername = [[NSMutableString alloc]init];
        self.strMessageID = [[NSMutableString alloc]init];
        self.strUserID = [[NSMutableString alloc]init];
    }
    return self;
}

#pragma mark - Null object checking method
- (BOOL) isNull:(NSObject*) object {
    if (!object)
        return YES;
    else if (object == [NSNull null])
        return YES;
    else if ([object isKindOfClass: [NSString class]]) {
        return ([((NSString*)object) isEqualToString:@""]
                || [((NSString*)object) isEqualToString:@"null"]
                || [((NSString*)object) isEqualToString:@"<null>"]);
    }
    return NO;
}

- (BOOL) isNotNull:(NSObject*) object {
    return ![self isNull:object];
}

#pragma mark - webservice calling methods
-(void)getSheetList:(user_completion_block)completion{
    @try{
        
        NSString *url_String = [NSString stringWithFormat:@"%@", API_GETSHEET];
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completion)
                {
                    completion(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completion)
                {
                    if([user valueForKey:@"data"])
                    {
                        completion(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}

-(void)getProfileSheet:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@", API_GETPARTICULARSHEET,OBJGlobal.strSheetID];
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"columns"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
}

-(void)searchDataInRegisterSheet:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@?query=%@", API_SEARCHDATA,OBJGlobal.strSheetID,self.email];
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"results"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}

-(void)searchDataInRow:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows/%@", API_SEARCHDATAINROW,OBJGlobal.strSheetID,_rowID];
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"cells"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
}

-(void)Register:(user_completion_block)completion{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                      _toTop, @"toTop",
                      _cell, @"cells",
                      nil];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows/", API_REGISTER,OBJGlobal.strSheetID];
        
        [APICall callPostWebService:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completion)
                {
                    completion(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completion)
                {
                    if([user valueForKey:@"message"])
                    {
                        completion(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}

-(void)updateProfile:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                      _rowID, @"id",
                      _cell, @"cells",
                      nil];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows/", API_UPDATEPROFILE,OBJGlobal.strSheetID];
        
        [APICall callPutWebService:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"message"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}

-(void)forgotPasswordMail:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                      _sendTo, @"sendTo",
                      _subject, @"subject",
                      _message, @"message",
                      _ccMe, @"ccMe",
                      _arrRowID, @"rowIds",
                      _arrColumnID, @"columnIds",
                      _includeAttachments, @"includeAttachments",
                      _includeDiscussions, @"includeDiscussions",
                      nil];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/updaterequests", API_FORGOTPASSWORDMAIL,OBJGlobal.strSheetID];
        
        [APICall callPostWebService:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"message"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}

-(void)addEvents:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                      _toTop, @"toTop",
                      _cell, @"cells",
                      nil];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows/", API_ADDEVENT,OBJGlobal.strCalendarSheetID];
        
        [APICall callPostWebService:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"message"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}

-(void)getCalendarSheet:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@", API_GETPARTICULARSHEET,OBJGlobal.strCalendarSheetID];
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"columns"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}

-(void)searchDataInCalendarSheet:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSString *url_String = [NSString stringWithFormat:@"%@%@?query=%@", API_SEARCHDATA,OBJGlobal.strCalendarSheetID,self.email];
       
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"results"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}
-(void)searchDataAddEventSheet:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSString *url_String = [NSString stringWithFormat:@"%@%@?query=%@", API_SEARCHDATA,OBJGlobal.strCalendarSheetID,self.timeZone];
        
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"results"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}
-(void)deleteDataInCalendarSheet:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSString *url_String = [NSString stringWithFormat:@"%@%@?query=%@", API_SEARCHDATA,OBJGlobal.strCalendarSheetID,self.timeZone];
        
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"results"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}



-(void)searchDataInCalendarRow:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows/%@", API_SEARCHDATAINROW,OBJGlobal.strCalendarSheetID,_rowID];
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"cells"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
}

-(void)updateEvent:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                      _rowID, @"id",
                      _cell, @"cells",
                      nil];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows/", API_UPDATEPROFILE,OBJGlobal.strCalendarSheetID];
        
        [APICall callPutWebService:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"message"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}

-(void)profileNotification:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                      _sendTo, @"sendTo",
                      _subject, @"subject",
                      _message, @"message",
                      _ccMe, @"ccMe",
                      _arrRowID, @"rowIds",
                      _arrColumnID, @"columnIds",
                      _includeAttachments, @"includeAttachments",
                      _includeDiscussions, @"includeDiscussions",
                      nil];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/updaterequests", API_PROFILEUPDATENOTIFICATION,OBJGlobal.strSheetID];
        
        [APICall callPostWebService:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"message"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}

-(void)eventNotification:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                      _sendTo, @"sendTo",
                      _subject, @"subject",
                      _message, @"message",
                      _ccMe, @"ccMe",
                      _arrRowID, @"rowIds",
                      _arrColumnID, @"columnIds",
                      _includeAttachments, @"includeAttachments",
                      _includeDiscussions, @"includeDiscussions",
                      nil];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/updaterequests", API_ADDEVENTNOTIFICATION,OBJGlobal.strCalendarSheetID];
        
        [APICall callPostWebService:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"message"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}

-(void)deleteEvent:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        
        NSDictionary *parameters=[[NSDictionary alloc]init];
        
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows?ids=%@&ignoreRowsNotFound=true", API_DELETEEVENT,OBJGlobal.strCalendarSheetID,_strDeleteRowID];
        
        
        
        [APICall callDeleteWebService:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"message"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
}

-(void)uploadBIO:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows/%@/attachments", API_UPDATEPROFILE,OBJGlobal.strSheetID,_rowID];
        NSString * strTempString = [NSString stringWithFormat:@"%@",_strFileName];
;
        
        [APICall callPostWebServiceUploadBIO:url_String andDictionary:parameters filePath:_strFinalFilePath fileName:strTempString completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"message"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
}

-(void)addDeviceID:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters = [[NSDictionary alloc]init];
        
         parameters =  @{@"userid":_rowID,
                        @"devicetoken":_strDeviceToken,
                        @"email":_email,
                        @"devicetype":_strOsType,
                        @"firstname":_firstName,
                        @"lastname":_lastName,
                        @"communication":_strcommunication,
                        @"mode":_strMode,
                        @"id":_strNotificationID,
                        @"username":_strUsername};
        
        NSString *url_String = [NSString stringWithFormat:@"%@",API_ADDDEVICEID];
        
        [APICall callPostWebServicePHP:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"msg"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];

    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }

}

-(void)notification_history:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = @{@"email":_email};
        
        NSString *url_String = [NSString stringWithFormat:@"%@",API_NOTIFICATION_HISTORY];
        
        [APICall callPostWebServicePHP:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"msg"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
        
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
}

-(void)deleteNotificationMessage:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = @{@"userid":_strUserID,
                       @"id":_strMessageID};
        
        NSString *url_String = [NSString stringWithFormat:@"%@",API_NOTIFICATION_DELETE];
        
        [APICall callPostWebServicePHP:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"msg"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
        
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
}


-(void)getNavisPushSheet:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@", API_GETPARTICULARSHEET,OBJGlobal.strNavisPushSheetID];
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"columns"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
}
-(void)searchDataInNavisPushSheet:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@?query=%@", API_SEARCHDATA,OBJGlobal.strNavisPushSheetID,self.email];
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"results"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}
-(void)searchDataInNavisPushRow:(user_completion_block)completions{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows/%@", API_SEARCHDATAINROW,OBJGlobal.strNavisPushSheetID,_rowID];
        
        [APICall callGetWebService:url_String andDictionary:nil completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completions)
                {
                    completions(user,@"OOPS Seems like something is wrong with server",-1);
                }
                
            }
            else{
                if(completions)
                {
                    if([user valueForKey:@"cells"])
                    {
                        completions(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
}
-(void)navisPushSheetDataEntry:(user_completion_block)completion{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                      _toTop, @"toTop",
                      _cell, @"cells",
                      nil];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows/", API_REGISTER,OBJGlobal.strNavisPushSheetID];
        
        [APICall callPostWebService:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completion)
                {
                    completion(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completion)
                {
                    if([user valueForKey:@"message"])
                    {
                        completion(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}
-(void)updateNavisPushSheetDataEntry:(user_completion_block)completion{
    @try{
        
        OBJGlobal = [Globals sharedManager];
        NSDictionary *parameters=[[NSDictionary alloc]init];
        parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                      _rowID, @"id",
                      _cell, @"cells",
                      nil];
        
        NSString *url_String = [NSString stringWithFormat:@"%@%@/rows/", API_UPDATEPROFILE,OBJGlobal.strNavisPushSheetID];
        
         [APICall callPutWebService:url_String andDictionary:parameters completion:^(NSDictionary* user, NSError*error, long code){
            if(error)
            {
                if(completion)
                {
                    completion(user,@"OOPS Seems like something is wrong with server",-1);
                }
            }
            else{
                if(completion)
                {
                    if([user valueForKey:@"message"])
                    {
                        completion(user,@"Got Response ",1);
                    }
                    
                }
            }
        }];
    } @catch (NSException *exception) {
        NSLog(@"Exception At: %s %d %s %s %@", __FILE__, __LINE__, __PRETTY_FUNCTION__, __FUNCTION__,exception);
    }
    
}
@end
