# LoopScrollViewSwift
循环滚动的 scrollview


使用简单

        let imageArr = ["0.png" , "1.png" , "2.png" , "3.png" , "4.png"]
        self.view.backgroundColor = UIColor.blackColor()
        let scroll = LoopScrollView(frame: UIScreen.mainScreen().bounds, imageArray: imageArr, superView: self.view)
    
        self.view .addSubview(scroll)
