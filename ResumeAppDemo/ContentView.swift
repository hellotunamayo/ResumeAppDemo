//
//  ContentView.swift
//  ResumeAppDemo
//
//  Created by Minyoung Yoo on 2023/08/10.
//

import SwiftUI
import SafariServices

struct ProjectList {
    let projectName: String
    let projectTech: String
}

struct MySkill {
    let skillName: String
    let skillDescription: String
}

struct MyAwards {
    let awardName: String
    let awardDesc: String
}

struct ContentView: View {
    @State private var isModalCalled: Bool = false
    @State private var githubUrl: URL = URL(string: "https://github.com/hellotunamayo")!
    @State private var appleUrl: URL = URL(string: "https://apple.com")!
    @State private var modalUrl: URL = URL(string: "https://apple.com")!
    
    var cornerRadius: CGFloat = 10
    
    let gridColumns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    let educationAndCareer: [String] = [
        "멋쟁이 사자처럼 iOS 앱개발 과정 수료",
        "좋은 대학교 국제관계 졸업",
        "일본 ABC대학교 교환학생",
        "NYU advanced language course 수료",
        "뉴욕 ‘blahblah’ 패션 브랜드 패션 마케팅 인턴",
        "A사 마케팅 근무",
        "B사 서비스 운영",
    ]
    
    let mySkill: [MySkill] = [
        MySkill(skillName: "SwiftUI", skillDescription: "화면 구현 뿐만 아니라 데이터 통신을 통한 앱 구현이 가능하며, 배포 한 경험이 있습니다."),
        MySkill(skillName: "UIKit", skillDescription: "스토리보드, 코드를 통해 개발 가능합니다."),
        MySkill(skillName: "Swift Langulage", skillDescription: "Swift 언어의 기본 문법을 이해하고 사용합니다."),
        MySkill(skillName: "MVC/MVVM", skillDescription: "MVC, MVVM 패턴을 활용하여 앱을 만들어본 경험이 있습니다."),
        MySkill(skillName: "Framework And Library", skillDescription: "다양한 프레임워크와 라이브러리를 이해하고 활용 할 수 있습니다.\nCombine, NaverMap, FireBase, Firestore, CoreData, Kingfisher 등 활용해본 경험이 있습니다."),
        MySkill(skillName: "Git&Github", skillDescription: "깃허브를 활용한 앱 버전 관리와 다른사람들과 협업한 경험이 있습니다."),
        MySkill(skillName: "Co-work Tools", skillDescription: "Notion, Slack 등 협업 툴을 활용하여 의사소통 가능합니다."),
    ]

    let projectList: [ProjectList] = [
        ProjectList(projectName: "ZeroCounter", projectTech: "SwiftUI / Core Data"),
        ProjectList(projectName: "Movabble Type", projectTech: "SwiftUI / UIKit"),
        ProjectList(projectName: "Something Fantastic App", projectTech: "SwiftUI, Firebase"),
        ProjectList(projectName: "Anything Amazing App", projectTech: "UIKit, Firebase")
    ]
    
