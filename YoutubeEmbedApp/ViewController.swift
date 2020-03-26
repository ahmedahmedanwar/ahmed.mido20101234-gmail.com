//
//  ViewController.swift
//  YoutubeEmbedApp
//
//  Created by MAC on 6/1/19.
//  Copyright © 2019 cagdaseksi. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    var videos:[Video] = []
    var video:Video = Video()
    let API_KEY = "AIzaSyBIOWykpurpY1Y3sMQ-18Aix8ABdu6PqWk"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        request()
        
        let video = Video()
            video.Key = "WEzVpZXyTZ0"
            video.Title = "iOS 13.4 is Out! - What's New?"
            videos.append(video)
            
            
            let video2 = Video()
            video2.Key = "SKBGvV9LW58"
            video2.Title = "iPhone 11: My Honest Opinion After Two Months"
            videos.append(video2)
            
            
            let video3 = Video()
            video3.Key = "hjfUrKxM1ds"
            video3.Title = "Fake IPhone BETTER than the REAL????"
            videos.append(video3)
            
            
            let video4 = Video()
            video4.Key = "v_5KcoSwmg4"
            video4.Title = "Steve Jobs PISSED OFF moments 1997 2010"
            videos.append(video4)
            
            
            
            let video5 = Video()
            video5.Key = "sX1Y2JMK6g8"
            video5.Title = "SpaceX Falcon Heavy- Elon Musk's Engineering Masterpiece"
            
            videos.append(video5)
            
            let video6 = Video()
            video6.Key = "wbSwFU6tY1c"
            video6.Title = "Falcon Heavy Test Flight"
            videos.append(video6)
            
            
            let video7 = Video()
            video7.Key = "hh6xTguRn9o"
            video7.Title = "Bill Gates explains how vaccines work"
            
            videos.append(video7)
            
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! VideoTableViewCell
        
        cell.videoTitle.text = videos[indexPath.row].Title
        let url = "https://img.youtube.com/vi/\(videos[indexPath.row].Key)/0.jpg"
        cell.videoImage.downloaded(from: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vi = videos[indexPath.row]
        self.video = vi
        
        performSegue(withIdentifier: "toVideo", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toVideo" {
            
            let vc = segue.destination as! VideoViewController
            vc.video = self.video
            
        }
        
    }
    
    func request(){
        
        let url = "https://www.googleapis.com/youtube/v3/videos?part=snippet&chart=mostPopular&maxResults=5&key=\(API_KEY)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse) in
            switch(response.result) {
            case .success(let value):
                print(value)
                let temp = response.response?.statusCode ?? 400
                print(temp)
                if temp >= 300 {
                    do {
                        let err = try JSONDecoder().decode(ErrorHandler.self, from: response.data!)
                        print(err.message ?? "")
                        print(temp)
                    }catch{
                        print("errorrrrelse")
                    }
                }else{
                    do {
                        let welcome = try JSONDecoder().decode(Welcome.self, from: response.data!)
                        print(welcome)
                    }catch{
                        print (error)
                        print("errorrrr catcchhchchchc")
                    }
                }
            case .failure(_):
                let lockString = NSLocalizedString("Something went wrong please try again later", comment: "حدث خطأ برجاء اعادة المحاولة")
                print(lockString)
                break
            }
        }
    }
    
}

class Video{
    var Key:String = ""
    var Title:String = ""
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
    
    
}
