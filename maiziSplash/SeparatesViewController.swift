//
//  SeparatesViewController.swift
//  maiziSplash
//
//  Created by zhan on 15/11/6.
//  Copyright © 2015年 湛礼翔. All rights reserved.
//

import UIKit

class SeparatesViewController: UIViewController {
  
  var buttonArray: [String] = ["春/秋装","夏装","冬装","皮衣"]
  
  var clothesChooseBar: ClothesChooseBar?
  
  var dataSource: [ClothesInfo]?
  
  let springAndFallClothes = [ClothesInfo(clothesName: "T恤",
                                  season: .springAndFall),
                              ClothesInfo(clothesName: "衬衫", season: .springAndFall),
                              ClothesInfo(clothesName: "短风衣",
                                season: .springAndFall),
                              ClothesInfo(clothesName: "长风衣",
                                season: .springAndFall),
                              ClothesInfo(clothesName: "西装",
                                season: .springAndFall)]
  
  let summerClothes = [ClothesInfo(clothesName: "鸭舌帽", season: .summer),
                       ClothesInfo(clothesName: "短衬衫", season: .summer),
                       ClothesInfo(clothesName: "短裙", season: .summer),
                       ClothesInfo(clothesName: "长裙", season: .summer),
                       ClothesInfo(clothesName: "套裙", season: .summer),
                       ClothesInfo(clothesName: "裤装", season: .summer)]
  
  let winterClothes = [ClothesInfo(clothesName: "保暖衬衫", season: .winter),
                       ClothesInfo(clothesName: "风衣", season: .winter),
                       ClothesInfo(clothesName: "狐狸毛领", season: .winter),
                       ClothesInfo(clothesName: "毛外套", season: .winter),
                       ClothesInfo(clothesName: "棉服", season: .winter),
                       ClothesInfo(clothesName: "呢子大衣", season: .winter),
                       ClothesInfo(clothesName: "睡袍", season: .winter),
                       ClothesInfo(clothesName: "围巾", season: .winter),
                       ClothesInfo(clothesName: "羽绒服", season: .winter)]
  
  let leatherClothes = [ClothesInfo(clothesName: "长款皮衣", season: .leather),
                        ClothesInfo(clothesName: "短款皮衣", season: .leather)]
  
  
  
  @IBOutlet var collectionView: UICollectionView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    clothesChooseBar?.delegate = self
    collectionView.delegate = self
    collectionView.dataSource = self
    
    dataSource = springAndFallClothes
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  //MARK: 设置UI
  func setUI() {
    clothesChooseBar = ClothesChooseBar(frame: CGRect(x: 0,
                                                      y: 64,
                                                  width: screenWidth,
                                                 height: 45),
                                  buttonArray: buttonArray)
    
    self.view.addSubview(clothesChooseBar!)
    self.collectionView.backgroundColor = UIColor.borderColor()
  }
  //MARK: - 导航栏返回按钮的点击事件
  @IBAction func backButtonClick(sender: UIButton) {
    self.navigationController?.popViewControllerAnimated(true)
  }
  
}

//MARK: - ClothesChooseBarDelegate 将选中的button的tag回传到当前controller
extension SeparatesViewController: ClothesChooseBarDelegate {
  func didSelectButton(numbel: Int) {
    switch numbel {
    case 0:
      dataSource = springAndFallClothes
    case 1:
      dataSource = summerClothes
    case 2:
      dataSource = winterClothes
    case 3:
      dataSource = leatherClothes
    default:
      dataSource = nil
    }
    collectionView.reloadData()
  }
}

//MARK: - UICollectionViewDataSource
extension SeparatesViewController: UICollectionViewDataSource {
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return (dataSource?.count)!
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("clothesCell", forIndexPath: indexPath) as! ClothesCell
    cell.clothesImageView.image = dataSource![indexPath.row].clothesImage
    cell.clothesNameLabel.text = dataSource![indexPath.row].clothesName
    cell.priceLabel.text = "￥\(dataSource![indexPath.row].price)"
    return cell
  }
}

//MARK: - UICollectionViewDelegate
extension SeparatesViewController: UICollectionViewDelegate {
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let vc = self.storyboard?.instantiateViewControllerWithIdentifier("addShoopingCartViewController") as! addShoopingCartViewController
    
    //将选中衣服的信息传给模态窗口
    vc.clothesInfo = dataSource![indexPath.row]
    vc.modalPresentationStyle = .Custom
    //let backgroungView =
    //弹出模态窗口
    self.navigationController?.presentViewController(vc, animated: true, completion: { () -> Void in
   
      vc.view.superview?.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
      
    })
  }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SeparatesViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 10
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 10
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSize(width: (screenWidth - 30)/2, height: (screenWidth - 30) * 4 / 7)
  }
}
