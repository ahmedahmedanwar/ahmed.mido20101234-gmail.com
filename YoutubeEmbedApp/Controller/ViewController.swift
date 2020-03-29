//
//  ViewController.swift
//  YoutubeEmbedApp
//
//  Created by MAC on 6/1/19.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

@available(iOS 13.0, *)
class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var videos:[Video] = []
        var video:Video = Video()
        var videoArray = [Video]()
        let API_KEY = "AIzaSyBIOWykpurpY1Y3sMQ-18Aix8ABdu6PqWk"
        let CHANNEL_ID = "UCGIY_O-8vW4rfX98KlMkvRg"
        var youtubeModel : YoutubeModel?
        
        // Edit
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            getData()
            
        }
        
        func getData(){
        Services.getYoutubeData( part: "snippet", channelId: "UCGIY_O-8vW4rfX98KlMkvRg", callback: { [weak self] (result,stats)  in
               guard let self = self else {return}
              print(result)
            self.youtubeModel = result
            self.tableView.reloadData()
              print("stats code is \(stats)")
             }) { (error,stats) in
              print("error stats code is \(stats)")
                print(error.localizedDescription)
             }
          }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return youtubeModel?.items.count ?? 0
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
            cell.videoImage.sd_setImage(with: URL(string: youtubeModel?.items[indexPath.row].snippet.thumbnails.medium.url ?? ""), placeholderImage: UIImage(named: "appIcon1"))
            cell.videoTitle.text = youtubeModel?.items[indexPath.row].snippet.channelTitle
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            print("You selected cell #\(indexPath.row)!")

            let selectedVideo = youtubeModel?.items[indexPath.row].snippet.channelID
            let indexPath = tableView.indexPathForSelectedRow

            if let viewController = storyboard?.instantiateViewController(identifier: "videosList") as?
                VideosListChanViewController{
            
                
                navigationController?.pushViewController(viewController, animated: true)
                
            }
            
            //code for move next VC
                 let secondVC = storyboard?.instantiateViewController(withIdentifier: "videosList") as! VideosListChanViewController
                         self.navigationController?.pushViewController(secondVC, animated: true)

}
}

//        }
//
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        }
//        /*
//        func request(){
//
//            let url = "https://www.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=5&key=\(API_KEY)"
//
//            Alamofire.request(url, method: .get, parameters: ["part":"snippet","channelId": CHANNEL_ID ], encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse) in
//                switch(response.result) {
//                //    var arrayOfVideos = [Video]()
//                case .success(let value):
//                    print("dahjkl;")
//                    print(value)
//                    let temp = response.response?.statusCode ?? 400
//                    print(temp)
//                    if temp >= 300 {
//                        do {
//                            let err = try JSONDecoder().decode(ErrorHandler.self, from: response.data!)
//                            print(err.message ?? "")
//                            print(temp)
//                        }catch{
//                            print("errorrrrelse")
//                        }
//                    }else{
//                        do {
//                            let welcome = try JSONDecoder().decode(Welcome.self, from: response.data!)
//                            print(welcome)
//
//
//                        }catch{
//                            print (error)
//                            print("errorrrr catcchhchchchc")
//                        }
//                    }
//                case .failure(_):
//                    let lockString = NSLocalizedString("Something went wrong please try again later", comment: "حدث خطأ برجاء اعادة المحاولة")
//                    print(lockString)
//                    break
//                }
//            }
//        }
//     */
//
//    }

//    extension UIImageView {
//        func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
//            contentMode = mode
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                guard
//                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                    let data = data, error == nil,
//                    let image = UIImage(data: data)
//                    else { return }
//                DispatchQueue.main.async() {
//                    self.image = image
//                }
//            }.resume()
//        }
//        func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
//            guard let url = URL(string: link) else { return }
//            downloaded(from: url, contentMode: mode)
//        }
//
//
//    }
//
