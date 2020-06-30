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
	
	
	public int deleteById(int id) { // object 받기(안에 내용 다 받아야 하니까)
		
		final String SQL = "DELETE FROM items WHERE id = ?";
		
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "deleteById : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		
		return -1; // 실패시
		
	}
	
	
	// 아이템 받기
	public List<Items> findAllItems() { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = "SELECT id, imgUrl, name, price, value FROM items";
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
	
	
	// 아이템 20개씩 출력
	public List<Items> find20ItemsByPage(int page) { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = 
				"SELECT /*+ index_desc(items ITEMS_PK)  */ id, imgurl, name, price, value " + 
				"FROM items " + 
				"OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY ";
		List<Items> itemList = new ArrayList<>();
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, page*20);
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
				itemList.add(item);
			}
			return itemList;
		} catch (SQLException e) {
			e.printStackTrace(); 
			System.out.println(TAG + "find20Items : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null; // 실패시
	}
	
	// 파트별로 가져오기 (새로운 기능을 추가할 때는 새로 액션도 새로 추가 하기)
	public List<Items> find20ItemsByPage(int page, String value) { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = 
				"SELECT /*+ index_desc(items ITEMS_PK)  */ id, imgurl, name, price, value " + 
				"FROM items " + 
				"WHERE value = ? " +
				"OFFSET ? ROWS FETCH NEXT 20 ROWS ONLY ";
		List<Items> itemList = new ArrayList<>();
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, value);
			pstmt.setInt(2, page*20);
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
				itemList.add(item);
			}
			return itemList;
		} catch (SQLException e) {
			e.printStackTrace(); 
			System.out.println(TAG + "find20Items : " + e.getMessage());
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
	
	public int insertItem(Items item) { // object 받기(안에 내용 다 받아야 하니까) // insert하고 싶으면 save
		final String SQL = "INSERT INTO items(id, imgUrl, name, price, value, bodycolor, inkcolor, productspec, charac, maincharac, detailimgurl) " + "VALUES(ITEMS_SEQ.nextval,?,?,?,?,?,?,?,?,?,?)";																																															// update
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			
			// 물음표 완성하기
			pstmt.setString(1, item.getImgUrl());
			pstmt.setString(2, item.getName());
			pstmt.setString(3, item.getPrice());
			pstmt.setString(4, item.getValue());
			pstmt.setString(5, item.getBodyColor());
			pstmt.setString(6, item.getInkColor());
			pstmt.setString(7, item.getProductSpec());
			pstmt.setString(8, item.getCharac());
			pstmt.setString(9, item.getMainCharac());
			pstmt.setString(10, item.getDetailImgUrl());
			
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
		final String SQL = "SELECT id, imgUrl, name, price FROM items WHERE value=? ";																																															// update
		List<Items> items = new ArrayList<>();
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// 물음표 완성하기
			pstmt.setString(1, value);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Items item = Items.builder()
								.id(rs.getInt(1))
								.imgUrl(rs.getString(2))
								.name(rs.getString(3))
								.price(rs.getString(4))
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
