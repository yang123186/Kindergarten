#import <UIKit/UIKit.h>

@interface ClassInfo : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) NSString * grade;
@property (nonatomic, strong) NSString * intro;
@property (nonatomic, strong) NSString * kindergarten;
@property (nonatomic, strong) NSString * name;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end