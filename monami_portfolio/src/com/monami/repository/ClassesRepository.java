package com.monami.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.monami.db.DBConn;
import com.monami.dto.CartDto;
import com.monami.model.Classes;
import com.monami.model.Items;

public class ClassesRepository {
	private static final String TAG = "ClassRepository : "; // TAG 생성 (오류 발견시 용이)
	private static ClassesRepository instance = new ClassesRepository();

	private ClassesRepository() {
	}

	public static ClassesRepository getInstance() {
		return instance;
	}

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// classItem DB에 넣기
	public int insertClassItem(Classes classes) { // object 받기(안에 내용 다 받아야 하니까) // insert하고 싶으면 save
		final String SQL = "INSERT INTO class(id, imgUrl, aLink) " + "VALUES(CLASS_SEQ.nextval,?,?) "; // update
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);

			// 물음표 완성하기
			pstmt.setString(1, classes.getImgUrl());
			pstmt.setString(2, classes.getAlink());

			return pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println(TAG + "insertClassItem : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return -1; // 실패시
	}

	
	// 아이템 전체 출력
	public List<Classes> findAllClassItems() { // object 받기(안에 내용 다 받아야 하니까)
		final String SQL = "SELECT id, imgUrl, alink FROM class";
		List<Classes> classes = new ArrayList<>();
		try {
			conn = DBConn.getConnection(); // DB에 연결
			pstmt = conn.prepareStatement(SQL);
			// while 돌려서 rs -> java오브젝트에 집어넣기
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Classes classItem = Classes.builder()
								.id(rs.getInt(1))
								.imgUrl(rs.getString(2))
								.alink(rs.getString(3))
								.build();
				classes.add(classItem);
			}
			return classes;
		} catch (SQLException e) {
			e.printStackTrace(); 
			System.out.println(TAG + "findAllClassItems : " + e.getMessage());
		} finally {
			DBConn.close(conn, pstmt, rs);
		}
		return null; // 실패시
	}
	
}
