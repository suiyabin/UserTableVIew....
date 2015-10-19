//
//  ViewController.m
//  USerTableView....
//
//  Created by echo42 on 15/10/19.
//  Copyright © 2015年 echo. All rights reserved.
//

#import "ViewController.h"

//设置tableView代理
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic,strong)NSArray *numberArray;//初始化一个全局的数字数组
@property(nonatomic,strong)NSArray *letterArray;//初始化一个全局的字母数组

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _numberArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];//给数组赋值
    _letterArray = @[@"a",@"b",@"c",@"d",@"e",@"f",@"g"];//给数组赋值
    
    [self addTableView];//加载页面
}

//创建一个页面
-(void)addTableView{

    //初始化tableview对象、位置、风格
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableView.dataSource = self;//设置数据源代理
    tableView.delegate = self;//设置代理
    [self.view addSubview:tableView];//加载视图
    
    tableView.tableFooterView = [[UIView alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma table - 代理

//tableview中一共有多少块儿
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

//每块儿中又多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {//判断是第几块儿
        return _numberArray.count;
    }else{
    
        return _letterArray.count;
    }
}


//加载cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    //初始化一个静态的字符串
    static NSString *reuseIdent = @"cellIdent";
    //tableview的复用机制
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdent];
    if (!cell) {
        //创建cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdent];
    }
    
    if (indexPath.section ==0) {//判断是哪一块儿
        cell.textLabel.text = _numberArray[indexPath.row];
    }else if (indexPath.section == 1){
    
        cell.textLabel.text = _letterArray[indexPath.row];
    }
    
    return cell;
}

//块儿的标题
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return @"数字";
    }else if (section == 1){
    
        return @"字母";
    }else{
    
        return nil;
    }
        
}





#pragma end




@end
