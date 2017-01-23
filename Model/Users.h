//
//  Users.h
//  Rover
//
//  Created by   on 3/17/15.
//  Copyright (c) 2015  . All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Users : NSObject

typedef void(^user_completion_block)(NSDictionary *user,NSString *, int status);

@property NSMutableDictionary *dictRegister;
@property NSMutableArray    *cell,*sendTo,*arrRowID, *arrColumnID;
@property NSMutableString *email, *firstName, *lastName, *admin, *licensedSheet,*userID,*sheetID,*rowID,*toTop,*subject,*message, *ccMe,*columnId,*includeAttachments,*includeDiscussions,*timeZone, *travel, *calendarAvailability, *notes,*strDeleteRowID, *strFinalFilePath, *strFileName,*strDeviceToken, *strOsType, *strcommunication, *strMode, *strNotificationID, *strUsername, *strUserID, *strMessageID;

- (BOOL) isNotNull:(NSObject*) object ;
-(void)Register:(user_completion_block)completion;
-(void)getSheetList:(user_completion_block)completions;
-(void)getProfileSheet:(user_completion_block)completions;
-(void)getCalendarSheet:(user_completion_block)completions;
-(void)searchDataInRegisterSheet:(user_completion_block)completions;
-(void)searchDataInRow:(user_completion_block)completions;
-(void)updateProfile:(user_completion_block)completions;
-(void)forgotPasswordMail:(user_completion_block)completions;
-(void)addEvents:(user_completion_block)completions;
-(void)searchDataInCalendarSheet:(user_completion_block)completions;
-(void)searchDataInCalendarRow:(user_completion_block)completions;
-(void)updateEvent:(user_completion_block)completions;
-(void)profileNotification:(user_completion_block)completions;
-(void)eventNotification:(user_completion_block)completions;
-(void)deleteEvent:(user_completion_block)completions;
-(void)uploadBIO:(user_completion_block)completions;
-(void)addDeviceID:(user_completion_block)completions;
-(void)notification_history:(user_completion_block)completions;
-(void)deleteDataInCalendarSheet:(user_completion_block)completions;
-(void)getNavisPushSheet:(user_completion_block)completions;
-(void)navisPushSheetDataEntry:(user_completion_block)completions;
-(void)searchDataAddEventSheet:(user_completion_block)completions;
-(void)searchDataInNavisPushSheet:(user_completion_block)completions;
-(void)searchDataInNavisPushRow:(user_completion_block)completions;
-(void)updateNavisPushSheetDataEntry:(user_completion_block)completion;
-(void)deleteNotificationMessage:(user_completion_block)completion;

@end
