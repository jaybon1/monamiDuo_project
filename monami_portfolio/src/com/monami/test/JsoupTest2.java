package com.monami.test;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.monami.model.Items;

public class JsoupTest2 {
//	public static void main(String[] args) {
	
//	"https://www.monamimall.com/w/product/productDetail.do?goodsNo=MG000003497"
	public static Items JsoupItems(String urlString) {
		String url = urlString;
		Document doc = null;
		Elements temp;
		String imgUrl = null;
		String name = null;
		String price = null;
		
		try {
			doc = Jsoup.connect(url).get();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		Items item = Items.builder().build();
		
		//test
		Elements elementsCate = doc.select("#cateLocation2");
		
		if(elementsCate.select("option[selected='selected']").text().equals("프리미엄 펜")||
				elementsCate.select("option[selected='selected']").text().equals("펜/펜슬")||
				elementsCate.select("option[selected='selected']").text().equals("마카")||
				elementsCate.select("option[selected='selected']").text().equals("컬러링/브러쉬")||
				elementsCate.select("option[selected='selected']").text().equals("디자인 문구")) {
			
			
			if(elementsCate.select("option[selected='selected']").text().equals("프리미엄 펜")) {
				item.setValue("prPen");
			} else if(elementsCate.select("option[selected='selected']").text().equals("펜/펜슬")) {
				item.setValue("pen");
			} else if(elementsCate.select("option[selected='selected']").text().equals("마카")) {
				item.setValue("mark");
			} else if(elementsCate.select("option[selected='selected']").text().equals("컬러링/브러쉬")) {
				item.setValue("brush");
			} else if(elementsCate.select("option[selected='selected']").text().equals("디자인 문구")) {
				item.setValue("designSt");
			}
			
			
			Elements elements = doc.select(".pinfo-txt");
			
			for (int i = 0; i < elements.select("th").size(); i++) {
//				System.out.println();
				
				if(elements.select("th").get(i).text().equals("바디컬러")) {
					
					StringBuilder sb = new StringBuilder();
					
					for (int j = 0; j < elements.select("td").get(i).select("li").size(); j++) {
						
						sb.append(elements.select("td").get(i).select("li").get(j).select("img").attr("src"));
						sb.append("!!");
						sb.append(elements.select("td").get(i).select("li").get(j).select("span").text());
						if(j < elements.select("td").get(i).select("li").size() - 1) {
							sb.append(",,");
						}
					}
//					System.out.println("바디컬러");
//					System.out.println(sb.toString());
					item.setBodyColor(sb.toString());
					
				} else if(elements.select("th").get(i).text().equals("잉크컬러")) {
					
					StringBuilder sb = new StringBuilder();
					
						for (int j = 0; j < elements.select("td").get(i).select("li").size(); j++) {
						
						sb.append(elements.select("td").get(i).select("li").get(j).select("img").attr("src"));
						sb.append("!!");
						sb.append(elements.select("td").get(i).select("li").get(j).select("span").text());
						if(j < elements.select("td").get(i).select("li").size() - 1) {
							sb.append(",,");
						}
					}
//					System.out.println("잉크컬러");
//					System.out.println(sb.toString());
					item.setInkColor(sb.toString());
					
				} else if(elements.select("th").get(i).text().equals("심두께및스펙")) {
					
//					System.out.println(elements.select("td").get(i).select("li"));
					
					StringBuilder sb = new StringBuilder();
					
					for (int j = 0; j < elements.select("td").get(i).select("li").size(); j++) {
						
						sb.append(elements.select("td").get(i).select("li").get(j).select("img").attr("src"));
						sb.append("!!");
						sb.append(elements.select("td").get(i).select("li").get(j).text());
						if(j < elements.select("td").get(i).select("li").size() - 1) {
							sb.append(",,");
						}
					}
//					System.out.println("심두께및스펙");
//					System.out.println(sb.toString());
					item.setProductSpec(sb.toString());
					
					
				} else if(elements.select("th").get(i).text().equals("특징")) {
					
//					System.out.println("특징");
//					System.out.println(elements.select("td").get(i).select("td").text());
					item.setCharac(elements.select("td").get(i).select("td").text());
					
				} else if(elements.select("th").get(i).text().equals("주요특징")) {
					
					
//					System.out.println(elements.select("td").get(i).select("span"));
					
					StringBuilder sb = new StringBuilder();
					
					for (int j = 0; j < elements.select("td").get(i).select("span").size(); j++) {
						
						sb.append(elements.select("td").get(i).select("span").get(j).text());
						if(j < elements.select("td").get(i).select("span").size() - 1) {
							sb.append(",,");
						}
					}
//					System.out.println("주요특징");
//					System.out.println(sb.toString());
					item.setMainCharac(sb.toString());
					
				} else if(elements.select("th").get(i).text().equals("판매가")) {
					
//					System.out.println("판매가");
//					System.out.println(elements.select("td").get(i).select("em").text());
					item.setPrice(elements.select("td").get(i).select("span").select("em").text());
					
				}
				
			}
			
			Elements elements1 = doc.select(".proinfo").select("strong");
			 
//			System.out.println("제품명");
//			System.out.println(elements1.get(0).text()); //품목명
			item.setName(elements1.get(0).text());
			
//			System.out.println();
			
			
			Elements elements2 = doc.select(".bpic").select("img");
//			System.out.println("제품이미지");
//			System.out.println(elements2.attr("src")); // 제품이미지
			item.setImgUrl(elements2.attr("src"));
			
//			System.out.println();
			
//			System.out.println("상세이미지");
			Elements elements3 = doc.select(".info-pic").select("img");
//			System.out.println(elements3.attr("src")); // 상세이미지
			item.setDetailImgUrl(elements3.attr("src"));
			
		} 
		
		return item; 

		
		//test
		
		

//		ArrayList<Items> monamiTest = new ArrayList<>();
//		
//		// 데이터 가져오기
//		Elements elements = doc.select(".product-list").select("ul").select("li");
//		
//		for (Element element : elements) {
//			temp = element.select("span"); // span
//			imgUrl = temp.select("img").attr("src"); // imgUrl
//			name = temp.select(".info").select(".txt-ti").text(); //name
//			price = temp.select(".info").select(".txt-price").text(); //price
//			System.out.println(imgUrl);
//			System.out.println(name);
//			System.out.println(price);
//			Items items = Items.builder()
//						.imgUrl(imgUrl)
//						.name(name)
//						.price(price)
//						.build();
//			
//			monamiTest.add(items);
//		}
//		return monamiTest;
	}
}