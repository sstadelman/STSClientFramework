//
//  MasterViewController.m
//  STSClientFramework
//
//  Created by Stadelman, Stan on 5/16/14.
//  Copyright (c) 2014 Stan Stadelman. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

#import "Client.h"
#import "MyObject.h"

@interface MasterViewController () {
    RACSignal *objectsLoaded;
}

@property (nonatomic, strong) NSMutableArray *myObjects;
@property (nonatomic, strong) NSMutableArray *myLinkedObjects;

@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    RAC(self, title) = [[[RACObserve(self, dataObject) ignore:nil] deliverOn:[RACScheduler mainThreadScheduler]] map:^id(MyObject *value) {
        return [NSString stringWithFormat:@"%@", value.myProperty];
    }];
    
    objectsLoaded = [RACObserve(self, myObjects) map:^id(NSArray *value) {
        //        NSLog(@"myObjects = %@", value);
        return @(value.count > 0);
    }];
    
    @weakify(self);
    [[RACObserve(self, dataObject) filter:^BOOL(id value) {
        return value != nil;
    }] subscribeNext:^(MyObject *x) {
        
        // get the sales orders for the business partner, and set to the DataViewController salesOrders property
        NSString *linkInfo = x.myDictProperty[@"__deferred"][@"uri"];
        if (linkInfo != nil) {
            
            RAC(self, myLinkedObjects) = [[[[Client fetchSomeObjects:@{@"url":linkInfo}] doCompleted:^{
            }] logError] catchTo:[RACSignal empty]];
        }

        @strongify(self);
        
        //do something else with self and x
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!self.myObjects) {
        self.myObjects = [[NSMutableArray alloc] init];
    }
    
    [self.myObjects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.myObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSDate *object = self.myObjects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"showDetail"]) {
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        NSDate *object = self.myObjects[indexPath.row];
//        [[segue destinationViewController] setDetailItem:object];
//    }
//}

@end
