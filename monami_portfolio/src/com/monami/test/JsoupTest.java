package com.monami.test;

import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.monami.model.Items;

public class JsoupTest {
//	public static void main(String[] args) {

	public static ArrayList<Items> JsoupItems(String urlString) {
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

		ArrayList<Items> monamiTest = new ArrayList<>();
		
		// 데이터 가져오기
		Elements elements = doc.select(".product-list").select("ul").select("li");
		
		for (Element element : elements) {
			temp = element.select("span"); // span
			imgUrl = temp.select("img").attr("src"); // imgUrl
			name = temp.select(".info").select(".txt-ti").text(); //name
			price = temp.select(".info").select(".txt-price").text(); //price
			System.out.println(imgUrl);
			System.out.println(name);
			System.out.println(price);
			Items items = Items.builder()
						.imgUrl(imgUrl)
						.name(name)
						.price(price)
						.build();
			
			monamiTest.add(items);
		}
		return monamiTest;
	}
}