    let myAwards: [MyAwards] = [
        MyAwards(awardName: "멋쟁이사자처럼 해커톤 대상", awardDesc: "2023 / SwiftUI, Firebase"),
        MyAwards(awardName: "앱 스토어 사진 카테고리 우수 앱 선정", awardDesc: "2022 / SwiftUI, UIKit"),
    ]
    
    
    var body: some View {
        ScrollView{
            //MARK: Hero Image
            ZStack{
                VStack{
                    Image("heroimage")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                HStack{
                    VStack(alignment: .leading){
                        Text("**iOS개발자 장원영 이력서**")
                            .setTextType(textCase: .heading)
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0.5, trailing: 0))
                        
                        Text("안녕하세요. 코딩 전사 장원영입니다.")
                            .setTextType(textCase: .subHeading)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 0, leading: 40, bottom: 0, trailing: 40))
            }
            .frame(idealWidth: .infinity, idealHeight: 500, maxHeight: 500, alignment: .center)
            .clipped()
            .listRowSeparator(.hidden)
            
            //MARK: Bio / Channel
            LazyVGrid(columns: gridColumns,alignment: .center, spacing: 30){
                VStack(alignment: .leading){
                    HStack{
                        Text("Biography")
                            .setTextType(textCase: .sectionTitle)
                        Spacer()
                    }
                    .padding(20)
                    
                    HStack{
                        Text("장원영")
                            .font(.system(.largeTitle))
                        Spacer()
                        Text("1999 / 02 / 03")
                    }
                    .padding(20)
                    
                    Button {
                        //이메일 클라이언트로 보내주는 무언가
                    } label: {
                        Label("이메일", systemImage: "envelope")
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(20)
                }
                .background(Color.white)
                .cornerRadius(cornerRadius)
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Channel")
                            .setTextType(textCase: .sectionTitle)
                        Spacer()
                    }
                    .padding(20)
                    VStack(alignment: .leading){
                        Button {
                            modalUrl = githubUrl
                            isModalCalled.toggle()
                        } label: {
                            Label("Visit my Github", systemImage: "globe")
                        }
                        .buttonStyle(.borderedProminent)
                        
                        Button {
                            modalUrl = appleUrl
                            isModalCalled.toggle()
                        } label: {
                            Label("Visit my website", systemImage: "globe")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                    
                    Spacer()
                }
                .background(Color.white)
                .cornerRadius(cornerRadius)
            }
            .frame(idealWidth: UIScreen.main.bounds.width)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
            
            //MARK: Education & Career
            VStack(alignment: .leading){
                HStack{
                    Text("Education & Career")
                        .setTextType(textCase: .sectionTitle)
                        .padding()
                    
                    Spacer()
                }
                VStack(alignment: .leading){
                    ForEach(educationAndCareer.indices, id: \.self) { index in
                        Text("\(index + 1). \(educationAndCareer[index])")
                            .setTextType(textCase: .bodyText)
                            .padding(EdgeInsets(top: 5, leading: 20, bottom: 20, trailing: 20))
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .background(Color.white)
            .cornerRadius(cornerRadius)
            
            //MARK: Project & Skill
            LazyVGrid(columns: gridColumns,alignment: .center, spacing: 30){
                VStack(alignment: .leading){
                    HStack{
                        Text("Project")
                            .setTextType(textCase: .sectionTitle)
                        Spacer()
                    }
                    .padding(20)
                    
                    VStack(alignment: .leading){
                        ForEach(projectList.indices, id:\.self) { index in
                            HStack(alignment:.center){
                                Text("**\(projectList[index].projectName)**")
                                    .setTextType(textCase: .listTitle)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                                Spacer()
                                Text("\(projectList[index].projectTech)")
                                    .setTextType(textCase: .caption)
                                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))
                            }
                        }
                    }
                    
                    Spacer()
                }
                .frame(minHeight: 300)
                .background(Color.white)
                .cornerRadius(cornerRadius)
                
                VStack(alignment: .leading){
                    HStack{
                        Text("Skill")
                            .setTextType(textCase: .sectionTitle)
                        Spacer()
                    }
                    .padding(20)
                    
                    VStack(alignment: .leading){
                        ForEach(mySkill.indices, id:\.self){ index in
                            Text("**\(mySkill[index].skillName)**")
                                .setTextType(textCase: .subHeading)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0.5, trailing: 20))
                            Text("\(mySkill[index].skillDescription)")
                                .setTextType(textCase: .caption)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20))
                        }
                    }
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
                    
                }
                .background(Color.white)
                .cornerRadius(cornerRadius)
            }
            .frame(idealWidth: UIScreen.main.bounds.width)
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            //MARK: Winning & Awards
            VStack(alignment: .leading){
                HStack{
                    Text("Winning & Awards")
                        .setTextType(textCase: .sectionTitle)
                        .padding()
                    
                    Spacer()
                }
                VStack(alignment: .leading){
                    ForEach(myAwards.indices, id:\.self){ index in
                        HStack{
                            Text("**\(myAwards[index].awardName)**")
                                .setTextType(textCase: .listTitle)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0.5, trailing: 20))
                            
                            Spacer()
                            
                            Text("\(myAwards[index].awardDesc)")
                                .setTextType(textCase: .caption)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 30, trailing: 20))
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .background(Color.white)
            .cornerRadius(cornerRadius)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 30, trailing: 0))
            
        }
        .background(Color(red: 0.9, green: 0.9, blue: 0.9))
        .ignoresSafeArea()
        .sheet(isPresented: $isModalCalled) {
            SafariContentView(sentUrl: $modalUrl)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//SafariView
struct SafariContentView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    @Binding var sentUrl: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let uiViewController = SFSafariViewController(url: sentUrl)
        uiViewController.delegate = context.coordinator
        return uiViewController
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {

    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    class Coordinator: NSObject, SFSafariViewControllerDelegate {
        func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
            
        }
    }
}

//Set Typographic Specs
extension Text {
    enum customTextCase {
        case heading, subHeading, sectionTitle, bodyText, listTitle, caption
    }
    
    func setTextType(textCase: customTextCase) -> some View {
        switch textCase {
        case .heading:
            return self.font(.system(size: 60, design: .default))
        case .subHeading:
            return self.font(.system(size: 25, weight: .medium, design: .default))
        case .sectionTitle:
            return self.font(.system(size: 35, weight: .bold, design: .default))
        case .bodyText:
            return self.font(.system(size: 22, weight: .regular, design: .default))
        case .listTitle:
            return self.font(.system(size: 22, weight: .medium, design: .default))
        case .caption:
            return self.font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(Color.gray)
        }
    }
}

















































