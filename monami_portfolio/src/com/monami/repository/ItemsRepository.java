package com.monami.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.monami.db.DBConn;
import com.monami.model.Items;

public class ItemsRepository {
	private static final String TAG = "ItemsRepository : "; // TAG 생성 (오류 발견시 용이)
	private static ItemsRepository instance = new ItemsRepository();

	private ItemsRepository() {}

	public static ItemsRepository getInstance() {
		return instance;
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// 아이템 받기
	public List<Items> findAllItems() { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = "SELECT id, imgUrl, name, price,value FROM items";
		List<Items> items = new ArrayList<>();
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// while 돌려서 rs -> java오브젝트에 집어넣기
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Items item = Items.builder()
								.id(rs.getInt(1))
								.imgUrl(rs.getString(2))
								.name(rs.getString(3))
								.price(rs.getString(4))
								.value(rs.getString(5))
								.build();
				items.add(item);
			}
			return items;
		} catch (SQLException e) {
			e.printStackTrace(); 
			System.out.println(TAG + "findAll : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null; // 실패시
	}
	
	// 아이템 넣기
	public int insertItem(Items item, String value) { // object 받기(안에 내용 다 받아야 하니까) // insert하고 싶으면 save
		final String SQL = "INSERT INTO items(id, imgUrl, name, price, value) " + "VALUES(ITEMS_SEQ.nextval,?,?,?,?)";																																															// update
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			
			// 물음표 완성하기
			pstmt.setString(1, item.getImgUrl());
			pstmt.setString(2, item.getName());
			pstmt.setString(3, item.getPrice());
			pstmt.setString(4, value);
			
			return pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "insertItem : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1; // 실패시
	}
	
	// 아이템  찾기
	public List<Items> findByItem(String value) {
		final String SQL = "SELECT id, value FROM items WHERE value=? ";																																															// update
		List<Items> items = new ArrayList<>();
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// 물음표 완성하기
			pstmt.setString(1, value);
			while(rs.next()) {
				Items item = Items.builder()
								.id(rs.getInt(1))
								.value(rs.getString(2))
								.build();
				items.add(item);
			}
			return items;
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "findByItem : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return null; // 실패시
	}
}
