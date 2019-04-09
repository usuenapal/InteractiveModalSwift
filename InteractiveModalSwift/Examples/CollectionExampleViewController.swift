//
//  CollectionExampleViewController.swift
//  InteractiveModalSwift
//
//  Created by Usue Napal on 09/04/2019.
//  Copyright © 2019 Usit Development. All rights reserved.
//

import UIKit

class CollectionExampleViewController: InteractiveModal, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    @IBOutlet var collectionView: UICollectionView?
    let cellId: String = "CollectionCell"
    let images: Array = ["https://digitaldeleon.com/wp-content/uploads/2018/04/digitaldeleon-com-2018-04-20-10-0426-235824.jpg", "https://www.telegraph.co.uk/content/dam/pets/2017/01/06/1-JS117202740-yana-two-face-cat-news_trans_NvBQzQNjv4BqJNqHJA5DVIMqgv_1zKR2kxRY9bnFVTp4QZlQjJfe6H0.jpg?imwidth=1400", "https://www.notigatos.es/wp-content/uploads/2017/10/gato-encima-de-la-mesa-830x553.jpg", "https://www.hogarmania.com/archivos/201610/como-ven-los-gatos-XxXx80.jpg", "https://www.webconsultas.com/sites/default/files/styles/encabezado_articulo/public/articulos/intoxicacion-gatos.jpg?itok=ZEdt0aON", "https://static.vix.com/es/sites/default/files/styles/large/public/btg/curiosidades.batanga.com/files/8-sorprendentes-cosas-que-no-sabias-sobre-los-gatos-4.jpg?itok=SBwPbF17", "https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2017/11/274699-entender-gato.jpg?itok=UDpzBDsf", "https://avatars3.githubusercontent.com/u/15411594?s=460&v=4", "https://ichef.bbci.co.uk/news/660/cpsprodpb/FDD6/production/_100728946_catrelax.jpg", "https://s.libertaddigital.com/fotos/noticias/1920/1080/fit/gato-grunon.jpg"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        collectionView?.delegate = self
        collectionView?.register(UINib.init(nibName: cellId, bundle: nil), forCellWithReuseIdentifier: cellId)
    }
    
    
    //MARK - CollectionView
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell: CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CollectionCell
        cell.configureCellWithImageUrl(url: URL.init(string: images[indexPath.row]) ?? URL.init(string: "")!)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize.init(width: collectionView.frame.size.width/2 - 10.0, height: 150.0)
    }
}
