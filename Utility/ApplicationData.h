

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Constant.h"
#import "Users.h"
#import "MBProgressHUD.h"

@interface UINavigationController (SafePushing)

- (id)navigationLock;

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated navigationLock:(id)navigationLock;
- (NSArray *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated navigationLock:(id)navigationLock;
- (NSArray *)popToRootViewControllerAnimated:(BOOL)animated navigationLock:(id)navigationLock;

@end

@interface ApplicationData : NSObject<UIActionSheetDelegate> {
   
    MBProgressHUD *hud;
 }

@property(nonatomic,strong)id object;
@property (nonatomic) Users *user;
@property (nonatomic) BOOL isUserLogin;

+ (ApplicationData *)sharedInstance;
- (BOOL) validateEmail: (NSString *)candidate;
- (BOOL) validateWebURL : (NSString *) weburl;
- (void)showLoader;
- (void)hideLoader;
- (NSString *)getFormattedStringFrom:(NSDate *)date formatter:(NSString *)format;
- (NSDate *)getFormattedDateFrom:(NSString *)string formatter:(NSString *)format;
-(void) setImageWithURL1:(NSURL *)url withImage:(UIImageView *)imgView;
- (UIImage *)getThumbImage:(UIImage *)image;
- (void)setTextFieldLeftView:(UITextField *)txtField;
- (void)setButtonUnderLine:(UIButton *)button;
- (BOOL)connectedToNetwork;
- (void)ShowAlertWithTitle:(NSString *)title Message:(NSString *)message;
- (float)getTextHeightOfText:(NSString *)string font:(UIFont *)aFont width:(float)width;
- (void)setBorderFor:(UIView *)aView;
- (void)playYouTubeVideoInWebView:(UIWebView*)webview youTubeURL:(NSString*)url;
- (UIImage *)image:(UIImage*)originalImage scaledToSize:(CGSize)size;
- (UIImage *)imageWithRoundedCornersSize:(float)cornerRadius usingImage:(UIImage *)original;
-(CGFloat)heightForLabel:(UILabel *)label withText:(NSString *)text;
-(NSString *)isNullOrEmpty:(NSString *)inString;
-(NSString *)isValueNullOrEmpty:(NSString *)inString;
- (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;

@end
