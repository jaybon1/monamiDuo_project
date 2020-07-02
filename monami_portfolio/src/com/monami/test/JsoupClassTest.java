package com.monami.test;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.monami.model.Classes;


// class 페이지 웹크롤링 테스트
public class JsoupClassTest {
//	public static void main(String[] args) {
		public static ArrayList<Classes> JsoupClass(String urlString){
//			String url = "http://monamiconcept.com/news/";
			Document doc = null;
			Elements temp;
			String imgUrl = null;
			String aLink = null;
			
			try {
//				doc = Jsoup.connect(url).get();
				doc = Jsoup.parse(StringHtml.getHtml());
			} catch (Exception e) {
				e.printStackTrace();
			}
			ArrayList<Classes> classTest = new ArrayList<>();
			
			// 데이터 가져오기
			// elements는 여러개를 가지고 오는 배열이기 때문에 반복될 요소를 넣어줘야한다.
			Elements elements = doc.select(".fusion-image-wrapper");
			
			for(Element element : elements) {
//				temp = element.select(".fusion-image-wrapper"); // 전체요소
				imgUrl = element.select(".attachment-full").attr("src"); // imgUrl
				aLink = element.select(".fusion-rollover-title").select("a").attr("href"); //aLink
//				System.out.println(imgUrl);
//				System.out.println(aLink);
				Classes classes = Classes.builder()
									.imgUrl(imgUrl)
									.alink(aLink)
									.build();
				classTest.add(classes);
						
			}
			
//			System.out.println(classTest);
			return classTest;
//		} //main 출력
		
	} 
}
