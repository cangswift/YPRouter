
#import "YPProtocol.h"
#import "YPRouter.h"

@implementation YPProtocol

//内部
- (instancetype)initWithInnerUrl:(NSString *)url{
    self = [super init];
    if(self){
        [self analysisInnerUrl:url];
    }
    return self;
}

- (void)analysisInnerUrl:(NSString *)urlStr{
    _url = urlStr;
    _target = nil;
    _params = nil;
    
        NSString *targetparamStr = _url;
        NSArray *targetparamArr = [targetparamStr componentsSeparatedByString:@"?"];
        _target = [targetparamArr objectAtIndex:0];
        if(targetparamArr.count > 1){
            //有参数
            NSString *paramStr = [targetparamArr objectAtIndex:1];
            NSArray *paramArr = [paramStr componentsSeparatedByString:@"&"];
            NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
            for(int i=0;i<paramArr.count;++i){
                NSString *singleParamStr = [paramArr objectAtIndex:i];
                NSArray *singleParamArr = [singleParamStr componentsSeparatedByString:@"="];
                if(singleParamArr.count > 1){
                    NSString *singleParamKey = [singleParamArr objectAtIndex:0];
                    NSString *singleParamValue = [singleParamArr objectAtIndex:1];
                    [params setValue:singleParamValue forKey:singleParamKey];
                }
            }
            _params = params;
        }
}


@end
