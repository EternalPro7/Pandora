package web.room.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.room.bean.RoomTypeVO;
import web.roomType.dao.RoomTypeDAO;

public class RoomTypeDAOImpl implements RoomTypeDAO{
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Pandora");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private static final String GET_ALL_STMT ="SELECT * FROM Room_Type";
	
	public List<RoomTypeVO> getAll() {
		List<RoomTypeVO> list = new ArrayList<RoomTypeVO>();
		RoomTypeVO roomTypeVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {

			con = ds.getConnection();
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				roomTypeVO = new RoomTypeVO();
				roomTypeVO.setRoomTypeNo(rs.getInt("Room_Type_No"));
				roomTypeVO.setRoomType(rs.getString("Room_Type"));
				roomTypeVO.setRoomPrice(rs.getInt("Room_Price"));
				roomTypeVO.setMaxCapacity(rs.getInt("Max_Capacity"));
				roomTypeVO.setRoomPicture(rs.getBytes("Room_Picture"));
				list.add(roomTypeVO); // Store the row in the list
			}

			// Handle any driver errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
			// Clean up JDBC resources
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	@Override
	public void insert(RoomTypeVO roomTypeVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(RoomTypeVO roomTypeVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Integer roomTypeNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public RoomTypeVO findByPrimaryKey(Integer roomTypeNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
