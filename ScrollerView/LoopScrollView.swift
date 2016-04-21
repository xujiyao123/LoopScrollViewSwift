//
//  LoopScrollView.swift
//  ScrollerView
//
//  Created by sunnytu on 16/4/21.
//  Copyright © 2016年 sunnytu. All rights reserved.
//

import UIKit
let SCREENWIDTH = UIScreen.mainScreen().bounds.width
let SCREENHEIGHT = UIScreen.mainScreen().bounds.height
class LoopScrollView: UIScrollView , UIScrollViewDelegate {
    
    var imgArr : [String] = []
    var pageIndicatorColor : UIColor!
    var currentPageIndicatorClolr : UIColor!
    
    
    internal var imageCoutn : Int = 0
    internal var currentImageIndex : Int = 0
    internal var pageControl : UIPageControl!
    internal var superView: UIView!
   internal var imageViewLeft : UIImageView!
   internal var imageViewCenter : UIImageView!
   internal var imageViewRight : UIImageView!
    
    
    init(frame: CGRect , imageArray: [String] , superView: UIView) {
        super.init(frame: frame)
        
        if imageArray.count == 0 {
            return;
        }
        
        self.imgArr = imageArray
        self.superView = superView
        self.imageCoutn = imageArray.count
        
      
        self.contentSize = CGSizeMake(SCREENWIDTH * 3, SCREENHEIGHT)
        self.contentOffset = CGPointMake(SCREENWIDTH, 0)
        self.pagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.delegate = self
        
   
        
        self.imageViewLeft = UIImageView(frame: CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT))
        self.imageViewLeft.contentMode =  .ScaleAspectFit
        self.addSubview(imageViewLeft)
        
        self.imageViewCenter = UIImageView(frame: CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, SCREENHEIGHT))
        self.imageViewCenter.contentMode =  .ScaleAspectFit
        self.addSubview(imageViewCenter)
        
        self.imageViewRight = UIImageView(frame: CGRectMake(SCREENWIDTH * 2, 0, SCREENWIDTH, SCREENHEIGHT))
        self.imageViewRight.contentMode =  .ScaleAspectFit
        self.addSubview(imageViewRight)
        
        pageControl  = UIPageControl()
        let size = pageControl.sizeForNumberOfPages(self.imageCoutn)
        pageControl.bounds = CGRectMake(0, 0, size.width, size.height)
        pageControl.center = CGPointMake(SCREENWIDTH / 2, SCREENHEIGHT - 80)
        pageControl.numberOfPages = imageCoutn
        pageControl.pageIndicatorTintColor = pageIndicatorColor != nil ? pageIndicatorColor : UIColor.whiteColor()
        pageControl.currentPageIndicatorTintColor = currentPageIndicatorClolr != nil ? currentPageIndicatorClolr : UIColor.redColor()
        pageControl.userInteractionEnabled = false
        superView.addSubview(pageControl)
        
        
        setImageInfo(0)
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageInfo(currentImageIndex : Int) -> Void {
        
        self.imageViewCenter.image = UIImage(named: self.imgArr[currentImageIndex])
        self.imageViewLeft.image = UIImage(named: self.imgArr[(currentImageIndex - 1 + self.imageCoutn) % self.imageCoutn ] )
        self.imageViewRight.image = UIImage(named: self.imgArr[(currentImageIndex + 1) % self.imageCoutn])
        self.pageControl.currentPage = currentImageIndex
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView == self {
            
            let contOffest = scrollView.contentOffset
            if contOffest.x > SCREENWIDTH {
                self.currentImageIndex = (self.currentImageIndex + 1) % self.imageCoutn
            }else if contOffest.x < SCREENWIDTH {
                self.currentImageIndex = (self.currentImageIndex - 1 + self.imageCoutn) % self.imageCoutn
            }
            setImageInfo(self.currentImageIndex)

         self.contentOffset = CGPointMake(SCREENWIDTH, 0)
            self.pageControl.currentPage = self.currentImageIndex
            
            
            
        }
        
        
    }
    
    

}
