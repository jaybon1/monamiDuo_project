package com.monami.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.monami.db.DBConn;
import com.monami.dto.CartDto;
import com.monami.model.Cart;
import com.monami.model.Items;

public class CartRepository {
	private static final String TAG = "ItemsRepository : "; // TAG 생성 (오류 발견시 용이)
	private static CartRepository instance = new CartRepository();

	private CartRepository() {}

	public static CartRepository getInstance() {
		return instance;
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	public int updateCartCount(int amount, int cartId) { // object 받기(안에 내용 다 받아야 하니까) // insert하고 싶으면 save
		final String SQL = "UPDATE cart SET amount = ? WHERE id = ?";																																															// update
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			
			// 물음표 완성하기
			pstmt.setInt(1, amount);
			pstmt.setInt(2, cartId);
			
			return pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "updateCartCount : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1; // 실패시
	}
	
	
	public int deleteCartItem(int cartId) { // object 받기(안에 내용 다 받아야 하니까) // insert하고 싶으면 save
		final String SQL = "DELETE FROM cart WHERE id = ?";																																															// update
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			
			// 물음표 완성하기
			pstmt.setInt(1, cartId);
			
			return pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "deleteCartItem : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1; // 실패시
	}
	
	public int deleteCartItems(String data) {
		final String SQL = "DELETE FROM cart WHERE id in "+data;																																													// update
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			
			return pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "deleteCartItems : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1; // 실패시
	}
	
	public int insertCartItem(Cart cart) { // object 받기(안에 내용 다 받아야 하니까) // insert하고 싶으면 save
		final String SQL = "INSERT INTO cart(id, userId, itemId, amount) " + "VALUES(CART_SEQ.nextval,?,?,?) ";																																															// update
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			
			// 물음표 완성하기
			pstmt.setInt(1, cart.getUserId());
			pstmt.setInt(2, cart.getItemId());
			pstmt.setInt(3, cart.getAmount());
			
			return pstmt.executeUpdate();
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "insertCartItem : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt);
		}
		return -1; // 실패시
	}
	
	
	public Cart cartFindById(int userId) {
		final String SQL = "SELECT id, userId, itemId, amount FROM cart WHERE userId = ? ";																																															// update
		Cart cart = null;
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// 물음표 완성하기
			pstmt.setInt(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				cart = Cart.builder()
						.id(rs.getInt(1))
						.userId(rs.getInt(2))
						.itemId(rs.getInt(3))
						.amount(rs.getInt(4))
						.build();
				
			}
			
			return cart;
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "cartFindById : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null; // 실패시
	}
	
	public List<CartDto> findCartDtoListById(int userId) {
		final String SQL = "SELECT cart.id, cart.userId, cart.amount, items.id, items.imgurl, items.name, items.price "
				+ "FROM cart, items "
				+ "where cart.itemid = items.id and cart.userid = ?";
		
		List<CartDto> cartDtos = null;
		
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// 물음표 완성하기
			pstmt.setInt(1, userId);
			
			rs = pstmt.executeQuery();
			
			cartDtos = new ArrayList<>();
			
			while(rs.next()) {
				
				Cart cart = Cart.builder()
						.id(rs.getInt(1))
						.userId(rs.getInt(2))
						.amount(rs.getInt(3))
						.build();
				
				Items item = Items.builder()
						.id(rs.getInt(4))
						.imgUrl(rs.getString(5))
						.name(rs.getString(6))
						.price(rs.getString(7))
						.build();
				
				CartDto cartDto = CartDto.builder()
						.cart(cart)
						.item(item)
						.allPrice(Integer.parseInt(rs.getString(7).replace(",", ""))*rs.getInt(3))
						.build();
				
				cartDtos.add(cartDto);
			}
			
			return cartDtos;
				
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "findCartDtoListById : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null; // 실패시
	}

}
