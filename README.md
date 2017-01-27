# segue跳转传值，返回，回调回返传值
- **segue跳转常用方法**
- **segue显示模式**
- **segue传递数据（参数）方法**
- **segue返回方法**
- **segue返回传值**

-------------------
segue跳转方法一，直接跳转
:  >在storyboard中，右击第一个控制器视图中的按钮（或其他控件）拖动到目标控制器视图，在弹出菜单中，选择一个显示模式即可。

segue跳转方法二，代码跳转
: 1、在storyboard中，选中目标页面，通过最上方的Detail View Controller拖拽到主页面进行segue关联（比如关联到Present Modally）
>右键点击目标视图头部黄色的标志（有一个图标中的左边的那个），在出现的菜单中选择“Present Modally”旁边的圆圈，在圆圈上按住左键拖动到主页面。
或者，右键点击主页面视图头部黄色的标志，拖动到目标控制器视图，在弹出的菜单中，选择“Present Modally”。

: 2、选中关联线，设置segue的 Identifier 属性（这里设置为“goP2Segue”）。
>注意，必须要为 segue 设置Identifier属性，否则程序会崩溃。

: 3、在代码中需要跳转处，执行performSegue方法
>self.performSegue(withIdentifier: "goP2Segue", sender: self)

segue显示模式
: 在iPhone上可以用到的有modal、push和custom，其他还有几种是iPad上用的：
1、modal：模态地加载视图控制器，最常用的方式，类似present和dismiss；
2、push：使用导航栏压进新的视图控制器，类似push和pop，要使用这个模式，跳转的源视图，也就是主控制器必须是Navigation Controller，否则会报错；
3、custom：用户自定义。

segue传递数据（参数）
: 覆写prepare(for segue: UIStoryboardSegue, sender: Any?)
	> 示例代码
	```
    //segue传值示例代码
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //传值到P1
        if segue.identifier == "goP1Segue"{//判断是哪个segue被触发
            //设置目标控制器
            let controller = segue.destination as!P1ViewController
            controller.str = "这是segue传值过来的字符串"//直接设置目标控制器的变量
        }
        //传值到P2
        if segue.identifier == "goP2Segue"{
            let controller = segue.destination as! P2ViewController
            controller.str = "这是segue传值过来的字符串2"//直接设置目标控制器的变量
        }
    }
```

segue返回方法
:  一、dismiss方法返回
	> 示例代码
	```
	//注意：不能在Navigation中使用！！！
	self.presentingViewController!.dismiss(animated: true, completion: nil)
	```
: 二、回调返回（Unwind Segue）
	>1、在主页面控制器中写一个@IBAction修饰的回调的方法
	```
	//segue回调方法，获取返回参数
    @IBAction func backSegue(segue : UIStoryboardSegue){
        if segue.identifier == "backMainForP1"{
            //获取返回的控制器
            let backVC = segue.source as! P1ViewController
            mainLabel.text = backVC.backSting//获取返回值
        }
        if segue.identifier == "backMainForP2"{
            //获取返回的控制器
            let backVC = segue.source as! P2ViewController
            mainLabel.text = backVC.backSting//获取返回值
        }
    }
    ```
    >2、把exit中的回调方法关联到自己的ViewController，（或者直接关联到返回的按钮或其他控件），然后执行performSegue方法：
	```
	@IBAction func backMainVC(_ sender: Any) {
        //segue回调返回，把exit中的回调方法关联到自己的ViewController：
        //关联方法：右击顶部左起第三个图标，选择其中的回调方法，拖到左边第一个按钮，然后点击manual
        //如果直接把exit中的回调函数拖到返回按钮，则将立即执行返回，按钮函数中的执行结果有可能不能被回调
        backSting = "这是P1返回的字符串"
        //如果直接关联到exit，下面的performSegue方法不需要
        performSegue(withIdentifier: "backMainForP1", sender: nil)
    }
	```

segue返回传值
: 返回传值与跳转传值类似，直接在回调方法中获取返回控制器中的属性值
	>示例代码
	```
	//segue回调方法，获取返回参数
    @IBAction func backSegue(segue : UIStoryboardSegue){
        if segue.identifier == "backMainForP1"{
            //获取返回的控制器
            let backVC = segue.source as! P1ViewController
            mainLabel.text = backVC.backSting//获取返回值
        }
        if segue.identifier == "backMainForP2"{
            //获取返回的控制器
            let backVC = segue.source as! P2ViewController
            mainLabel.text = backVC.backSting//获取返回值
        }
    }
	```
  
