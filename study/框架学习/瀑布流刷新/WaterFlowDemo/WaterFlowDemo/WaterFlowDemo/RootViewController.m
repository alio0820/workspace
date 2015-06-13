//
//  RootViewController.m
//  WaterFlowDemo
//
//  Created by Jerry Xu on 7/9/13.
//  Copyright (c) 2013 Jerry Xu. All rights reserved.
//

#import "RootViewController.h"
#import "ASIHTTPRequest.h"
#import "CJSONDeserializer.h"
#import "ViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

#pragma mark - Customs Methods
- (void)initWaterFlowView
{
    _photoWall = [[BSPhotoWall alloc] initWithFrame:self.view.bounds];
    _photoWall.delegate = self;
    _photoWall.bsWaterViewDataSource = self;
    [self.view addSubview:_photoWall];
    [_photoWall reloadData];
}

- (void)loadDataByUserID
{
    if ([_idArray count] < 1) {
        return;
    }
    NSString *userid = [_idArray objectAtIndex:0];
    [_idArray removeObjectAtIndex:0];
    
    __weak ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://co3.api.score.binginternal.com/api/v1/app/timeline/%@",userid]]];
    [request startAsynchronous];
    
    [request setFailedBlock:^{
        NSLog(@"request info failed");
    }];
    
    [request setCompletionBlock:^{
        __autoreleasing NSError *error = nil;
        CJSONDeserializer *deseri = [CJSONDeserializer deserializer];
        deseri.nullObject = @"";
        NSDictionary *rootDic = [deseri deserializeAsDictionary:request.responseData error:&error];
        NSArray *momentArray = [rootDic objectForKey:@"MomentTimeline"];
        NSLog(@"momentArray = %@",momentArray);
        if ([momentArray isKindOfClass:[NSArray class]] && [momentArray count] > 0) {
            NSLog(@"%i",[momentArray count]);
            for (NSDictionary *dic in momentArray) {
                PhotoInfo *info = [[PhotoInfo alloc] init];
                info.userID = [dic objectForKey:@"IdInSource"];
                info.userName = [dic objectForKey:@"UserDisplayName"];
                info.userImageURL = [dic objectForKey:@"MiddlePicture"];
                info.userDescription = [dic objectForKey:@"Description"];
                if (info.userImageURL.length > 0) {
                    info.width = 300 + arc4random() % 200;
                    info.height = 400 + arc4random() % 200;
                }
                
                [_dataArray addObject:info];
                NSLog(@"url = %@",info.userImageURL);
            }
            [_photoWall insertAtEnd:YES];
        }
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Bing score";
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    _idArray = [NSMutableArray arrayWithArray:@[@"10008866",@"1000008",@"1000006",@"1000004",@"1000053",@"10012570"]];
    _dataArray = [[NSMutableArray alloc] init];
    
    [self initWaterFlowView];
    
    [self loadDataByUserID];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:_barHidden animated:NO];
    _isEnterNextView = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - BSWalterFlow DataSourse
- (NSInteger)numberOfViewsInCollectionView:(BSPhotoWall *)collectionView
{
    NSLog(@"count = %i",[_dataArray count]);
    return [_dataArray count];
}

- (BSPhotoView *)collectionView:(BSPhotoWall *)collectionView viewAtIndex:(NSInteger)index
{
    PhotoInfo *info = [_dataArray objectAtIndex:index];
    BSPhotoView *view = (BSPhotoView *)[_photoWall dequeueReusableView];
    if (!view) {
        view = [[BSPhotoView alloc] initWithFrame:CGRectZero];
    }
    [view fillViewWithObject:info];
    return view;
}

- (CGFloat)heightForViewAtIndex:(NSInteger)index
{
    PhotoInfo *info = [_dataArray objectAtIndex:index];
    return [BSPhotoView heightForViewWithObject:info inColumnWidth:147];
}

#pragma mark - ScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
    float offSetY = scrollView.contentOffset.y;
    if (_isEnterNextView) {
        return;
    }
    if (_beginDrag > offSetY) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
    else {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    //设置要不要刷新图片墙
    if (offSetY < 0.0f) {
        return;
    }
    else if (offSetY + _photoWall.frame.size.height > _photoWall.contentSize.height) {
        return;
    }
    else if(abs(offSetY - _beginDrag) >= 30) {
        _beginDrag = offSetY;
        [_photoWall removeAndAddCellsIfNecessary];
    }
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    _beginDrag = scrollView.contentOffset.y;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"scroll.contentSize = %f =====height =  %f ======contentOffset = %f",scrollView.contentSize.height,scrollView.frame.size.height,scrollView.contentOffset.y);
    if (scrollView.contentSize.height <= scrollView.frame.size.height + scrollView.contentOffset.y + 1) {
        [self loadDataByUserID];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate && scrollView.contentSize.height <= scrollView.frame.size.height + scrollView.contentOffset.y + 1) {
        [self loadDataByUserID];
    }
}

#pragma mark - BSView Delegate
- (void)BSPhotoView:(BSPhotoView *)view handleWithInfo:(PhotoInfo *)info
{
    if (info) {
        _barHidden = self.navigationController.isNavigationBarHidden;
        _isEnterNextView = YES;
        ViewController *vc = [[ViewController alloc] initWithInfo:info];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
