//
//  Globals.h
//  Rover
//
//  Created by   on 3/17/15.
//  Copyright (c) 2015  . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Users.h"
#import <UIKit/UIKit.h>


@interface Globals : NSObject

+ (id)sharedManager;

@property Users *user;

@property NSMutableDictionary *dictRegister, *dictSheetList,*dictSheetData,*dictSearchData,*dictAddEventSheetData, *dictNavisPushSheet;
@property (nonatomic,strong)NSString *strSheetID,*strCalendarSheetID, *strFilePath, *strToken;
@property NSMutableArray  *arrCalendarData, *arrTblDisplay,*arrRowIDList;
@property NSMutableString *strRowIDProfile, *strEmailId,*strUserID, *strNavisPushSheetID;
@property BOOL flagAddEvent;
@property int flagCount;

- (BOOL) isNotNull:(NSObject*) object;
- (BOOL) isNull:(NSObject*) object;
-(void)setNavigationTitleAndBGImageName:(NSString *)strImageName navigationController:(UINavigationController *)navigationController;
-(void)setTextFieldWithSpace:(UITextField*)txtField;
-(void)makeTextFieldBorderRed:(UITextField*)textFieldForRedBorder;
-(void)makeTextFieldNormal:(UITextField*)textFieldForNormal;
-(void)makeTextViewBorderRed:(UITextView*)textFieldForRedBorder;
-(void)makeTextViewNormal:(UITextView*)textFieldForNormal;

@end
